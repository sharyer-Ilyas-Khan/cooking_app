import 'package:cooking_app/screens/detailsofCata.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class Categories extends StatefulWidget {
  const Categories({Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Cards("Chines","images/vegsoup.jpg"),
        Cards("Desi","images/karahi.jpg"),
        Cards("Tai","images/jenga.jpg"),
        Cards("Continental","images/itnoodels.jpg"),
        Cards("Italian","images/slad.jpg"),
      ],
    );
  }
  TextStyle styles(){
    return TextStyle(
        fontFamily: 'Pro',
        color: Colors.white,
        fontSize:MediaQuery.of(context).size.width*0.07,
        fontWeight: FontWeight.bold
    );
  }
  Widget Cards(title,image){
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (_)=>DetailsOfCategory(category: title,)));
      },
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Hero(
          tag: title,
          child: Container(
              height: MediaQuery.of(context).size.width*0.5,
              width: MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    colorFilter:
                    ColorFilter.mode(Colors.black.withOpacity(0.5),BlendMode.colorBurn),
                    image: AssetImage(image),fit: BoxFit.fill
                ),
              ),
              child:Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                  Shimmer.fromColors(
                    // loop: 2,
                    period: Duration(seconds: 4),
                    baseColor: Colors.white,
                    highlightColor: Colors.black,
                    child: Text(title,style: styles(),)),
                    Text("$title food is very delisious very expensive and good looking",style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Pro',
                      fontSize: MediaQuery.of(context).size.width*0.04
                    ),)

                    ]),
              )
          ),
        ),
      ),
    );
  }
}
