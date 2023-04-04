import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_survey_app/pages/surveys_list.dart';
import 'package:flutter_survey_app/services/landing.dart';
import 'package:flutter_survey_app/services/services.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';

import 'package:flutter/material.dart';

// main() является главной функцией с которой начинается
// выполнение приложения
// возвращает виджет приложения
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// В Flutter все является виджетом (кнопки,списки, текст и т.д.)
// виджет - это отдельный компонент, который может быть отрисован
// на экране (не путайте с Android виджетами)
// Наиболее простые виджеты наследуются от StatelessWidget класса
// и не имеют состояния
class MyApp extends StatelessWidget {
  // функция build отвечает за построение иерархии виджетов
  @override
  Widget build(BuildContext context) {
    // виджет MaterialApp - главный виджет приложения, который
    // позволяет настроить тему и использовать
    // Material Design для разработки.

    return StreamProvider.value(
      value: AuthServices().currentUser,
      initialData: null,
      child: MaterialApp(
        // заголовок приложения
        // обычно виден, когда мы сворачиваем приложение
        title: 'Json Placeholder App',
        // убираем баннер
        debugShowCheckedModeBanner: false,
        // настройка темы, мы ещё вернёмся к этому
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // указываем исходную страницу, которую мы создадим позже
        // home: SurveyListPage(),
        initialRoute: '/',
        routes: {
          '/': (context) => const LandingPage(),
          '/home': (context) => const HomePage()
        },
      ),
    );
  }
}
