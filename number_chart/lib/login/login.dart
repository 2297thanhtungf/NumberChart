import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_chart/res/component_style.dart';
import 'package:number_chart/ui/home_screen.dart';
import 'package:number_chart/utils/ct_textfield.dart';
import 'package:number_chart/utils/mask_text_input_formatter.dart';
import 'package:number_chart/utils/util.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controller;
  var maskTextInputFormatter;

  @override
  void initState() {
    _controller = TextEditingController();
    maskTextInputFormatter = MaskTextInputFormatter(mask: "#### ### ###", filter: {"#": RegExp(r'[0-9]')}, max: 12);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.titleLogin),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: CTTextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  maxLength: 12,
                  inputFormat: [maskTextInputFormatter],
                  onChange: (text){

                  },
                  labelText: "Nhập số điện thoại",
                  onTap: (){},
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.none,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 44,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10),
                ),
                color: Color(0xff2E5A90),
                child: Text(Strings.titleLogin,style: btnTextStyleCustom(Colors.white),),
                onPressed: (){
                  Future.delayed(Duration(milliseconds: 100),(){Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                  });

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}




