import 'package:flutter/material.dart';
import 'package:number_chart/model/user_model.dart';
import 'package:number_chart/utils/util.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var userModel = Provider.of<UserModel>(context);
    return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(userModel.userPhone),
        ),
        body: Center(
          child: Container(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: (){

          },
          child: Icon(Icons.change_history),
        ),
      ),
    );
  }
}
