import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';
import 'package:fallreview/database/sembastfunctions.dart';

class PersonsNameScreen extends StatefulWidget {

  static const String id = 'Persons_Name_Screen';

  @override
  _PersonsNameScreenState createState() => _PersonsNameScreenState();
}

class _PersonsNameScreenState extends State<PersonsNameScreen> {
  @override
  Widget build(BuildContext context) {

    final fallData = Provider.of<FallData>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: Text('Fall Report'),automaticallyImplyLeading: false,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 16,),
              Text('What is the persons name?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 24,),
              TextFormField(
                initialValue: fallData.getName ?? null,
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Name'),
                onChanged: (text){
                  fallData.setName(text);
                },
              ),

              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: (Column(
                    children: <Widget>[
                      RaisedButton(child: Text('Next'), onPressed: (){
                        updateFirestoreDocument(collection: 'falls', id: fallData.getFallID, fallData: fallData);

                        editFallInDatabase(fallKey: fallData.getLocalDBID,fallData: fallData.toJson());


                        Navigator.pushNamed(context, FallDescriptionScreen.id,);

                      },),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
