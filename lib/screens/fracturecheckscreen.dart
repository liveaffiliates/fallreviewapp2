import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Do you suspect a fracture?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Do they have pain?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      color: (fallData.getPain == true)
                          ? Colors.black
                          : Colors.white,
                      child: Center(
                          child: (Text(
                        'Yes',
                        style: TextStyle(
                          color: (fallData.getPain == true)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ))),
                      onPressed: () {
                        setState(() {
                          fallData.setPain(true);
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                      color: (fallData.getPain == false)
                          ? Colors.black
                          : Colors.white,
                      child: Center(
                          child: (Text(
                        'No',
                        style: TextStyle(
                          color: (fallData.getPain == false)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ))),
                      onPressed: () {
                        setState(() {
                          fallData.setPain(false);
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: 'Details...', border: OutlineInputBorder()),
                  onChanged: (text) {
                    fallData.setPainDesc(text);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Bony tenderness on palpation?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      color: (fallData.getBonyTenderness == true)
                          ? Colors.black
                          : Colors.white,
                      child: Center(
                          child: (Text(
                        'Yes',
                        style: TextStyle(
                          color: (fallData.getBonyTenderness == true)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ))),
                      onPressed: () {
                        setState(() {
                          fallData.setBonyTenderness(true);
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                      color: (fallData.getBonyTenderness == false)
                          ? Colors.black
                          : Colors.white,
                      child: Center(
                          child: (Text(
                        'No',
                        style: TextStyle(
                          color: (fallData.getBonyTenderness == false)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ))),
                      onPressed: () {
                        setState(() {
                          fallData.setBonyTenderness(false);
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: 'Details...', border: OutlineInputBorder()),
                  onChanged: (text) {
                    fallData.setBonyTendernessDesc(text);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Changes in pain with movement?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      color: (fallData.getChangePainWithMovement == true)
                          ? Colors.black
                          : Colors.white,
                      child: Center(
                          child: (Text(
                        'Yes',
                        style: TextStyle(
                          color: (fallData.getChangePainWithMovement == true)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ))),
                      onPressed: () {
                        setState(() {
                          fallData.setchangePainWithMovement(true);
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                      color: (fallData.getChangePainWithMovement == false)
                          ? Colors.black
                          : Colors.white,
                      child: Center(
                          child: (Text(
                        'No',
                        style: TextStyle(
                          color: (fallData.getChangePainWithMovement == false)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ))),
                      onPressed: () {
                        setState(() {
                          fallData.setchangePainWithMovement(false);
                        });
                      },
                    )
                  ],
                ),

                SizedBox(
                  height: 10,
                ),

                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: 'Details', border: OutlineInputBorder()),
                  onChanged: (text) {
                    fallData.setChangeLimbMovementDesc(text);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Limb shortening or deformity?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      color: (fallData.getLimbShort == true)
                          ? Colors.black
                          : Colors.white,
                      child: Center(
                          child: (Text(
                        'Yes',
                        style: TextStyle(
                          color: (fallData.getLimbShort == true)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ))),
                      onPressed: () {
                        setState(() {
                          fallData.setLimbShort(true);
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                      color: (fallData.getLimbShort == false)
                          ? Colors.black
                          : Colors.white,
                      child: Center(
                          child: (Text(
                        'No',
                        style: TextStyle(
                          color: (fallData.getLimbShort == false)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ))),
                      onPressed: () {
                        setState(() {
                          fallData.setLimbShort(false);
                        });
                      },
                    )
                  ],
                ),

                SizedBox(
                  height: 10,
                ),

                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: 'Details', border: OutlineInputBorder()),
                  onChanged: (text) {
                    fallData.setChangeLimbMovementDesc(text);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
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
