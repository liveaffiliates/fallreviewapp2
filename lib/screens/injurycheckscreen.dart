import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';


class InjuryCheckScreen extends StatefulWidget {

  static const String id = 'injury_check_screen';

  @override
  _InjuryCheckScreenState createState() => _InjuryCheckScreenState();
}

class _InjuryCheckScreenState extends State<InjuryCheckScreen> {

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
                Text('Does the person have any of the following?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                SizedBox(height: 8,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(value: fallData.getHitHead ?? false,onChanged: (value){
                      setState(() {
                        fallData.setHitHead(value);
                      });
                    },),
                    Text('Hit head'),
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(value: fallData.getNausea ?? false,onChanged: (value){
                      setState(() {
                        fallData.setNausea(value);
                      });
                    },),
                    Text('Nausea'),
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(value: fallData.getVomit ?? false,onChanged: (value){
                      setState(() {
                        fallData.setVomit(value);
                      });
                    },),
                    Text('Vomiting'),
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(value: fallData.getSevHeadache ?? false,onChanged: (value){
                      setState(() {
                        fallData.setSevHeadache(value);
                      });
                    },),
                    Text('Severe headache'),
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(value: fallData.getNeckPain ?? false,onChanged: (value){
                      setState(() {
                        fallData.setNeckPain(value);
                      });
                    },),
                    Text('Neck pain'),
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(value: fallData.getChangeConious ?? false,onChanged: (value){
                      setState(() {
                        fallData.setChangeConcious(value);
                      });
                    },),
                    Text('Change of conciousness'),
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(value: fallData.getAntiCoag ?? false,onChanged: (value){
                      setState(() {
                        fallData.setAntiCoag(value);
                      });
                    },),
                    Text('Taking anti-coagulents'),
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(value: fallData.getCut ?? false,onChanged: (value){
                      setState(() {
                        fallData.setCut(value);
                      });
                    },),
                    Text('Cuts or lacerations'),
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(value: fallData.getWeightBear ?? false,onChanged: (value){
                      setState(() {
                        fallData.setWeightBear(value);
                      });
                    },),
                    Text('Unable to weight bear'),
                  ],
                ),

                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: (Column(
                      children: <Widget>[
                        RaisedButton(child: Text('Next'), onPressed: (){

                          if(fallData.getHitHead == null){fallData.setHitHead(false);}
                          if(fallData.getNausea == null){fallData.setNausea(false);}
                          if(fallData.getVomit == null){fallData.setVomit(false);}
                          if(fallData.getSevHeadache == null){fallData.setSevHeadache(false);}
                          if(fallData.getNeckPain == null){fallData.setNeckPain(false);}
                          if(fallData.getChangeConious == null){fallData.setChangeConcious(false);}
                          if(fallData.getAntiCoag == null){fallData.setAntiCoag(false);}
                          if(fallData.getCut == null){fallData.setCut(false);}
                          if(fallData.getWeightBear == null){fallData.setWeightBear(false);}



                          updateFirestoreDocument(collection: 'falls', id: fallData.getFallID, fallData: fallData);
                          Navigator.pushNamed(context, SubmitScreen.id, arguments: fallData.getFallID);


                        },),
                      ],
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
