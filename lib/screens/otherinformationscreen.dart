import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/screens/allscreens.dart';
import 'package:fallreview/uxelements/uxelements.dart';
import 'package:fallreview/utilities/colors.dart';
import 'package:fallreview/utilities/string.dart';

class OtherInformationScreen extends StatefulWidget {
  static const String id = 'Other_Info_Screen';

  @override
  _OtherInformationScreenState createState() => _OtherInformationScreenState();
}

class _OtherInformationScreenState extends State<OtherInformationScreen> {
  @override
  Widget build(BuildContext context) {

    var padding = MediaQuery.of(context).padding.top;
    var totalHeight = MediaQuery.of(context).size.height;
    var adjustedHeight = totalHeight - padding - kToolbarHeight;

    return Scaffold(
      appBar: AppBar(backgroundColor: mainColor, title: Text('Fall Report')),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 16),
                    Container(width: 300,child: Text('Please', style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),textAlign: TextAlign.center,)),
                    Container(width: 300,child: Text('Enter Any Other Information', style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),textAlign: TextAlign.center,)),
                    SizedBox(height: 24),
                    TextEntryField(type: Strings.otherInfo,hintText: Strings.otherInfoHint,),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Spacer(),
                BottomButton(
                  text: 'Next',
                  route: ResultsScreen.id,
                  updateDatabase: true,
                  finalScreen: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
