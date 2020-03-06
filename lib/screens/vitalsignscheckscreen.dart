import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';
import 'package:fallreview/database/sembastfunctions.dart';
import 'package:fallreview/uxelements/uxelements.dart';
import 'package:fallreview/utilities/string.dart';

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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Vital Signs Check',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  VitalSignInput(type: Strings.bloodPressure,hintText: Strings.bloodPressureHint,icon: Strings.bloodPressureIcon,),
                  SizedBox(height: 16),
                  VitalSignInput(type: Strings.heartRate,hintText: Strings.heartRateHint,icon: Strings.heartRateIcon,),
                  SizedBox(height: 16),
                  VitalSignInput(type: Strings.temperature,hintText: Strings.temperatureHint,icon: Strings.temperatureIcon,),
                  SizedBox(height: 16),
                  VitalSignInput(type: Strings.pupilLeft,hintText: Strings.pupilLeftHint,icon: Strings.pupilLeftIcon,),
                  SizedBox(height: 16),
                  VitalSignInput(type: Strings.pupilRight,hintText: Strings.pupilRightHint,icon: Strings.pupilRightIcon,),
                  SizedBox(height: 16),
                  VitalSignInput(type: Strings.pupilDescription,hintText: Strings.pupilDescriptionHint,icon: Strings.pupilDescriptionIcon,),
                  SizedBox(height: 16),
                  VitalSignInput(type: Strings.respiratoryRate,hintText: Strings.respiratoryRateHint,icon: Strings.respiratoryRateIcon,),
                  SizedBox(height: 16),
                  VitalSignInput(type: Strings.oxygenSaturation,hintText: Strings.oxygenSaturationHint,icon: Strings.oxygenSaturationIcon,),
                  SizedBox(height: 16),
                  VitalSignInput(type: Strings.bloodGlucose,hintText: Strings.bloodGlucoseHint,icon: Strings.bloodGlucoseIcon,),


















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

                            editFallInDatabase(fallKey: fallData.getLocalDBID,fallData: fallData.toJson());

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
