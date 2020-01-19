import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';

class ReferAcdScreen extends StatefulWidget {

  static const String id = 'refer_acd_screen';

  @override
  _ReferAcdScreenState createState() => _ReferAcdScreenState();
}

class _ReferAcdScreenState extends State<ReferAcdScreen> {
  @override
  Widget build(BuildContext context) {

    final fallData = Provider.of<FallData>(context, listen: true);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, elevation: 0,),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
             height: 200,
             decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight:  Radius.circular(20),)),
              child: Center(
                child: (Column(children: <Widget>[
                  SizedBox(height: 20,),
                  Text('Refer to ACD', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),),
                  SizedBox(height: 20,),
                  Text('Seek urgent medical attention if indicated', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),


                ],)),
              ),
            ),

            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: (Column(
                  children: <Widget>[
                    RaisedButton(child: Text('Done'), onPressed: (){


                    },),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
