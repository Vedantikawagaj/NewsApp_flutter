import 'package:project/Model/FavItemsModel.dart';
import 'package:flutter/cupertino.dart';

class FavItems extends ChangeNotifier {
  int _count = 0;
  List<FavItemsModel> items = [];

  // void addCount() {
  //   _count++;
  //   notifyListeners();
  // }

  void addFavItems(FavItemsModel data) {
    items.add(data);
    notifyListeners();
  }

  // int get count {
  //   return _count;
  // }

  List<FavItemsModel> get favItemsList {
    return items;
  }
}