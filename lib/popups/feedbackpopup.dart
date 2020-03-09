import 'package:flutter/material.dart';
import 'package:fallreview/models/FeedbackModel.dart';
import 'package:fallreview/uxelements/SystemPadding.dart';
import 'package:fallreview/popups/generalinfopopup.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/utilities/colors.dart';

class FeedbackPopup extends StatefulWidget {



  FeedbackPopup ();


  @override
  State<StatefulWidget> createState() => FeedbackPopupState();
}

class FeedbackPopupState extends State<FeedbackPopup>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  TextEditingController feedbackTextController = TextEditingController();


  FeedbackModel feedback = FeedbackModel();


  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();




  }

  @override
  Widget build(BuildContext context) {

    return SystemPadding(
      child: Padding(
        padding: const EdgeInsets.only(left:16.0, right: 16),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                width: double.infinity,
                height: 350,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50, right: 16, left: 16),
                  child: (Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:16.0, left: 0.0),
                        child: InkWell(
                          child: Image.asset('assets/close_popup_150.png',height: 25, width: 25,
                              fit: BoxFit.cover),onTap: (){

                          Navigator.pop(context);
                        },
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 16, top: 10),
                        child: Center(
                          child: Text(
                            'Feedback',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),

                      SizedBox(height: 16,),

                      Center(
                        child: Text(
                          'Please let us know how we can improve this service',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ),


                      SizedBox(height: 16,),

                      Center(
                        child: Container(
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(hintText: 'Your suggestions...',hintStyle: TextStyle(fontSize: 18),filled: true, fillColor: textBoxBackgroundColor),
                            controller: feedbackTextController,
                            textAlign: TextAlign.center,
                            onChanged: (suggestion) {
                              feedback.feedbackSuggestion = suggestion;
                            },
                          ),
                        ),
                      ),

                      Spacer(),

                      RaisedButton(
                        color: mainColor,

                        child: Center(
                          child: Text('Submit', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),

                          ),
                        ),
                        onPressed: (){
                          if (feedback.feedbackSuggestion == null || feedback.feedbackSuggestion == ''){
                            showDialog(
                              context: context,
                              builder: (_) => GeneralnfoPopup('Please let us know more info',),
                            );
                          } else{
                            sendFeedbackEmail(feedback);
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (_) => GeneralnfoPopup('Thanks for your contribution!',),
                            );

                          }

                        },

                      ),

                    ],
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



}
