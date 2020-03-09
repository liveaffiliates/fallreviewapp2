import 'package:fallreview/screens/allscreens.dart';
import 'package:fallreview/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fallreview/database/sembastfunctions.dart';
import 'package:fallreview/utilities/colors.dart';
import 'package:fallreview/uxelements/appbar.dart';

class HomeScreen extends StatefulWidget {

  static const String id = 'Home_Screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool nextPressed = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    var padding = MediaQuery.of(context).padding.top;
    var totalHeight = MediaQuery.of(context).size.height;
    var adjustedHeight = totalHeight - padding - kToolbarHeight;

    final fallData = Provider.of<FallData>(context, listen: true);

    List<FallData> falls;

    return Scaffold(
      appBar: CustomAppBar('Home'),
      body: Stack(
        children: <Widget>[

          FutureBuilder<Object>(
            future: getFallsFromDatabase(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.hasData) {

                falls = snapshot.data;

                if ((falls.length) > 0){
                  return ListView.builder(
                      itemCount: falls.length,
                      itemBuilder: (BuildContext context, int index){

                        FallData fall = falls[index];
                        int localDBID = fall.getLocalDBID;
                        String name = fall.getName ?? 'No name provided';

                        String dateTimeOfFall = epochIntToDateString(epochInt: fall.getFallTime);

                        return Container(
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

                                  await deleteFallFromDatabase(fallKey: localDBID).then((_){
                                    setState(()  {

                                    });

                                  });
                                },
                              ),
                            ],

                            child: InkWell(
                              child: Card(
                                elevation: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left:8.0, right: 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                            SizedBox(height: 6,),
                                            Text(dateTimeOfFall, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),),
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
                                    arguments: localDBID);
                              },
                            ),
                          ),
                        );
                      });

                } else {

                  return Center(child: Container(width: 200, child: Text('No falls added yet, click the plus icon to start', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black,),)),
                 );

                }


              } else {
                return Center(child: CircularProgressIndicator());
              }

            }


          ),


          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                backgroundColor: mainColor,
                child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.add),
                  ],
                ),
              ),
                onPressed: () async{

                  if (!nextPressed){

                    setState(() {
                      loading = true;
                      nextPressed = true;
                    });


                    // Clear the fall model
                    fallData.clearFallModel();

                    // Create an id for the Firestore anonymized data
                    var uuid = new Uuid();

                    // Add the the firestroe id and time of fall creation to firestore
                    fallData.setFallID(uuid.v4());
                    fallData.setFallTime(DateTime.now().millisecondsSinceEpoch);

                    // Write the isolation to the local database
                    await writeFallToDatabase(fallData: fallData.toJson()).then((localDBID){
                      fallData.setLocalDBID(localDBID);
                    });

                    await updateFirestoreDocument(collection: 'falls', id: fallData.getFallID, fallData: fallData);

                    setState(() {
                      loading = false;
                      nextPressed = false;
                    });

                    Navigator.pushNamed(context, UnconciousBreathingBleedingCheckScreen.id,);
                  }
                },
              ),
            ),
          ),

          if(loading)Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
