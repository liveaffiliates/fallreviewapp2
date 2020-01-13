import 'package:fallreview/screens/allscreens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';

class IsPersonInDangerScreen extends StatefulWidget {
  static const String id = 'Is_Person_In_Danger_Screen';

  @override
  _IsPersonInDangerScreenState createState() => _IsPersonInDangerScreenState();
}

class _IsPersonInDangerScreenState extends State<IsPersonInDangerScreen> {
  @override
  Widget build(BuildContext context) {
    final fallData = Provider.of<FallData>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
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
                        child: Text('Yes or unsure'),
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
                        child: Text('No'),
                        onPressed: () {
                          fallData.setUnconciousNotBreathingBleeding(false);
                          updateFirestoreDocument(
                              collection: 'falls',
                              id: fallData.getFallID,
                              fallData: fallData);
                          Navigator.pushNamed(
                            context,
                            SuspectFractureScreen.id,
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
