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
                    Text('Unable to weight bear without pain'),
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

                          // If they have not selected the tick boxes set them to false
                          if(fallData.getHitHead == null){fallData.setHitHead(false);}
                          if(fallData.getNausea == null){fallData.setNausea(false);}
                          if(fallData.getVomit == null){fallData.setVomit(false);}
                          if(fallData.getSevHeadache == null){fallData.setSevHeadache(false);}
                          if(fallData.getNeckPain == null){fallData.setNeckPain(false);}
                          if(fallData.getChangeConious == null){fallData.setChangeConcious(false);}
                          if(fallData.getAntiCoag == null){fallData.setAntiCoag(false);}
                          if(fallData.getCut == null){fallData.setCut(false);}
                          if(fallData.getWeightBear == null){fallData.setWeightBear(false);}


                          //  IF  TRUE TO unable to weight bear without pain” → suspect fracture screen
                          if (fallData.getWeightBear){
                            fallData.setSuspectedFracture(true);
                          }

                          // IF TRUE TO any two of the following four (if that works - if not I would go to the suspect fracture screen if any of those below are true) → suspect fracture screen
                          // Yes to having pain
                          // Yes to having tenderness on palpation
                          // Yes to having increase in pain with movement
                          // Yes to having Limb shortening with deformity
                          int numberOfSuspectFractures = 0;
                          if (fallData.getPain != null && fallData.getPain){numberOfSuspectFractures++;}
                          if (fallData.getBonyTenderness != null && fallData.getBonyTenderness){numberOfSuspectFractures++;}
                          if (fallData.getChangePainWithMovement != null && fallData.getChangePainWithMovement){numberOfSuspectFractures++;}
                          if (fallData.getLimbShort != null && fallData.getLimbShort){numberOfSuspectFractures++;}

                          if (numberOfSuspectFractures >= 2){
                            fallData.setSuspectedFracture(true);
                          }


                          //Upper and Lower limits
                          //int bpH; High >170 mmHg (millimeters of mercury). Low <90mmHg
                          //int bpL; High > 110mmHg. Low <50mmHg
                          //int hR; High >100bpm (beats per minute). Low 50bpm
                          //int pupils; unsure atm I’ll find this out
                          //double bgl; blood glucose high: 7.8mmol/L (millimoles per litre) - (non-diabetic). 8.5mmol/L to (Diabetics). ← might need a dropdown question if they are diabetic or not. If thats too hard atm then we can just go with 7.8mmol/L as too high. Low 4.0
                          //Temperature: High: >37.9 Low: <36.1 celcius degrees (C)


                          //Possible Injury screen
                          //IF TRUE TO ANY OF THE FOLLOWING
                          //Change of consciousness
                          //Cut or laceration
                          //High or low BP
                          //High or low HR
                          //Pupils - abnormal
                          //IF TRUE TO THESE TWO
                          //Taking anti-coagulants and suspected hit head.
                          //Nausea and suspected hit head.
                          //Vomiting and suspected hit head.
                          //A severe headache and suspected hit head.
                          //Neck pain and suspected hit head.

                          if (
                            fallData.getChangeConious ||
                            fallData.getCut ||
                            fallData.getBPDia != null && fallData.getBPDia > 170 ||
                            fallData.getBPDia != null && fallData.getBPDia < 90 ||
                            fallData.getBPSis != null && fallData.getBPSis > 110 ||
                            fallData.getBPSis != null && fallData.getBPSis < 50 ||
                            fallData.getHr != null && fallData.getHr > 100 ||
                            fallData.getHr != null && fallData.getHr < 50 ||
                            fallData.getAntiCoag && fallData.getHitHead ||
                            fallData.getNausea && fallData.getHitHead ||
                            fallData.getVomit && fallData.getHitHead ||
                            fallData.getSevHeadache && fallData.getHitHead ||
                            fallData.getNeckPain && fallData.getHitHead
                          //fallData.getBGL > 7.8 ||
                          //fallData.getBGL < 4.0 ||
                          //fallData.getTemperature > 37.9 ||
                          //fallData.getTemperature < 36.1 ||
                          //fallData.getPupils
                          ){
                            fallData.getPossibleInjury;
                          }


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
