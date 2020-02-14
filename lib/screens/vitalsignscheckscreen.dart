import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';

class VitalSignsCheckScreen extends StatefulWidget {
  static const String id = 'vital_signs_check_screen';

  @override
  _VitalSignsCheckScreenState createState() => _VitalSignsCheckScreenState();
}

class _VitalSignsCheckScreenState extends State<VitalSignsCheckScreen> {
  @override
  Widget build(BuildContext context) {
    final fallData = Provider.of<FallData>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Fall Report'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,


        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Vital Signs Check?',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: 'Blood pressure (systolic/diastolic)',
                        border: OutlineInputBorder()),
                    onChanged: (text) {
                      fallData.setBPSis(int.tryParse(text
                          .replaceAll(new RegExp(r"\s\b|\b\s"), "")
                          .split('/')[0]));
                      fallData.setBPDia(int.tryParse(text
                          .replaceAll(new RegExp(r"\s\b|\b\s"), "")
                          .split('/')[1]));
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Heart rate',
                        border: OutlineInputBorder()),
                    onChanged: (text) {
                      fallData.setHr(int.tryParse(text));
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Temperature',
                        border: OutlineInputBorder()),
                    onChanged: (text) {
                      fallData.setTemperature(double.tryParse(text));
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,

                    children: <Widget>[

                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: 'Pupil Left',
                              border: OutlineInputBorder()),
                          onChanged: (text) {
                            fallData.setPupilL(int.tryParse(text));
                          },
                        ),
                      ),

                      SizedBox(width: 10,),

                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: 'Pupil Right',
                              border: OutlineInputBorder()),
                          onChanged: (text) {
                            fallData.setPupilR(int.tryParse(text));
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: 'Pupil description',
                        border: OutlineInputBorder()),
                    onChanged: (text) {
                      fallData.setLPupilDesc(text);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  TextField(
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: 'Respitory rate',
                        border: OutlineInputBorder()),
                    onChanged: (text) {
                      fallData.setRespRate(int.tryParse(text));
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  TextField(
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: 'Blood glucose',
                        border: OutlineInputBorder()),
                    onChanged: (text) {
                      fallData.setBGL(double.tryParse(text));
                    },
                  ),


                    Padding(
                      padding: const EdgeInsets.only(top:16, bottom: 16.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RaisedButton(
                          child: Text('Next'),
                          onPressed: () {
                            updateFirestoreDocument(
                                collection: 'falls',
                                id: fallData.getFallID,
                                fallData: fallData);
                            Navigator.pushNamed(
                              context,
                              InjuryCheckScreen.id,
                            );
                          },
                        ),
                      ),
                    ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
