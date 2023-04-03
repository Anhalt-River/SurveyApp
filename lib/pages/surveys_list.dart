import 'package:flutter/material.dart';
import 'survey_detail.dart';
import 'survey_temp_data.dart';


// SurveyListPage не будет иметь состояния,
// т.к. этот пример создан только для демонстрации
// навигации в действии
class SurveyListPage extends StatelessWidget {
  
  // build как мы уже отметили, строит
  // иерархию наших любимых виджетов
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Survey List Page")),
      // зададим небольшие отступы для списка
      body: Padding(
        // объект EdgeInsets хранит четыре важные double переменные:
        // left, top, right, bottom - отступ слева, сверху, справа и снизу
        // EdgeInsets.all(10) - задает одинаковый отступ со всех сторон
        // EdgeInsets.only(left: 10, right: 15) - задает отступ для
        // определенной стороны или сторон
        // EdgeInsets.symmetric - позволяет указать одинаковые
        // отступы по горизонтали (left и right) и по вертикали (top и bottom)
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        // создаем наш список
          child: ListView(
            // map принимает другую функцию, которая
            // будет выполняться над каждым элементом
            // списка и возвращать новый элемент (виджет Material).
            // Результатом map является новый список
            // с новыми элементами, в данном случае
            // это Material виджеты
            children: surveys.map<Widget>((survey) {
              // Material используется для того,
              // чтобы указать цвет элементу списка
              // и применить ripple эффект при нажатии на него
              return Material(
                color: Colors.pinkAccent,
                // InkWell позволяет отслеживать
                // различные события, например: нажатие
                child: InkWell(
                  // splashColor - цвет ripple эффекта
                  splashColor: Colors.pink,
                  // нажатие на элемент списка
                  onTap: () {
                    // Здесь мы используем сокращенную форму:
                    // Navigator.of(context).push(route)
                    // PonyDetailPage принимает pony id,
                    // который мы и передали
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SurveyDetailPage(survey.id)
                    ));
                  },
                  // далее указываем в качестве
                  // элемента Container с вложенным Text
                  // Container позволяет указать внутренние (padding)
                  // и внешние отступы (margin),
                  // а также тень, закругление углов,
                  // цвет и размеры вложенного виджета
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                          survey.name,
                          style: Theme.of(context).textTheme.headline4
                      )
                  ),
                ),
              );
              // map возвращает Iterable объект, который необходимо
              // преобразовать в список с помощью toList() функции
            }).toList(),
          )
      ),
    );
  }

}