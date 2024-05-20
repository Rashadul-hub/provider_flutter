import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavouriteListsScreen extends StatefulWidget {
  const MyFavouriteListsScreen({super.key});

  @override
  State<MyFavouriteListsScreen> createState() => _MyFavouriteListsScreenState();
}

class _MyFavouriteListsScreenState extends State<MyFavouriteListsScreen> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Favourites'),

      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavouriteProvider>(builder: (context, value , child){
              return ListView.builder(
                itemCount: value.selectedItem.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // Show the selected favourite Item Title
                      title: Text('Item ${value.selectedItem[index]}'),

                      trailing: InkWell(
                          onTap: (){
                            // Remove the item when the icon is tapped
                            value.removeItem(value.selectedItem[index]);
                          },
                          child: const Icon(Icons.remove))
                  );
                },
              );
            })
          ),
        ],
      ),
    );
  }
}
