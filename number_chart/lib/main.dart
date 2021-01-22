import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_chart/res/component_style.dart';
import 'package:provider/provider.dart';
import 'login/login.dart';
import 'model/user_model.dart';
import 'utils/util.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserModel()),
    ],
    child: Main(),
  ),);
}
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.titleApp,
      theme: ThemeData(
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        cupertinoOverrideTheme: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
              dateTimePickerTextStyle: boldNoScaleTextStyle,
              pickerTextStyle: normalTextStyle,
            )),
      ),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: Login(),
    );
  }
}
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'model/user_model.dart';
// import 'model/user_model.dart';
// import 'model/user_model.dart';
//
// /// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].
//
// void main() {
//   runApp(
//     /// Providers are above [MyApp] instead of inside it, so that tests
//     /// can use [MyApp] while mocking the providers
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => UserModel()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
//
// /// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// // ignore: prefer_mixin
// class Counter with ChangeNotifier, DiagnosticableTreeMixin {
//   int _count = 0;
//
//   int get count => _count;
//
//   void increment() {
//     _count++;
//     notifyListeners();
//   }
//
//   /// Makes `Counter` readable inside the devtools by listing all of its properties
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(IntProperty('count', count));
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('You have pushed the button this many times:'),
//
//             /// Extracted as a separate widget for performance optimization.
//             /// As a separate widget, it will rebuild independently from [MyHomePage].
//             ///
//             /// This is totally optional (and rarely needed).
//             /// Similarly, we could also use [Consumer] or [Selector].
//             // Count(),
//             Text('${context.watch<UserModel>().totalBuy}'),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         key: const Key('increment_floatingActionButton'),
//
//         /// Calls `context.read` instead of `context.watch` so that it does not rebuild
//         /// when [Counter] changes.
//         onPressed: () => context.read<UserModel>().increment(),
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class Count extends StatelessWidget {
//   const Count({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//         /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
//         '${context.watch<Counter>().count}',
//         key: const Key('counterState'),
//         style: Theme.of(context).textTheme.headline4);
//   }
// }
