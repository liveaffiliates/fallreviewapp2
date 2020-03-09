import 'package:flutter/material.dart';
import 'package:fallreview/screens/allscreens.dart';
import 'package:fallreview/utilities/string.dart';
import 'package:fallreview/uxelements/uxelements.dart';
import 'package:fallreview/utilities/colors.dart';


class PersonsNameScreen extends StatefulWidget {

  static const String id = 'Persons_Name_Screen';

  @override
  _PersonsNameScreenState createState() => _PersonsNameScreenState();
}

class _PersonsNameScreenState extends State<PersonsNameScreen> {
  @override
  Widget build(BuildContext context) {

    var padding = MediaQuery.of(context).padding.top;
    var totalHeight = MediaQuery.of(context).size.height;
    var adjustedHeight = totalHeight - padding - kToolbarHeight;

    return Scaffold(
      appBar: AppBar(backgroundColor: mainColor,title: Text('Fall Report'),automaticallyImplyLeading: false,),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(width: 300,child: Text('Please', style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),textAlign: TextAlign.center,)),
                  Container(width: 300,child: Text('Enter the Persons Name', style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),textAlign: TextAlign.center,)),
                  SizedBox(height: 24,),
                  TextEntryField(type: Strings.personsName,hintText: Strings.personsNameHint,),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Spacer(),
                  BottomButton(text: 'Next',
                    route: FallDescriptionScreen.id,
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
