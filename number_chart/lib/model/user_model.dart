import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier , DiagnosticableTreeMixin{
  String _userPhone = '0964348059';
  String _userName = 'Tung';
  List<ServiceGame> _services;
  int _totalBuy = 100000;
  int _totalReward = 0;

  UserModel({String userPhone, String userName,List<ServiceGame> services,
    int totalBuy, int totalReward}){
    this._userPhone = userPhone;
    this._userName = userName;
    this._services = services;
    this._totalBuy = totalBuy;
    this._totalReward = totalReward;
  }
  void increment() {
    _totalBuy++;
    notifyListeners();
  }



  List<ServiceGame> get services => _services;

  set services(List<ServiceGame> services){
    this._services = services;
    notifyListeners();
  }

  String get userPhone => _userPhone;

  String get userName => _userName;


  int get totalBuy => _totalBuy;

  int get totalReward => _totalReward;

  set userPhone(String userPhone) {
    _userPhone = userPhone;
    notifyListeners();
  }

  set userName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  set totalBuy(int totalBuy) {
    _totalBuy = totalBuy;
    notifyListeners();
  }

  set totalReward(int totalReward) {
    _totalReward = totalReward;
    notifyListeners();
  }


}

class ServiceGame with ChangeNotifier , DiagnosticableTreeMixin{
  String _typeService;
  int _quantity;

  ServiceGame({String typeService,int quantity}){
    this._typeService = typeService;
    this._quantity = quantity;
  }

  String get typeService => _typeService;
  int get quantity => _quantity;

  set typeService(String typeService) {
    _typeService = typeService;
    notifyListeners();
  }
  set quantity(int quantity) {
    _quantity = quantity;
    notifyListeners();
  }

}
