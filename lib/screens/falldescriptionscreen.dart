import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';

class FallDescriptionScreen extends StatefulWidget {
  static const String id = 'Fall_Desc_Screen';

  @override
  _FallDescriptionScreenState createState() => _FallDescriptionScreenState();
}

class _FallDescriptionScreenState extends State<FallDescriptionScreen> {
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
              SizedBox(
                height: 16,
              ),
              Text(
                'Fall Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                maxLines: 2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Fall description'),
                onChanged: (text) {
                  fallData.setFallDesc(text);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Time lying on the ground (m) '),
                onChanged: (text) {
                  fallData.setFallTime(int.tryParse(text));
                },
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: (Column(
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Next'),
                        onPressed: () {
                          updateFirestoreDocument(
                              collection: 'falls',
                              id: fallData.getFallID,
                              fallData: fallData);
                          Navigator.pushNamed(
                            context,
                            FractureCheckScreen.id,
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
