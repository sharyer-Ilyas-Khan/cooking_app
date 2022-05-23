import 'package:cooking_app/screens/chinesDishs.dart';
import 'package:cooking_app/screens/continentalDishes.dart';
import 'package:cooking_app/screens/desiDishes.dart';
import 'package:cooking_app/screens/italianDishes.dart';
import 'package:cooking_app/screens/taiDishes.dart';
import 'package:flutter/material.dart';
class DetailsOfCategory extends StatefulWidget {
  final category;
  const DetailsOfCategory({this.category,Key key}) : super(key: key);

  @override
  _DetailsOfCategoryState createState() => _DetailsOfCategoryState(category: category);
}

class _DetailsOfCategoryState extends State<DetailsOfCategory> {
  final category;
  _DetailsOfCategoryState({this.category});
  @override
  void initState() {
    print(category);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade800,
      appBar: AppBar(
        title: Text("$category Dishes",style: TextStyle(
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
    backgroundColor: Colors.black87,
        toolbarHeight: MediaQuery.of(context).size.width*0.2,),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/hori.jpg"),
            fit: BoxFit.fill
          )
        ),
        child:(category== 'Chines')? ChinesDishes():
      (category== 'Italian')?ItalianDishes():
      (category== 'Desi')? DesiDishes():
      (category== 'Tai')? TaiDishes():
      (category== 'Continental')? ContDishes():
      Center(
        child: Text("OOPPSSS Eroor"),
      ),)
    );
  }
}
