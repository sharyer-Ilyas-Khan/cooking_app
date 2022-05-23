import 'package:shimmer/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'RecipyDetails.dart';
class Appetizers extends StatefulWidget {
  const Appetizers({Key key}) : super(key: key);

  @override
  _AppetizersState createState() => _AppetizersState();
}

class _AppetizersState extends State<Appetizers> {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('apitizers').snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');
        if (snapshot.hasData) {
          final docs = snapshot.data.docs;
          return ListView.builder(

            scrollDirection: Axis.horizontal,
            itemCount: docs.length,
            itemBuilder: (_, i) {
              DocumentSnapshot snap = snapshot.data.docs[i];
              final data = docs[i].data();
              var dec=data['directions'].toString();
              var ing=data['ingredient'];
              var image=data['image'].toString();

              //print(data);
              return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>
                        RecipeDetails(Recipe: snap.id,Direct:dec.toString(),listOfingre:ing,image: image,)));
                  },
                  child: Cards(snap.id,image));
            },
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
    // return ListView(
    //   scrollDirection: Axis.horizontal,
    //   children: [
    //     Cards("Salad","images/slad.jpg"),
    //     Cards("BeefKabab","images/kabab.jpg"),
    //     Cards("Chikken Karahi","images/karahi.jpg"),
    //     Cards("Jihenga Fish","images/jenga.jpg"),
    //     Cards("Italian","images/slad.jpg"),
    //   ],
    // );
  }
  TextStyle styles(){
    return TextStyle(
      fontFamily: 'Pro',
      color: Colors.white,
      fontSize:MediaQuery.of(context).size.width*0.08,
      fontWeight: FontWeight.bold
    );
  }
  Widget Cards(title,image){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        height: MediaQuery.of(context).size.width*0.4,
        width: MediaQuery.of(context).size.width*0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.2),BlendMode.colorBurn),
              image: NetworkImage(image),fit: BoxFit.fill
          ),
        ),
          child:Center(child:Shimmer.fromColors(
              period: Duration(seconds: 4),
              baseColor: Colors.white,
              highlightColor: Colors.black,
              child: Text(title,style: styles(),)),)
      ),
    );

  }
}
