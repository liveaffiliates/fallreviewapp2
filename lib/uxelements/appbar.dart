import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:fallreview/utilities/colors.dart';
import 'package:fallreview/popups/textpopup.dart';
import 'package:fallreview/utilities/string.dart';
import 'package:fallreview/popups/feedbackpopup.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String appBarTitle;

  CustomAppBar(this.appBarTitle, {Key key})
      : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: mainColor,
      centerTitle: true,
      title: Text(
        widget.appBarTitle,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal),
      ),
      actions: <Widget>[
        PopupMenuButton<int>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: Text(
                "Feedback",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            PopupMenuItem(
              value: 3,
              child: Text(
                "Terms and Conditions",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),

            PopupMenuItem(
              value: 3,
              child: Text(
                "Privacy Policy",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],

          offset: Offset(50, 100),
          onSelected: (selection) async {
            switch (selection) {
              case 1:
                {

                  // Open the isolation list screen
//                  Navigator.pushNamed(
//                    context,
//                    SettingsScreen.id,
//                  );


                }
                break;

              case 2:
                {
                  showDialog(
                    context: context,
                    builder: (_) => FeedbackPopup(),
                  );
                }
                break;

              case 3:
                {

                  showDialog(
                    context: context,
                    builder: (_) => TextPopup(title: 'Terms and Conditions',text: Strings.termsConditions,),
                  );

                }
                break;

              case 4:
                {

                  showDialog(
                    context: context,
                    builder: (_) => TextPopup(title: 'Privacy Policy',text: Strings.privacyPolicy,),
                  );

                }
                break;
            }


          },
        ),
      ],
    );
  }


}
