import 'package:flutter/material.dart';
import 'surveys_list.dart';
import 'survey_temp_data.dart';

// также, как и PonyListPage наша страница
// не будет иметь состояния
class SurveyDetailPage extends StatelessWidget {
  // в качестве параметра мы будет получать id пони
  final int surveyId;

  // конструктор SurveyDetailPage принимает surveyId,
  // который будет присвоен нашему ранее
  // объявленному полю
  SurveyDetailPage(this.surveyId);

  @override
  Widget build(BuildContext context) {
    // получаем пони по его id
    // обратите внимание: мы импортируем surveys 
    // из файла survey_list_page.dart
    final survey = surveys[surveyId];
    return Scaffold(
      appBar: AppBar(
        title: Text("Survey Detail Page"),
      ),
      body: Padding(
        // указываем отступ для контента
        padding: EdgeInsets.all(15),
        // Column размещает дочерние виджеты в виде колонки
        // crossAxisAlignment - выравнивание по ширине (колонка) или
        // по высоте (строка)
        // mainAxisAlignment работает наоборот
        // в данном случае мы растягиваем дочерние элементы
        // на всю ширину колонки
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: EdgeInsets.all(10),
                // вы не можете указать color для Container,
                // т.к. свойство decoration было определено
                // color: Colors.pinkAccent,
                
                // BoxDecoration имеет дополнительные свойства,
                // посравнению с Container,
                // такие как: gradient, borderRadius, border, shape
                // и boxShadow
                // здесь мы задаем радиус закругления левого и правого
                // верхних углов
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                  ),
         					// цвет Container'а мы указываем в BoxDecoration
                  color: Colors.pinkAccent,
                ),
                child: Text(
                    // указываем имя survey
                    survey.name,
                    style: Theme.of(context).textTheme.headline4,
                )
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: Text(
                    // указываем описание survey
                    survey.desc,
                    style: Theme.of(context).textTheme.bodyText1
                )
            )
          ],
        ),
      )
    );
  }
}