
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:cooking_app/models/shared.dart';
import 'package:cooking_app/models/translator.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';
import 'package:translator/translator.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe;
  final image;
  final Direct;
  List listOfingre;
  RecipeDetails({this.Recipe,this.image,this.Direct,this.listOfingre,Key key}) : super(key: key);

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState(Recipy: Recipe,image: image,Direct: Direct,listOfingre:listOfingre);
}

class _RecipeDetailsState extends State<RecipeDetails> {
  final Recipy;
  final image;
  dynamic Direct;
  List  listOfingre=[];

   _RecipeDetailsState({this.Recipy,this.image,this.Direct,this.listOfingre});
  final translator = GoogleTranslator();
  var language;

  UserSimplePreferences shared=new UserSimplePreferences();
  VoiceController _voiceController;
    LanguageTranslator translate=new LanguageTranslator();
String recp='';
String ingre='Ingredients';
String direc='Directions';
String ddata="one teaspoon of chili sauce";
Timer timer;
  List ingi=['han','na','g'];
  void initState(){
   // print("${listOfingre}ye nai wali classki hy");
    ingi=listOfingre;
    // print(ingre[2]);
    // print(Direct);
    _voiceController = FlutterTextToSpeech.instance.voiceController();
    _voiceController.init();

Timer(Duration(seconds: 3),(){
  setState(() {
    // direc=translateData('Directions')??'Directions';
    // ingre=translateData('Ingredients')??'Ingredients';
    // recp=translateData(Recipy)?? Recipy;
    // ddata= translateData(Direct) ?? Direct;

  });
});


    super.initState();
  }
  coverters()async{

  }
dynamic output;
  String direction="one teaspoon of chili sauce";
  @override
  void dispose() {
    _voiceController.stop();
    super.dispose();
  }
  double count=0;
  bool favIcon=false;

  @override
  Widget build(BuildContext context){
    final trans= Provider.of<LanguageTranslator>(context);



    return Scaffold(
      appBar: AppBar(
        //title: Text(trans.translateByFuture(Recipy).toString(),style: TextStyle(
        title: Text(Recipy.toString(),style: TextStyle(
    color: Colors.white,
    fontFamily: 'Pro',
    fontSize: MediaQuery.of(context).size.width*0.055,
    fontWeight: FontWeight.bold
    ),),
    actions: [
    Padding(
    padding:EdgeInsets.all(8.0),
    child: Container(
    width:MediaQuery.of(context).size.width*0.14,
    decoration: BoxDecoration(
    border: Border.all(color: Colors.white),
    shape: BoxShape.circle,
    image: DecorationImage(
    image: AssetImage('images/logo.png'),fit: BoxFit.fitWidth
    ),
    )
    ),
    )

    ],
    iconTheme: IconThemeData(
    color: Colors.white
    ),
    elevation: 100,
    centerTitle: true,
    backgroundColor: Colors.black,
    // backgroundColor: Colors.amber.shade800,

    toolbarHeight: MediaQuery.of(context).size.width*0.2,
    ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
             image: AssetImage("images/hori.jpg"),
              fit: BoxFit.fill
          )),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width*0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  // colorFilter:
                  // ColorFilter.mode(Colors.black.withOpacity(0.2),BlendMode.colorBurn),
                    image:(image!= null)?NetworkImage(image):AssetImage("images/error.png"),fit: BoxFit.fill
                ),
              ),
            ),
            Expanded(
              child: Container(
                  child:ListView(
                    children: [
                        Cards("hello", "hang"),
                        CardsStep("hello", "hang",direction),

                    ],)

              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle styles(size){
    return TextStyle(
        fontFamily: 'Pro',
        color: Colors.white,
        fontSize:size,
        fontWeight: FontWeight.bold
    );
  }
  Widget Cards(title,image){
    return Padding(
      padding:EdgeInsets.all(5.0),
      child: Container(
        height: MediaQuery.of(context).size.width*0.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(25),
        ),

        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.width*0.1,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(ingre,style: styles(MediaQuery.of(context).size.width*0.05),),
                    IconButton(icon: Icon(Icons.volume_up),color: Colors.white,iconSize: 30,
                        onPressed:(){

                          _voiceController.speak(
                            " ${ingi.toString()}",
                            VoiceControllerOptions(
                              volume: 1,
                              speechRate: 0.65,
                            ),
                          );
                    }),
                    // IconButton(icon: Icon(Icons.language),color: Colors.white,iconSize: 30,
                    //     onPressed:(){
                    //        setState(() {
                    //          ingre=translateData(ingre);
                    //        });
                    //
                    //     }),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.width*0.035),
              Container(
                height: MediaQuery.of(context).size.width*0.25,
                width: MediaQuery.of(context).size.width,
                
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for(int i=0;i<ingi.length;i++)
                              Text("(${i+1})  ${ingi[i]}",softWrap: true,style: styles(MediaQuery.of(context).size.width*0.041,),),
                           ],
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CardsStep(title,image,direction){
    return Padding(
      padding:EdgeInsets.all(5.0),
      child: Container(
        height: MediaQuery.of(context).size.width*0.65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(25),
        ),

        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width*0.1,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(direc,style: styles(MediaQuery.of(context).size.width*0.055),),
                    IconButton(icon: Icon(Icons.volume_up),color: Colors.white,iconSize: 30,
                        onPressed:(){

                          _voiceController.speak(
                          Direct.toString(),
                            VoiceControllerOptions(
                                volume: 1,
                                speechRate: 0.65,



                            ),
                          );

                        }),
                    // IconButton(icon: Icon(Icons.language),color: Colors.white,iconSize: 30,
                    //     onPressed:(){
                    //       setState(() {
                    //         Direct=translatedieData(Direct).toString();
                    //       });
                    //
                    //     }),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width*0.02,
              ),
              Container(
                height: MediaQuery.of(context).size.width*0.38,
                width: MediaQuery.of(context).size.width,

                child: SingleChildScrollView(
                  child: Text(Direct.toString()??"empty Directions",softWrap: true,style: styles(MediaQuery.of(context).size.width*0.045),))
              ),
            ],
          ),
        ),
      ),
    );
  }
  _playVoice(data) {
    //_voiceController.init().then((_) {
      _voiceController.speak(
        data,
        VoiceControllerOptions(
            volume: 1,
            pitch:0.5
        ),
      );
    //});
  }
dynamic data;
dynamic translateData(input){

    language=shared.getDialogue()?? "en";
   translator
        .translate(input, to: language.toString())
        .then((result) {
          setState(() {
            data=result.toString();
            print('$data loading');
          });
        });
  return data;
  }
  dynamic didata;
dynamic translatedieData(input){

    language=shared.getDialogue()?? "en";
   translator
        .translate(input, to: language.toString())
        .then((result) {
          setState(() {
            didata=result.toString();
          });
        });
  return didata;
  }

}
