import 'package:flutter/material.dart';
import 'package:fallreview/screens/allscreens.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';


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
      initialRoute: HomeScreen.id,
      onGenerateRoute: (RouteSettings settings){

        var routes = <String, WidgetBuilder>{
          HomeScreen.id: (context) => HomeScreen(),
          QuestionScreen.id: (context) => QuestionScreen(),
          SummaryScreen.id: (context) => SummaryScreen(settings.arguments),
          PersonsNameScreen.id: (context) => PersonsNameScreen(),
          IsPersonInDangerScreen.id: (context) => IsPersonInDangerScreen(),
          SuspectFractureScreen.id: (context) => SuspectFractureScreen(),
          ReferAcdScreen.id: (context) => ReferAcdScreen(),
          FractureIsSuspectedScreen.id: (context) => FractureIsSuspectedScreen(),
          VitalSignsCheck.id: (context) => VitalSignsCheck(),
          DoesThePersonHaveSigns.id: (context) => DoesThePersonHaveSigns(),
          PossibleInjuryScreen.id: (context) => PossibleInjuryScreen(),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      });
  }
}
