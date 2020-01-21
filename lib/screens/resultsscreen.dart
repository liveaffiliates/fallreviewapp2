import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/screens/allscreens.dart';

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
          mainAxisSize: MainAxisSize.min,
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

                  if((fallData.getSuspectedFracture != null && fallData.getPossibleInjury != null && fallData.getSuspectedFracture == false && fallData.getPossibleInjury == false) || (fallData.getSuspectedFracture == null && fallData.getPossibleInjury == null))
                  Text('Unlikely injury', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),),
                  if(fallData.getPossibleInjury != null && fallData.getPossibleInjury)
                  Text('Possible injury', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),),
                  if((fallData.getSuspectedFracture != null && fallData.getSuspectedFracture &&  fallData.getPossibleInjury != null && fallData.getPossibleInjury))
                  Text('and', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),),
                  if(fallData.getSuspectedFracture != null && fallData.getSuspectedFracture)
                  Text('Suspect fracture', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),),
                   if(fallData.getSuspectedFracture != null && fallData.getSuspectedFracture)

                      Column(
                      children: <Widget>[
                        SizedBox(height: 20,),
                        Text('Do not move patient', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),

                      ],
                    ),
                ],)),
              ),
            ),

            SizedBox(height: 20,),


            Padding(
              padding: const EdgeInsets.only(left:8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Next Steps',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  SizedBox(height: 20,),

                  if((fallData.getSuspectedFracture != null && fallData.getPossibleInjury != null && fallData.getSuspectedFracture == false && fallData.getPossibleInjury == false) || (fallData.getSuspectedFracture == null && fallData.getPossibleInjury == null))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Notify next of Kin', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                        SizedBox(height: 5,),
                        Text('Send referral to Doctor', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                        SizedBox(height: 5,),
                        Text('Monitor vital signs', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                      ],
                    ),

                  if((fallData.getSuspectedFracture != null && fallData.getSuspectedFracture == true ||  fallData.getPossibleInjury != null && fallData.getPossibleInjury == true) )
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Notify next of Kin', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                        SizedBox(height: 5,),
                        Text('Send referral to Doctor', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                        SizedBox(height: 5,),
                        Text('Monitor vital signs', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                        SizedBox(height: 5,),
                        Text('Send to hospital if indicated', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                        SizedBox(height: 5,),
                        Text('Create wound chart if indicated', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                        SizedBox(height: 5,),
                        Text('Create visual observation chart if indicated', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                        SizedBox(height: 5,),
                        Text('Create a Pain chart if indicated', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                        SizedBox(height: 5,),
                        Text('Create a Pain chart if indicate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                        SizedBox(height: 5,),
                        Text('Review FRAT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                      ],
                    ),
                ],
              ),
            ),








            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: (Column(
                  children: <Widget>[
                    RaisedButton(child: Text('Summary'), onPressed: (){

                      Navigator.pushNamed(context, SubmitScreen.id, arguments: fallData.getFallID);

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
