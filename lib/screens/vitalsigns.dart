import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';

class VitalSign extends StatefulWidget {

  static const String id = 'vitalsign';

  @override
  _VitalSignState createState() => _VitalSignState();
}

class _VitalSignState extends State<VitalSign> {
  @override
  Widget build(BuildContext context) {

    final fallData = Provider.of<FallData>(context, listen: true);

        return Scaffold(
      appBar: AppBar(title: Text('Fall Report'),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[


                SizedBox(height: 10,),
                Text('Vital Signs Check?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                SizedBox(height: 16,),

                TextField(
                  maxLines: 3,
                  decoration: InputDecoration.collapsed(hintText: 'Blood pressure (systolic/diastolic)', border: OutlineInputBorder()),
                  onChanged: (text){
                    fallData.setBPL(int.tryParse(text.replaceAll(new RegExp(r"\s\b|\b\s"), "").split('/')[0]));
                    fallData.setBPH(int.tryParse(text.replaceAll(new RegExp(r"\s\b|\b\s"), "").split('/')[1]));
                  },
                ),

                SizedBox(height: 10,),

                TextField(
                  keyboardType: TextInputType.number,
                  maxLines: 3,
                  decoration: InputDecoration.collapsed(hintText: 'Heart rate', border: OutlineInputBorder()),
                  onChanged: (text){
                    fallData.setHr(int.tryParse(text));
                  },
                ),

                SizedBox(height: 10,),
                TextField(

                  maxLines: 3,
                  decoration: InputDecoration.collapsed(hintText: 'Blood glucose test', border: OutlineInputBorder()),
                  onChanged: (text){
                    fallData.setBGL(double.tryParse(text));
                  },
                ),

                SizedBox(height: 10,),
                TextField(

                  maxLines: 3,
                  decoration: InputDecoration.collapsed(hintText: 'Temperature', border: OutlineInputBorder()),
                  onChanged: (text){
                    fallData.setTemperature(double.tryParse(text));
                  },
                ),



                Center(
                  child: RaisedButton(child: Text('Next'), onPressed: (){
                    updateFirestoreDocument(collection: 'falls', id: fallData.getFallID, fallData: fallData);
                    Navigator.pushNamed(context, PossibleInjuryScreen.id,);


                  },),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
