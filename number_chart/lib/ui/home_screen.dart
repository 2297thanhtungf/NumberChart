import 'package:flutter/material.dart';
import 'package:number_chart/model/user_model.dart';
import 'package:number_chart/utils/util.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import '../res/component_style.dart';
import '../res/component_style.dart';
import '../utils/ct_colors.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var userModel = Provider.of<UserModel>(context);
    return ChangeNotifierProvider(
      create: (_) => UserModel(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: darkStatusBar,
        child: Scaffold(
          body: SafeArea(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    _titleChart(Strings.customer),
                    _titleChart(Strings.typeGame),
                    _titleChart(Strings.quantity),
                    _titleChart(Strings.priceBuy),
                    _titleChart(Strings.priceReward),
                  ],),
                  Expanded(child: ListView(

                  ))
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            onPressed: (){
              // userModel.userPhone = "0123456789";
              context.read<UserModel>().increment();
              setState(() {
              });
            },
            child: Icon(Icons.change_history),
          ),
        ),
      ),
    );
  }
  _titleChart(String title){
    return Row(
      children: [
        Container(
          height: 50,
          width: (MediaQuery.of(context).size.width/5) - 0.5,
          color: mainColor,
          child: Center(child: Text(title,style:normalTextStyleWhite)),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8),
          child: VerticalDivider(width: 0.5,),
        ),
      ],
    );
  }
}
