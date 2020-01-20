import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';

class DisclaimerScreen extends StatefulWidget {

  static const String id = 'disclaimer_screen';

  @override
  _DisclaimerScreenState createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Fall Report'),automaticallyImplyLeading: false,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[



                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: (Column(
                        children: <Widget>[
                          RaisedButton(child: Text('Next'), onPressed: (){
                            Navigator.pushNamed(context, HomeScreen.id,);

                          },),
                        ],
                      )),
                    ),
                  ),
                ],
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left:50.0, right: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.warning, size: 64 , color: Colors.red,),
                      SizedBox(height: 10,),
                      Text('Caution: this is to be used as a guide only. Clinical reasoning by a trained health professional should be applied at all times. This tool should only be used by a trained professional.',textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
