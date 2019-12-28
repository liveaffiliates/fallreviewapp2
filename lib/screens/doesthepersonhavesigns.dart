import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';

class DoesThePersonHaveSigns extends StatefulWidget {

  static const String id = 'doesthepersonhavesigns';

  @override
  _DoesThePersonHaveSignsState createState() => _DoesThePersonHaveSignsState();
}

class _DoesThePersonHaveSignsState extends State<DoesThePersonHaveSigns> {
  @override
  Widget build(BuildContext context) {

    final fallData = Provider.of<FallData>(context, listen: true);

    bool hasPain = false;
    bool bonyTenderness = false;
    bool painWithMov = false;


    return Scaffold(
      appBar: AppBar(title: Text('Fall Report'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 10,),
              Text('Does the person have any of the following?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 16,),



              TextField(
                controller: TextEditingController()..text = '  120/80',
                maxLines: 3,
                decoration: InputDecoration.collapsed(hintText: '  Blood pressure', border: OutlineInputBorder()),
                onChanged: (text){
                  fallData.setPainLevel(text);
                },
              ),

              SizedBox(height: 10,),
              TextField(
                controller: TextEditingController()..text = '  80',
                maxLines: 3,
                decoration: InputDecoration.collapsed(hintText: '  Heart rate', border: OutlineInputBorder()),
                onChanged: (text){
                  fallData.setPainLevel(text);
                },
              ),

              SizedBox(height: 10,),
              TextField(
                controller: TextEditingController()..text = '  4',
                maxLines: 3,
                decoration: InputDecoration.collapsed(hintText: '  Pupils', border: OutlineInputBorder()),
                onChanged: (text){
                  fallData.setPainLevel(text);
                },
              ),

              SizedBox(height: 10,),
              TextField(
                controller: TextEditingController()..text = '  6',
                maxLines: 3,
                decoration: InputDecoration.collapsed(hintText: '  Blood glucose test', border: OutlineInputBorder()),
                onChanged: (text){
                  fallData.setPainLevel(text);
                },
              ),

              SizedBox(height: 10,),
              TextField(
                controller: TextEditingController()..text = '  37.6',
                maxLines: 3,
                decoration: InputDecoration.collapsed(hintText: '  Temperature', border: OutlineInputBorder()),
                onChanged: (text){
                  fallData.setPainLevel(text);
                },
              ),


              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: (Column(
                    children: <Widget>[
                      RaisedButton(child: Text('Next'), onPressed: (){
                        updateFirestoreDocument(collection: 'falls', id: fallData.getFallID, fallData: fallData);
                        Navigator.pushNamed(context, PossibleInjuryScreen.id,);


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
