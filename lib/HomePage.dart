import 'package:camera/camera.dart';
import "package:flutter/material.dart";

import 'main.dart';

class HomePage extends StatefulWidget{
  @override
 _HomePageState createState() =>_HomePageState();

}
class _HomePageState extends State<HomePage>{
  bool isWorking=false;
  String results="";
  late CameraController cameraController;
  late CameraImage imageCamera;

  initCamera(){
    cameraController=CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if(!mounted){
        return;
      }
      setState(){
        cameraController.startImageStream((imageFromStream) => {
          if(!isWorking){
            isWorking=true,
            imageCamera=imageFromStream,

          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/bghome.jpg")
              )
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        color: Colors.black,
                        height: 320,
                        width: 360,
                        child: Image.asset("assets/camera.jpg"),
                      ),
                    ),
                    Center(
                      child: FlatButton(
                        onPressed: () {  },
                        child: Container(
                          margin: EdgeInsets.only(top: 35),
                          height: 270,
                          width: 360,
                          child: imageCamera==null? Container(
                            height: 270,
                            width: 340,
                            child: Icon(Icons.photo_camera_front, color: Colors.blueAccent,size: 40,),
                          ):AspectRatio(
                            aspectRatio: cameraController.value.aspectRatio,
                            child: CameraPreview(cameraController),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

        ),
      )
    );
  }

}