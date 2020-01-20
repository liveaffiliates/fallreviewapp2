import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';

class ResultsScreen extends StatefulWidget {

  static const String id = 'results_screen';

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {

    final fallData = Provider.of<FallData>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
             height: 250,
             decoration: BoxDecoration(
                 color: (fallData.getSuspectedFracture != null && fallData.getSuspectedFracture || fallData.getPossibleInjury != null && fallData.getPossibleInjury) ? Colors.red : Colors.greenAccent,
                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight:  Radius.circular(20),)),
              child: Center(
                child: (Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                  
                  if(fallData.getSuspectedFracture == null && fallData.getPossibleInjury == null || !fallData.getSuspectedFracture && !fallData.getPossibleInjury)
                  Text('Unlikely injury', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),),
                  if(fallData.getPossibleInjury != null && fallData.getPossibleInjury)
                  Text('Possible injury', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),),
                  if((fallData.getSuspectedFracture != null && fallData.getSuspectedFracture &&  fallData.getPossibleInjury != null && fallData.getPossibleInjury))
                  Text('and', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),),
                  if(fallData.getSuspectedFracture != null && fallData.getSuspectedFracture)
                    Text('Suspect fracture', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),),
                  SizedBox(height: 20,),
                  Text('Do not move patient', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                ],)),
              ),
            ),

            SizedBox(height: 20,),

            Text('Refer to ACD and call ambulance if required', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),


            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: (Column(
                  children: <Widget>[
                    RaisedButton(child: Text('Done'), onPressed: (){


                    },),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
