import 'package:finalproject/auth.dart';
import 'package:finalproject/pages/home_page.dart';
import 'package:finalproject/pages/signup_page.dart';
import 'package:finalproject/pages/login_page.dart';
import 'package:finalproject/screens/HomePageFactories.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return HomePageFactories();
          }
          else{
            return Homepage();
          }
    });
  }
}
