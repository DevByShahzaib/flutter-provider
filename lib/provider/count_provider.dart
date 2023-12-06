import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier{
   int _count = 0;
   int get counter => _count;

   void setCounter(){
      _count++;
      notifyListeners();
   }
}