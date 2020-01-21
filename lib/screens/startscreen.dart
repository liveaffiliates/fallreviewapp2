import 'package:fallreview/screens/allscreens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {

  static const String id = 'Home_Screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {

  final fallData = Provider.of<FallData>(context, listen: true);



    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Home')),),
      body: Stack(
        children: <Widget>[
          StreamBuilder<Object>(
            stream: Firestore.instance.collection('falls').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {

                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index){
                      String id = snapshot.data.documents[index]['fallId'];
                      String name = snapshot.data.documents[index]['name'] ?? 'No name provided';
                      int fallTime = snapshot.data.documents[index]['fallTime'];
                      var date = new DateTime.fromMillisecondsSinceEpoch(fallTime);
                      final f = new DateFormat('dd/MM/yyyy HH:MM');
                      String fallDateTimString = f.format(date);
                      String fallId = snapshot.data.documents[index].documentID.toString();

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      child: Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        key: UniqueKey(),
                        actions: <Widget>[
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () async  {

                              await deleteDocument('falls', id).then((onValue){
                                setState(()  {

                                });

                              });
                            },
                          ),
                        ],

                        child: InkWell(
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(name, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),),
                                        SizedBox(height: 6,),
                                        Text(fallDateTimString, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 16,),
                                  SizedBox(width: 10,)
                                ],
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.pushNamed(context, SubmitScreen.id,
                                arguments: fallId);
                          },
                        ),
                      ),
                    ),
                  );
                });
              } else {
                return Center(child: CircularProgressIndicator());
              }

            }
          ),


          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                width: 150,
                child: RaisedButton(
                  child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.add),
                      Text('Add fall')
                    ],
                  ),
                ),
                  onPressed: (){

                    fallData.clearFallModel();

                    var uuid = new Uuid();
                    fallData.setFallID(uuid.v4());
                    fallData.setFallTime(DateTime.now().millisecondsSinceEpoch);

                    updateFirestoreDocument(collection: 'falls', id: fallData.getFallID, fallData: fallData);

                    Navigator.pushNamed(context, PersonsNameScreen.id,);

                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
