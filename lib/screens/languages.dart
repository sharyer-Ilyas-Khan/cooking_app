import 'package:cooking_app/models/shared.dart';
import 'package:flutter/material.dart';
class Languages extends StatefulWidget {
  const Languages({Key key}) : super(key: key);

  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  String selectedRadio='en';
  @override
  void initState() {
  selectedRadio= shared.getDialogue() ?? "en";
  print(selectedRadio);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Languages",style: TextStyle(
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
      body: ListView(
        children: [
          Cards('English',"en"),
          Divider(thickness: 1.5,),
          Cards('Türkçe',"tr"),
          Divider(thickness: 1.5,),
          Cards('中文','zh-cn'),
          Divider(thickness: 1.5,),
          Cards('Italiano',"it"),
          Divider(thickness: 1.5,),
          Cards('اردو',"ur"),
          Divider(thickness: 1.5,),
          Cards('Nederlands',"nl"),
          Divider(thickness: 1.5,),
          Cards('हिंदी',"hi"),
          Divider(thickness: 1.5,),
          Cards('العربية','ar'),
          Divider(thickness: 1.5,),
          Cards('Deutsch','de'),
          Divider(thickness: 1.5,),
          Cards('日本語','ja'),
          Divider(thickness: 1.5,),
          Cards('ไทย','th'),
          Divider(thickness: 1.5,),
          Cards('русский','ru'),
          Divider(thickness: 1.5,),
          Cards('한국어','ko'),
          Divider(thickness: 1.5,),
          Cards('Français','fr'),

        ],
      ),
    );
  }
  UserSimplePreferences shared=new UserSimplePreferences();
  TextStyle styles(size){
    return TextStyle(
        fontFamily: 'Pro',
        color: Colors.black,
        fontSize:size,
        fontWeight: FontWeight.bold
    );
  }
  Widget Cards(lang,toggle){
    return Container(
      height: MediaQuery.of(context).size.width*0.2,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: ListTile(
                title: Text(lang,style: styles(MediaQuery.of(context).size.width*0.045,),),
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage("images/logo.png"),
                ),
              ),
            ),
            Radio(
              value: toggle,
              groupValue: selectedRadio,
              activeColor: Colors.blue,

              onChanged: (val) {
                setSelectedRadio(val);
              },)
          ],
        ),
      )
    );

  }

  setSelectedRadio(String val) {
    setState(() {
    print(val);
      selectedRadio = val;
      shared.setDialogue(selectedRadio);

    });
  }
}
