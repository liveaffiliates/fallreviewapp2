import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';

class OtherInformationScreen extends StatefulWidget {

  static const String id = 'Other_Info_Screen';

  @override
  _OtherInformationScreenState createState() => _OtherInformationScreenState();
}

class _OtherInformationScreenState extends State<OtherInformationScreen> {
  @override
  Widget build(BuildContext context) {

    final fallData = Provider.of<FallData>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: Text('Fall Report')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 16,),
              Text('Other Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 24,),
              TextField(
                maxLines: 2,
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Other Infomation'),
                onChanged: (text){
                  fallData.setOtherInfo(text);
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
                        Navigator.pushNamed(context, ResultsScreen.id,);

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
