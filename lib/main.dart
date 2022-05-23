

import 'package:cooking_app/loading/intro.dart';
import 'package:cooking_app/models/translator.dart';
import 'package:cooking_app/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'models/shared.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    VoiceController _voiceController;
  _voiceController = FlutterTextToSpeech.instance.voiceController();
  await _voiceController.init();
  //Wakelock.enable();
  SystemChrome.setEnabledSystemUIOverlays([]);
  await Firebase.initializeApp();
 String language='en';
 await UserSimplePreferences.init();
  UserSimplePreferences shared=new UserSimplePreferences();
  language=shared.getDialogue()?? "en";
  name=shared.getName()?? "";
  if(name!=""){
   nameagain=false;
  }
  print(language);
  runApp(Provider(
    create: (_)=> LanguageTranslator(language: language),
      child: MyApp(controller: _voiceController,)));
}
bool nameagain=true;
String name;
class MyApp extends StatelessWidget {
  final controller;
  MyApp({this.controller});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: nameagain? Introduction(controller: controller,):Dashboard());
      // home: In
  }
}

