
import 'package:flutter/foundation.dart';

class SliderColorChangeProvider with ChangeNotifier{


  double _value = 1.0;
  double get value => _value;


  void setValue(double newValue){
    _value = newValue;
    notifyListeners();
  }



}