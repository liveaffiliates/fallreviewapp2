import 'package:flutter/material.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';

class VitalSignsCheck extends StatefulWidget {

  static const String id = 'VitalSignsCheck';

  @override
  _VitalSignsCheckState createState() => _VitalSignsCheckState();
}

class _VitalSignsCheckState extends State<VitalSignsCheck> {
  @override
  Widget build(BuildContext context) {

    final fallData = Provider.of<FallData>(context, listen: true);

    bool nausea = false;
    bool vomiting = false;
    bool headache = false;
    bool neckpain = false;
    bool conciousness = false;
    bool coagulents = false;
    bool cuts = false;
    bool weight = false;
    bool mobility = false;


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
              Text('Vital Signs Check?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

              SizedBox(height: 8,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(value: false,),
                  Text('Nausea'),
                ],
              ),

              SizedBox(height: 8,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(value: true, onChanged: (bool){
                    setState(() {
                      vomiting = true;
                    });
                  },),
                  Text('Vomiting'),
                ],
              ),

              SizedBox(height: 8,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(value: false, onChanged: (v){

                  },),
                  Text('Severe headache'),
                ],
              ),

              SizedBox(height: 8,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(value: true, onChanged: (v){

                  },),
                  Text('Neck pain'),
                ],
              ),

              SizedBox(height: 8,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(value: false, onChanged: (v){

                  },),
                  Text('Change of conciousness'),
                ],
              ),

              SizedBox(height: 8,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(value: false, onChanged: (v){

                  },),
                  Text('Taking anti-coagulents'),
                ],
              ),

              SizedBox(height: 8,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(value: true, onChanged: (v){

                  },),
                  Text('Deep cuts or lacerations'),
                ],
              ),

              SizedBox(height: 8,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(value: true, onChanged: (v){

                  },),
                  Text('Unable to weight bare'),
                ],
              ),

              SizedBox(height: 8,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(value: false, onChanged: (v){

                  },),
                  Text('Change in mobility'),
                ],
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
                        Navigator.pushNamed(context, DoesThePersonHaveSigns.id,);


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
