import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/screens/allscreens.dart';

class PossibleInjuryScreen extends StatefulWidget {

  static const String id = 'Possible_Injury_Screen';

  @override
  _PossibleInjuryScreenState createState() => _PossibleInjuryScreenState();
}

class _PossibleInjuryScreenState extends State<PossibleInjuryScreen> {
  @override
  Widget build(BuildContext context) {

    final fallData = Provider.of<FallData>(context, listen: true);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, elevation: 0,),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
             height: 200,
             color: Colors.red,
              child: Center(
                child: (Column(children: <Widget>[
                  SizedBox(height: 20,),
                  Text('Possible injury', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),),

                ],)),
              ),
            ),

            Expanded(child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 16,),
                  Text('Next Steps',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  SizedBox(height: 24,),
                  Text('Notify next of kin',style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  SizedBox(height: 12,),
                  Text('Review FRAT',style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  SizedBox(height: 12,),
                  Text('Consider hospital',style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  SizedBox(height: 12,),
                  Text('Consider urine analysis',style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  SizedBox(height: 12,),
                  Text('Monitor vital signs',style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  SizedBox(height: 12,),
                  Text('Wound chart',style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  SizedBox(height: 12,),
                  Text('Visual obs chart',style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  SizedBox(height: 12,),
                  Text('Pain chart',style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  SizedBox(height: 12,),
                  Text('Call GP',style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),





                  Container(
                    //decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft:  Radius.circular(20),)),

                  ),
                ],
              ),
            )),
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
