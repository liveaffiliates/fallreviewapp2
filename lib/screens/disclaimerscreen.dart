import 'package:fallreview/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:fallreview/screens/allscreens.dart';
import 'package:fallreview/uxelements/uxelements.dart';

class DisclaimerScreen extends StatefulWidget {

  static const String id = 'disclaimer_screen';

  @override
  _DisclaimerScreenState createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left:50.0, right: 50),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Caution!',textAlign: TextAlign.center, style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.red),),
                          SizedBox(height: 10,),
                          Text('This is to be used as a guide only. Clinical reasoning by a trained health professional should be applied at all times. This tool should only be used by a trained professional.',textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Spacer(),
            BottomButton(text: 'Next',route: HomeScreen.id, updateDatabase: false,)
          ],)
        ],
      ),
    );
  }
}
