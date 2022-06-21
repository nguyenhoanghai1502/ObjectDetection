import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'HomePage.dart';

class MySplashPage extends StatefulWidget{

  @override
  _MySplashPageState createState() => _MySplashPageState();}
class _MySplashPageState extends State<MySplashPage>{
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 12,
      navigateAfterSeconds: HomePage()  ,
      imageBackground: Image.asset("assets/aibg.jpg").image,
      useLoader: true,
      loaderColor: Colors.pink,
      loadingText: Text("Loading...", style: TextStyle(color: Colors.white),),
    );
  }

}
