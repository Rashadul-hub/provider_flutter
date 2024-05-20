import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/example_screens/favourite/my_favourite_lists_screen.dart';
import 'package:provider_flutter/provider/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {


  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Favourite App'),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyFavouriteListsScreen()));
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('My Favourites'),
                Icon(Icons.favorite_sharp),
              ],
            ),
          ),
          SizedBox(width: 4,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
                itemBuilder: (context,index){
                return Consumer<FavouriteProvider>(builder: (context, value , child){
                  return ListTile(
                    onTap: (){
                      if (value.selectedItem.contains(index)){

                        value.removeItem(index);

                      }else{
                      value.addItem(index);
                      }

                    },
                    title: Text('Item '+index.toString()),
                    trailing: Icon(
                        value.selectedItem.contains(index)? Icons.favorite : Icons.favorite_border_outlined),
                  );
                });
            }),
          )
        ],
      ),
    );
  }
}
