import 'dart:async';

import 'package:cooking_app/models/shared.dart';
import 'package:cooking_app/models/translator.dart';
import 'package:cooking_app/screens/Category.dart';
import 'package:cooking_app/screens/desert.dart';
import 'package:cooking_app/screens/fruits.dart';
import 'package:cooking_app/screens/soups.dart';
import 'package:cooking_app/screens/apitizer.dart';
import 'package:cooking_app/screens/languages.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:translator/translator.dart';
import 'package:provider/provider.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String name;
  String language;
  UserSimplePreferences shared=new UserSimplePreferences();
  final translate = new LanguageTranslator();
  @override
  void initState() {
    FocusManager.instance.primaryFocus?.unfocus();
    name= shared.getName() ?? "";
    language= shared.getDialogue().toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final trans= Provider.of<LanguageTranslator>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Recipes",style: TextStyle(
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
      drawer: Drawer(
        elevation: 20,
        child: ListView(
          children: [
            Container(
                height: MediaQuery.of(context).size.width*0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/head.jpg'),fit: BoxFit.fill
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width*0.5,
                  width: MediaQuery.of(context).size.width*0.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("images/logo.png")
                    )
                  ),
                 ),
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Text("Hi Chef!\n${name}\nLets Cook",softWrap: true,style: TextStyle(
                    color: Colors.white,
                    fontSize:  MediaQuery.of(context).size.width*0.05,
                    fontFamily: 'Pro'
                  ),),
                )
              ],
            )
            ),
           InkWell(
               onTap: (){

                 print(name);
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>Languages()));
               },
               child: ListTile(title: Text("Languages",style: styles(MediaQuery.of(context).size.width*0.04,Colors.black),),
                 subtitle: Text("Tap to Select",style: styles(MediaQuery.of(context).size.width*0.025,Colors.black),),
                 leading: Icon(Icons.language,color: Colors.blue,size: 35,),)),
            Divider(thickness: 1.5),

            InkWell(
                onTap: (){
                  // showDialog(
                  //       useSafeArea: true,
                  //       context: context,
                  //       builder: (context)=>showRateDialoge());
                  },
                 // rateReviewApp();
                 // Navigator.push(context, MaterialPageRoute(builder: (_)=>Languages()));

                child: ListTile(title: Text("Rate Us",style: styles(MediaQuery.of(context).size.width*0.04,Colors.black),),
                  subtitle: Text("5 Stars",style: styles(MediaQuery.of(context).size.width*0.025,Colors.black),),
                  leading: Icon(Icons.star,color: Colors.amber,size: 35,),)),
            Divider(thickness: 1.5),


          ],
        )
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/hori.jpg"),
            fit: BoxFit.fill
            )

            ),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: ListView(
           // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("  Appetizers",style: styles(MediaQuery.of(context).size.width*0.04,Colors.white),),
              Container(
                  height: MediaQuery.of(context).size.width*0.4,
                  width: MediaQuery.of(context).size.width,
                  child:Appetizers()),
              Text("  Categories",style: styles(MediaQuery.of(context).size.width*0.04,Colors.white),),
              Container(
                  height: MediaQuery.of(context).size.width*0.5,
                  width: MediaQuery.of(context).size.width,
                  child: Categories()),
              Text(" Soups",style: styles(MediaQuery.of(context).size.width*0.04,Colors.white),),
              Container(
                  height: MediaQuery.of(context).size.width*0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Soups()),
              Text(" Deserts",style: styles(MediaQuery.of(context).size.width*0.04,Colors.white),),
              Container(
                  height: MediaQuery.of(context).size.width*0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Deserts()),
              Text(" Fruits",style: styles(MediaQuery.of(context).size.width*0.04,Colors.white),),
              Container(
                  height: MediaQuery.of(context).size.width*0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Fruit()),


            ],
          ),
        ),
      ),
    );
  }
  // Widget showRateDialoge() {
  //   return
  //     RatingDialog(
  //   bgimage:Image(image: AssetImage("images/intro.jpg"),
  // // height: MediaQuery.of(context).size.height,
  // // width: MediaQuery.of(context).size.width,
  //  fit: BoxFit.fill,
  //       ),
  //       buttonColor: Colors.blue,
  //       sizeofbuttontext: 18,
  //       sizeoficon: MediaQuery.of(context).size.width*0.1,
  //       sizeofmessage: MediaQuery.of(context).size.width*0.04,
  //       sizeoftitle:MediaQuery.of(context).size.width*0.06,
  //       colorofunrated: Colors.white38,
  //       glowrad: 20,
  //       // your app's name?
  //       title: 'Rate US',
  //       // encourage your user to leave a high rating?
  //       message: 'Tap a star to set your rating.',
  //       // your app's logo
  //       image: Image(image: AssetImage("images/logo.png"), height:MediaQuery.of(context).size.width*0.35,),
  //       submitButton: 'Rate',
  //       onCancelled: () {
  //         // rate=false;
  //         setState(() {
  //           //rate=false;
  //           //UserSimplePreferences.setDialogue(rate);
  //
  //         });
  //         print('cancelled');
  //       },
  //       onSubmitted: (response) {
  //         //print('rating: ${response.rating}, comment: ${response.comment}');
  //         if (response.rating < 4.0) {
  //           setState(() {
  //            // rate=false;
  //            // AdmobService().createInterstitialAd(interIdTwo,null,null,null)..load()..show();
  //             // UserSimplePreferences.setDialogue(rate);
  //
  //           });
  //           print("i an bad ");
  //           // send their comments to your email or anywhere you wish
  //           // ask the user to contact you instead of leaving a bad review
  //         }
  //         else{
  //           setState(() {
  //             //rate=false;
  //             rateReviewApp();
  //
  //           });
  //           print("i am good ");
  //         }
  //
  //       },
  //     );
  //   // actual store listing review & rating
  // }
  void rateReviewApp() async {
    final InAppReview inAppReview = InAppReview.instance;
    inAppReview.openStoreListing(

    );
    // }
  }
  TextStyle styles(size,color){
    return TextStyle(
        fontFamily: 'Serif',
        color: color,
        fontSize:size,
        fontWeight: FontWeight.bold
    );
  }
}
