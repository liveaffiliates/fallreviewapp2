import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fallreview/screens/allscreens.dart';
import 'package:fallreview/uxelements/uxelements.dart';
import 'package:fallreview/utilities/string.dart';
import 'package:fallreview/utilities/colors.dart';

class FractureCheckScreen extends StatefulWidget {
  static const String id = 'fracture_check_screen';

  @override
  _FractureCheckScreenState createState() => _FractureCheckScreenState();
}

class _FractureCheckScreenState extends State<FractureCheckScreen> {
  @override
  Widget build(BuildContext context) {

    var padding = MediaQuery.of(context).padding.top;
    var totalHeight = MediaQuery.of(context).size.height;
    var adjustedHeight = totalHeight - padding - kToolbarHeight;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('Fall Report'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: adjustedHeight,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 16,),
                Text(
                  'Do you suspect a fracture?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                FractureCheckInput(title: 'Do the have pain?',type: Strings.pain),
                FractureCheckInput(title: 'Bony tenderness on palpation?',type: Strings.bonyTenderness,),
                FractureCheckInput(title: 'Increased pain with movement?',type: Strings.painWithMovement,),
                FractureCheckInput(title: 'Limb shortening or deformity?',type: Strings.limbShortening,),

              Spacer(),

              BottomButton(text: 'Next',
                   route: VitalSignsCheckScreen.id,
                   updateDatabase: true,
                   finalScreen: false),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
