

import 'package:cooking_app/screens/RecipyDetails.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaiDishes extends StatefulWidget {
  const TaiDishes({Key key}) : super(key: key);

  @override
  _TaiDishesState createState() => _TaiDishesState();
}

class _TaiDishesState extends State<TaiDishes> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Hero(
          tag: 'Tai',
          child: Container(
            height: MediaQuery.of(context).size.width*0.6,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                // colorFilter:
                // ColorFilter.mode(Colors.black.withOpacity(0.2),BlendMode.colorBurn),
                  image: AssetImage("images/jenga.jpg"),fit: BoxFit.fill
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            // child:ListView(
            // children: [
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection('tai').snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                if (snapshot.hasData) {
                  final docs = snapshot.data.docs;
                  return ListView.builder(
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
            ),

          ),
        )
      ],
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
        height: MediaQuery.of(context).size.width*0.3,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(25),
        ),

        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.25,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(width: 20,),
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,softWrap:true,style: styles(MediaQuery.of(context).size.width*0.06,),),
                    Center(child: Text("Click to Cook!!! ",style: styles(MediaQuery.of(context).size.width*0.04,),)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );}

}
