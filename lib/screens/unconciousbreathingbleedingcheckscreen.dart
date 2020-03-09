import 'package:fallreview/screens/allscreens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/database/sembastfunctions.dart';
import 'package:fallreview/utilities/colors.dart';

class UnconciousBreathingBleedingCheckScreen extends StatefulWidget {
  static const String id = 'unconcious_breathing_bleeding_checkScreen';

  @override
  _UnconciousBreathingBleedingCheckScreenState createState() => _UnconciousBreathingBleedingCheckScreenState();
}

class _UnconciousBreathingBleedingCheckScreenState extends State<UnconciousBreathingBleedingCheckScreen> {
  @override
  Widget build(BuildContext context) {

    var padding = MediaQuery.of(context).padding.top;
    var totalHeight = MediaQuery.of(context).size.height;
    var adjustedHeight = totalHeight - padding - kToolbarHeight;


    final fallData = Provider.of<FallData>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('Fall Report'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Text(
                'Is the person in serious danger?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 24,
              ),

              RichText(
                text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Are they ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                    TextSpan(
                     text: 'unconcious, not breathing, ',
                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    TextSpan(text: 'or have ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: 'serious bleeding',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    TextSpan(text: '? ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: (Column(
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.red,
                        child: Text('Yes or unsure', style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          fallData.setUnconciousNotBreathingBleeding(true);
                          updateFirestoreDocument(
                              collection: 'falls',
                              id: fallData.getFallID,
                              fallData: fallData);
                          Navigator.pushNamed(
                            context,
                            ReferAcdScreen.id,
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        color: mainColor,
                        child: Text('No', style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          fallData.setUnconciousNotBreathingBleeding(false);

                          updateFirestoreDocument(
                              collection: 'falls',
                              id: fallData.getFallID,
                              fallData: fallData);


                          editFallInDatabase(fallKey: fallData.getLocalDBID,fallData: fallData.toJson());

                          Navigator.pushNamed(
                            context,
                            PersonsNameScreen.id,
                          );
                        },
                      ),
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
