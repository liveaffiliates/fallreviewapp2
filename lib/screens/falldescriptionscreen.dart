import 'package:flutter/material.dart';
import 'package:fallreview/screens/allscreens.dart';
import 'package:fallreview/utilities/string.dart';
import 'package:fallreview/uxelements/uxelements.dart';
import 'package:fallreview/utilities/colors.dart';

class FallDescriptionScreen extends StatefulWidget {
  static const String id = 'Fall_Desc_Screen';

  @override
  _FallDescriptionScreenState createState() => _FallDescriptionScreenState();
}

class _FallDescriptionScreenState extends State<FallDescriptionScreen> {
  @override
  Widget build(BuildContext context) {

    var padding = MediaQuery.of(context).padding.top;
    var totalHeight = MediaQuery.of(context).size.height;
    var adjustedHeight = totalHeight - padding - kToolbarHeight;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,title: Text('Fall Report')),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 16),
                  //Container(width: 300,child: Text('Please', style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),textAlign: TextAlign.center,)),
                  Container(width: 300,child: Text('Please Enter a Description of the Fall', style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),textAlign: TextAlign.center,)),
                  SizedBox(height: 24),
                  TextEntryField(type: Strings.fallDescription,hintText: Strings.fallDescriptionHint,),
                  SizedBox(height: 24),
                  TextEntryField(type: Strings.timeOnGround,hintText: Strings.timeOnGroundHint,),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Spacer(),
                  BottomButton(text: 'Next',
                    route: FractureCheckScreen.id,
                    updateDatabase: true,
                    finalScreen: false,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
