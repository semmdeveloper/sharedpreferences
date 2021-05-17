import 'package:flutter/material.dart';
import 'package:pdpsharedpref/home_page.dart';
import 'package:pdpsharedpref/signup_page.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:HomePage(),
      routes:{
        HomePage.id:(context)=>HomePage(),
        SignUp.id:(context)=>SignUp(),
      },
      debugShowCheckedModeBanner:false,
    );
  }
}

