import 'dart:async';
import "package:flutter/material.dart";
import 'package:kdemy/Auth/SignIn/sign_in.dart';
import 'package:kdemy/Auth/SignUp/sign_up.dart';
class Splash extends StatefulWidget {
  const Splash({ Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();

    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 3000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpUI()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Container(
          height: 120,
          width: 120,
          child: Image.asset('assets/wolo_logo_update.png'),
        ),
      ),
    );
  }
}

