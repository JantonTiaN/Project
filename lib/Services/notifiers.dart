import 'package:flutter/cupertino.dart';

class MultipleNotifier extends ChangeNotifier {
  List<String> _selectedItems;
  MultipleNotifier(this._selectedItems);
  List<String> get selectedITems => _selectedItems;

  bool isHaveItem(String value) => _selectedItems.contains(value);

  addTime(String value) {
    if (!isHaveItem(value)) {
      _selectedItems.add(value);
      notifyListeners();
    }
  }

  removeItem(String value) {
    if (isHaveItem(value)) {
      _selectedItems.remove(value);
      notifyListeners();
    }
  }
}
