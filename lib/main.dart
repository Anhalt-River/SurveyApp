import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'package:flutter_survey_app/services/auth_landing.dart';
import 'package:flutter_survey_app/services/services.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
import 'past_surveys.dart';
import 'filtr.dart';
import 'my_surveys.dart';
import 'survey_create.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SurveyApp());
}

class SurveyApp extends StatelessWidget {
  const SurveyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   theme: ThemeData(
    //       primaryColor: const Color.fromARGB(234, 3, 5, 10),
    //       textTheme:
    //           const TextTheme(titleMedium: TextStyle(color: Colors.white))),
    //   debugShowCheckedModeBanner: false,
    //   initialRoute: '/',
    //   routes: {
    //     '/': (context) => const LandingPage(),
    //     '/home': (context) => const HomePage()
    //   },
    // );

    return StreamProvider.value(
      value: AuthServices().currentUser,
      initialData: null,
      child: MaterialApp(
        theme:
            ThemeData(shadowColor: Colors.grey,
            primaryColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigo,))),
            appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(systemNavigationBarColor: Colors.indigo)),
            // drawerTheme: const DrawerThemeData(backgroundColor: Colors.red),
                //primarySwatch: Colors.white,
                ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const LandingPage(),
          '/home': (context) => const HomePage(),
          '/auth': (context) => const AuthPage(),
          '/lsurveys': (context) => const PastSurveysPage(),
          '/filtr': (context) => const FiltrPage(),
          '/mysurveys': (context) => const MySurveysPage(),
          '/createsurvey': (context) => const SurveyCreatePage(),
        },
      ),
    );
  }
}
