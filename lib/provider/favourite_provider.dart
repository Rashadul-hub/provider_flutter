
import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier{

  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void addItem(int newValue){
    _selectedItem.add(newValue);
    notifyListeners();
  }
  void removeItem(int newValue){
    _selectedItem.remove(newValue);
    notifyListeners();
  }

}