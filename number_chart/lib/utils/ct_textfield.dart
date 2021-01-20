
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_chart/res/component_style.dart';

import 'ct_colors.dart';

/*_demoTextField() {
  return NPTextField(
    onTap: (){},
    textInputAction: TextInputAction.next,
    controller: TextEditingController(),
    keyboardType: TextInputType.text,
    readOnly: false,
    textCapitalization: TextCapitalization.none,
    inputFormat: [],
    maxLength: 50,
    onChange: (text){},
    hintText: "hahahaha",
  );
}*/

class CTTextField extends StatefulWidget {
  final TextEditingController controller;
  final int maxLength;
  final String labelText;
  final String textError;
  final bool readOnly;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Function() onTap;
  final Function() unFocus;
  final List<TextInputFormatter> inputFormat;
  final TextInputType keyboardType;
  final Function(String text) onChange;
  final bool autoFocus;
  final Color color;
  final  FocusNode focusNode;

  const CTTextField({
    Key key,
    @required this.controller,
    this.maxLength = 100,
    @required this.keyboardType,
    @required this.inputFormat,
    @required this.onChange,
    @required this.labelText,
    this.textError = "",
    this.readOnly = false,
    @required this.onTap,
    @required this.textInputAction,
    this.textCapitalization,
    this.autoFocus = true,
    this.color = Colors.white, this.unFocus, this.focusNode,
  }) : super(key: key);

  @override
  _NPAuthTextFieldState createState() => _NPAuthTextFieldState();
}

class _NPAuthTextFieldState extends State<CTTextField> with AfterLayoutMixin {
  FocusNode focusNode;
  bool isShowKeyboard = true;
  bool isShowLabel = false;
  @override
  void initState() {
//    if (Platform.isAndroid) {
//      SystemChannels.lifecycle.setMessageHandler((msg) {
//        if (msg == AppLifecycleState.resumed.toString()) {
//          if (isShowKeyboard) {
//            Future.delayed(Duration(milliseconds: 300), () {
//              focusNode.requestFocus();
//            });
//          }
//        }
//        if (msg == AppLifecycleState.paused.toString()) {
//          if (mounted) {
//            setState(() {
//              isShowKeyboard = focusNode.hasFocus;
//            });
//          }
//          focusNode.unfocus();
//        }
//        return;
//      });
//    }
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      if(!focusNode.hasFocus) if(widget.unFocus != null ) widget.unFocus();
      setState(() {
        isShowLabel = focusNode.hasFocus || widget.controller.text.isNotEmpty;
      });
    });
    widget.controller.addListener(() {
      isShowLabel = focusNode.hasFocus || widget.controller.text.isNotEmpty;
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Material(
          child: InkWell(
            onTap: (){
              setState(() {});
              widget.onTap();
              FocusScope.of(context).requestFocus(focusNode);
            },
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        if( widget.color == Colors.white)BoxShadow(
                          color:Color(0xff14000000) ,
                          blurRadius: 8,
                          offset: Offset(0, 0.92), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                          color: widget.textError.isNotEmpty
                              ? Colors.red
                              : focusNode.hasFocus ? mainColor : Colors.transparent,
                          width: 0.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: isShowLabel? 2: 1,),
                      AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          opacity: isShowLabel ? 1:0,
                          child: Visibility(
                            visible: isShowLabel,
                            child: Container(
                              height: 16,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16, right: 16),
                                child: Text(
                                  widget.labelText,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 11, color: widget.textError.isNotEmpty
                                      ? Colors.red
                                      : widget.color== Colors.white ?Color(0xffA3A3A3): Color(0xffA3A3A3).withOpacity(0.45)),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: isShowLabel? 2: 0),
                      Container(
                        height: 20,
                        child: Center(
                          child: TextFormField(
                            textInputAction: widget.textInputAction,
                            textCapitalization: widget.textCapitalization,
                            focusNode: focusNode,
                            autofocus: widget.autoFocus,
                            enabled: !widget.readOnly,
                            onTap:  (){},
                            readOnly: widget.readOnly,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(fontSize: 14, color: widget.color== Colors.white ? Colors.black : Colors.black.withOpacity(0.45)),
                            controller: widget.controller,
                            maxLength: widget.maxLength,
                            keyboardType: widget.keyboardType,
                            maxLines: 1,
                            autofillHints: null,
                            onChanged: (text) {
                              widget.onChange(text);
                              setState(() {
                              });
                            },
                            onFieldSubmitted: (term) {
                              if (widget.textInputAction == TextInputAction.next) {
                                FocusScope.of(context).nextFocus();
                              } else if (widget.textInputAction == TextInputAction.done) {
                                FocusScope.of(context).requestFocus(FocusNode());
                              }
                            },
                            inputFormatters: widget.inputFormat,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 16, right: 40),
                              hintText: isShowLabel ? "": widget.labelText,
                              counterText: "",
                              hintStyle: TextStyle(fontSize: 14, color: widget.color== Colors.white ? hintTextField : hintTextField.withOpacity(0.45)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible:
                  ((focusNode.hasFocus && widget.controller.text.isNotEmpty) || widget.readOnly) && widget.color == Colors.white,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(
                      widget.readOnly ? Icons.keyboard_arrow_down : Icons.close,
                      color: widget.textError.isNotEmpty ? errorTextField : blackColor,
                    ),
                    iconSize: 24,
                    onPressed: widget.readOnly
                        ? null
                        : () {
                      widget.onChange('');
                      widget.controller.clear();
                      widget.onChange("");
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: widget.textError.isNotEmpty ? 6 : 0),
        Visibility(
            visible: widget.textError.isNotEmpty,
            child: Text(widget.textError,
                maxLines: 2, overflow: TextOverflow.ellipsis, style: errorTextStyle))
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      isShowLabel = focusNode.hasFocus || widget.controller.text.isNotEmpty;
    });
  }
}
