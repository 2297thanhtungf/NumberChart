import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier {
  String _userPhone = '0964348059';
  String _userName = 'Tung';
  Map<String, int> _quantityTypeGame = {'Lo':50,'De':10};
  double _totalBuy = 100000;
  double _totalReward = 0;

  String get userPhone => _userPhone;

  String get userName => _userName;

  Map<String, int> get quantityTypeGame => _quantityTypeGame;

  double get totalBuy => _totalBuy;

  double get totalReward => _totalReward;

  set userPhone(String userPhone) {
    _userPhone = userPhone;
    notifyListeners();
  }

  set userName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  set quantityTypeGame(Map<String, int> quantityTypeGame) {
    _quantityTypeGame = quantityTypeGame;
    notifyListeners();
  }

  set totalBuy(double totalBuy) {
    _totalBuy = totalBuy;
    notifyListeners();
  }

  set totalReward(double totalReward) {
    _totalReward = totalReward;
    notifyListeners();
  }


}
