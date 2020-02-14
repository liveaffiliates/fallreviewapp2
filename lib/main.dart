import 'package:fallreview/screens/disclaimerscreen.dart';
import 'package:flutter/material.dart';
import 'package:fallreview/screens/allscreens.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:flutter/services.dart';


void main() => runApp(ChangeNotifierProvider(
  create: (_) => FallData(),
  child: FallReviewApp(),
));

class FallReviewApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<FallReviewApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.red,

        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder( borderRadius: new BorderRadius.circular(20.0),),
          buttonColor: Colors.greenAccent,
          height: 44,
          minWidth: 156
        ),


      ),
      initialRoute: DisclaimerScreen.id,
      onGenerateRoute: (RouteSettings settings){

        var routes = <String, WidgetBuilder>{
          HomeScreen.id: (context) => HomeScreen(),
          SubmitScreen.id: (context) => SubmitScreen(settings.arguments),
          PersonsNameScreen.id: (context) => PersonsNameScreen(),
          UnconciousBreathingBleedingCheckScreen.id: (context) => UnconciousBreathingBleedingCheckScreen(),
          FractureCheckScreen.id: (context) => FractureCheckScreen(),
          ReferAcdScreen.id: (context) => ReferAcdScreen(),
          ResultsScreen.id: (context) => ResultsScreen(),
          InjuryCheckScreen.id: (context) => InjuryCheckScreen(),
          VitalSignsCheckScreen.id: (context) => VitalSignsCheckScreen(),
          DisclaimerScreen.id: (context) => DisclaimerScreen(),
          FallDescriptionScreen.id: (context) => FallDescriptionScreen(),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      });
  }
}
