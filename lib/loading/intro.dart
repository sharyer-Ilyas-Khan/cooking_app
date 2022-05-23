import 'dart:async';

import 'package:cooking_app/models/shared.dart';
import 'package:cooking_app/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';
class Introduction extends StatefulWidget {
  final controller;
  const Introduction({this.controller,Key key}) : super(key: key);

  @override
  _IntroductionState createState() => _IntroductionState(controller: controller);
}

class _IntroductionState extends State<Introduction> {
  final controller;
  _IntroductionState({this.controller});
 // VoiceController _voiceController;
  String text="Hi Chef!\nI am your Cooking Assistant.\nEnter your Name";
  @override
  void initState(){

  //   _voiceController = FlutterTextToSpeech.instance.voiceController();
  // await _voiceController.init();



    Timer(Duration(milliseconds: 2000),(){
      controller.speak(
       text,
        VoiceControllerOptions(
          volume: 1,
          speechRate:1,



        ),);
    });
    super.initState();
  }
  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  String name;
  UserSimplePreferences shared=new UserSimplePreferences();
  setSelectedRadio(String val) {
    setState(() {
      print(val);
      name = val;
      shared.setName(name);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.red,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image:AssetImage("images/intro.jpg"),fit: BoxFit.fill
              )

        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image(
                    height: MediaQuery.of(context).size.width*0.5,
                    width: MediaQuery.of(context).size.width*0.5,
                    image: AssetImage(
                  "images/logo.png"
                )),
              ),
              SizedBox(height:  MediaQuery.of(context).size.width*0.25),
              Padding(
                padding:  EdgeInsets.only(left:15.0),
                child: Text(text,style: styles(MediaQuery.of(context).size.width*0.07,Colors.white,),),
              ),
              Container(
                height: MediaQuery.of(context).size.width*0.2,
                width: MediaQuery.of(context).size.width*0.9,
                //color: Colors.white,
                child: TextField(

                  style: styles(MediaQuery.of(context).size.width*0.05,Colors.blue,),
                  decoration: InputDecoration(

                   hintText: "Name",
                    hintStyle: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Pro'
                    )
                  ),
                  onChanged: (val){
                    setSelectedRadio(val);

                  },
                ),
              ),
             SizedBox(height:  MediaQuery.of(context).size.width*0.05,),
             InkWell(
               onTap: (){
                 FocusManager.instance.primaryFocus?.unfocus();
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Dashboard()));
               },
               child: Container(
                 height: MediaQuery.of(context).size.width*0.13,
                 width: MediaQuery.of(context).size.width*0.85,
                 decoration: BoxDecoration(
                   color: Colors.blueAccent,
                   border: Border.all(color:Colors.blueAccent, ),
                   borderRadius: BorderRadius.circular(23)
                 ),
                 child: Center(
                   child: Text('Next',style: styles(MediaQuery.of(context).size.width*0.055,Colors.white,),
                   ),
                 ),
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }
  TextStyle styles(size,color){
    return TextStyle(
        fontFamily: 'Pro',
        color: color,
        fontSize:size,
        fontWeight: FontWeight.bold
    );
  }
}
