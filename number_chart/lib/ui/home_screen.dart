import 'package:flutter/material.dart';
import 'package:number_chart/model/user_model.dart';
import 'package:number_chart/utils/util.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../res/component_style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<UserModel> _listData = [];

  @override
  void initState() {
    ServiceGame sv1 = ServiceGame(typeService: 'Lo', quantity: 100);
    ServiceGame sv2 = ServiceGame(typeService: 'De', quantity: 150);
    ServiceGame sv3 = ServiceGame(typeService: 'BC', quantity: 90);
    ServiceGame sv4 = ServiceGame(typeService: 'De', quantity: 56);
    ServiceGame sv5 = ServiceGame(typeService: 'De', quantity: 23);
    ServiceGame sv6 = ServiceGame(typeService: 'De', quantity: 111);
    List<ServiceGame> listServices = [];
    listServices.add(sv1);
    listServices.add(sv2);
    listServices.add(sv3);
    listServices.add(sv4);
    listServices.add(sv5);
    listServices.add(sv6);
    UserModel u1 = new UserModel(
        userPhone: '012365487',
        userName: 'test1',
        services: listServices,
        totalBuy: 750000,
        totalReward: 0);
    UserModel u2 = new UserModel(
        userPhone: '012365487',
        userName: 'test2',
        services: listServices,
        totalBuy: 100000,
        totalReward: 1000);
    UserModel u3 = new UserModel(
        userPhone: '012365487',
        userName: 'test3',
        services: listServices,
        totalBuy: 120000,
        totalReward: 20);
    UserModel u4 = new UserModel(
        userPhone: '012365487',
        userName: 'test4',
        services: listServices,
        totalBuy: 150000,
        totalReward: 30);
    UserModel u5 = new UserModel(
        userPhone: '012365487',
        userName: 'test5',
        services: listServices,
        totalBuy: 80000,
        totalReward: 0);
    _listData.add(u1);
    _listData.add(u2);
    _listData.add(u3);
    _listData.add(u4);
    _listData.add(u5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userModel = Provider.of<UserModel>(context);
    return ChangeNotifierProvider(
      create: (_) => UserModel(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: darkStatusBar,
        child: Scaffold(
          body: SafeArea(
            child: DataTable(
              dataRowHeight: (MediaQuery.of(context).size.height - 56)/8,
              columnSpacing: 0.5,
              horizontalMargin: 16,
              columns: [
                DataColumn(
                  label: Text(
                    Strings.customer,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    Strings.typeGame,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    Strings.priceBuy,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    Strings.priceReward,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: _dataItemChart(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            onPressed: () {
              // userModel.userName = "0123456789";
              // context.read<UserModel>().increment();
              setState(() {});
            },
            child: Icon(Icons.change_history),
          ),
        ),
      ),
    );
  }

  List<DataRow> _dataItemChart() {
    return List.generate(_listData.length, (idx) {
      return DataRow(cells: [
        _userGame(_listData[idx].userName, _listData[idx].userPhone),
        _typeUserGame(_listData[idx]),
        _priceBuy(_listData[idx].totalBuy.toString()),
        _priceReward(_listData[idx].totalReward.toString()),
      ]);
    });
  }

  _userGame(String name, String phone) {
    return DataCell(Container(
      width: (MediaQuery.of(context).size.width / 4) - 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name ?? "...", style: normalTextStyle),
          SizedBox(height: 8),
          Text(phone ?? "...", style: normalTextStyle),
        ],
      ),
    ));
  }

  _typeUserGame(UserModel userModel) {
    return DataCell(Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: (MediaQuery.of(context).size.width / 4) - 0.5,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            itemCount: userModel.services.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: index < userModel.services.length -1 ? 3 : 0),
                child: Text(
                    '${userModel.services[index].typeService} x ${userModel.services[index].quantity}'),
              );
            }),
      ),
    ));
  }

  _priceBuy(String priceBuy) {
    return DataCell(Container(
        width: (MediaQuery.of(context).size.width / 4) - 0.5,
        child: Text(
          priceBuy,
          style: normalTextStyle,
        )));
  }

  _priceReward(String priceReward) {
    return DataCell(Container(
        width: (MediaQuery.of(context).size.width / 4) - 0.5,
        child: Text(
          priceReward,
          style: normalTextStyle,
        )));
  }
}
