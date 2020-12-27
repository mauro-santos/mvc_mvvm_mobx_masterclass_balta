import 'package:flutter/material.dart';
import 'package:mvc_mvvm_mobx_masterclass_balta/stores/app.store.dart';
import 'package:mvc_mvvm_mobx_masterclass_balta/views/signup.view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppStore>.value(
          value: AppStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SignupView(),
      ),
    );
  }
}
