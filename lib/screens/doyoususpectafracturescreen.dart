import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';

class SuspectFractureScreen extends StatefulWidget {

  static const String id = 'Suspect_Fracture_Screen';

  @override
  _SuspectFractureScreenState createState() => _SuspectFractureScreenState();
}

class _SuspectFractureScreenState extends State<SuspectFractureScreen> {
  @override
  Widget build(BuildContext context) {

    final fallData = Provider.of<FallData>(context, listen: true);

    bool hasPain = false;
    bool bonyTenderness = false;
    bool painWithMov = false;


    return Scaffold(
      appBar: AppBar(title: Text('Fall Report'),),
      body: SafeArea(
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
              Text('Do you have pain?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.black,
                    child: Center(child: (Text('Yes', style: TextStyle(color: Colors.white),))),
                    onPressed: (){
                      setState(() {
                        hasPain = true;
                        print(hasPain.toString());
                      });

                    },
                  ),
                  SizedBox(width: 10,),
                  RaisedButton(
                    color: Colors.white,
                    child: Center(child: (Text('No'))),
                    onPressed: (){
                      setState(() {
                        hasPain = false;
                      });

                      fallData.setPainLevel('No pain');
                    },
                  )
                ],
              ),

              SizedBox(height: 10,),

                TextField(
                  maxLines: 4,
                  decoration: InputDecoration.collapsed(hintText: 'Details of the pain', border: OutlineInputBorder()),
                onChanged: (text){
                  fallData.setPainLevel(text);
                },
              ),

              SizedBox(height: 10,),
              Text('Bony tenderness on palpation?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.black,
                    child: Center(child: (Text('Yes', style: TextStyle(color: Colors.white),))),
                    onPressed: (){
                      setState(() {
                        hasPain = true;
                        print(hasPain.toString());
                      });

                    },
                  ),
                  SizedBox(width: 10,),
                  RaisedButton(
                    color: Colors.white,
                    child: Center(child: (Text('No'))),
                    onPressed: (){
                      setState(() {
                        hasPain = false;
                      });

                      fallData.setPainLevel('No pain');
                    },
                  )
                ],
              ),

              SizedBox(height: 10,),

              TextField(
                controller: TextEditingController()..text = '  Right hip',
                maxLines: 4,
                decoration: InputDecoration.collapsed(hintText: '  Details of the pain', border: OutlineInputBorder()),
                onChanged: (text){
                  fallData.setPainLevel(text);
                },
              ),

              SizedBox(height: 10,),
              Text('Changes in pain with movement?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.white,
                    child: Center(child: (Text('Yes'))),
                    onPressed: (){
                      setState(() {
                        hasPain = true;
                        print(hasPain.toString());
                      });

                    },
                  ),
                  SizedBox(width: 10,),
                  RaisedButton(
                    color: Colors.black,
                    child: Center(child: (Text('No', style: TextStyle(color: Colors.white),))),
                    onPressed: (){
                      setState(() {
                        hasPain = false;
                      });

                      fallData.setPainLevel('No pain');
                    },
                  )
                ],
              ),

              SizedBox(height: 10,),

              TextField(
                controller: TextEditingController()..text = '  None reported',
                maxLines: 4,
                decoration: InputDecoration.collapsed(hintText: '  Details of the pain', border: OutlineInputBorder()),
                onChanged: (text){
                  fallData.setPainLevel(text);
                },
              ),

              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: (Column(
                    children: <Widget>[
                      RaisedButton(child: Text('Next'), onPressed: (){
                        updateFirestoreDocument(collection: 'falls', id: fallData.getFallID, fallData: fallData);
                        Navigator.pushNamed(context, VitalSignsCheck.id,);


                      },),
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

class YesNoButton extends StatelessWidget {

  bool yesType;
  bool activated;
  Function onPressed;

  YesNoButton(this.yesType, this.activated, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: activated ? Colors.black : Colors.white,
      child: Center(child: (Text(yesType ? 'Yes' : 'No', style: TextStyle(color: activated ? Colors.white : Colors.black),))),
      onPressed: onPressed,
    );
  }
}




