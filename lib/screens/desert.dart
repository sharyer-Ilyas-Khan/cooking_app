import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';
import 'RecipyDetails.dart';
class Deserts extends StatefulWidget {
  const Deserts({Key key}) : super(key: key);

  @override
  _DesertsState createState() => _DesertsState();
}

class _DesertsState extends State<Deserts> {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('deserts').snapshots(),
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
  }
  TextStyle styles(){
    return TextStyle(
        fontFamily: 'Pro',
        color: Colors.white,
        fontSize:MediaQuery.of(context).size.width*0.06,
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
