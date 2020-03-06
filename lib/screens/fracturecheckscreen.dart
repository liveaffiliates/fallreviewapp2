import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';
import 'package:fallreview/database/sembastfunctions.dart';
import 'package:fallreview/uxelements/uxelements.dart';
import 'package:fallreview/utilities/string.dart';

class FractureCheckScreen extends StatefulWidget {
  static const String id = 'fracture_check_screen';

  @override
  _FractureCheckScreenState createState() => _FractureCheckScreenState();
}

class _FractureCheckScreenState extends State<FractureCheckScreen> {
  @override
  Widget build(BuildContext context) {
    final fallData = Provider.of<FallData>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Fall Report'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 16,
                ),

                Text(
                  'Do you suspect a fracture?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                FractureCheckInput(title: 'Do the have pain?',type: Strings.pain),

                FractureCheckInput(title: 'Bony tenderness on palpation?',type: Strings.bonyTenderness,),

                FractureCheckInput(title: 'Increase in pain with movement?',type: Strings.painWithMovement,),

                FractureCheckInput(title: 'Limb shortening or deformity?',type: Strings.limbShortening,),


                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: (RaisedButton(
                      child: Text('Next'),
                      onPressed: () {
                        updateFirestoreDocument(
                            collection: 'falls',
                            id: fallData.getFallID,
                            fallData: fallData);

                        editFallInDatabase(fallKey: fallData.getLocalDBID,fallData: fallData.toJson());

                        Navigator.pushNamed(
                          context,
                          VitalSignsCheckScreen.id,
                        );

                      },
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class YesNoButton extends StatelessWidget {
  bool yesType;
  bool activated;
  Function onPressed;

  YesNoButton(this.yesType, this.activated, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: activated ? Colors.black : Colors.white,
      child: Center(
          child: (Text(
        yesType ? 'Yes' : 'No',
        style: TextStyle(color: activated ? Colors.white : Colors.black),
      ))),
      onPressed: onPressed,
    );
  }
}
