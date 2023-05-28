import 'package:flutter/material.dart';
import 'package:flutter_survey_app/materials/filtr.dart';

class FiltrPage extends StatefulWidget {
  const FiltrPage({super.key});

  @override
  State<StatefulWidget> createState() => _FiltrState();
}

class _FiltrState extends State<FiltrPage> {

  // String _dropCityValue = "";

  void dropCityCallback(String? selectedValue){
    if(selectedValue is String){
      setState(() {
        globalFiltr.cityFiltration = selectedValue;
      });
    }
  }

  // String _dropSeverityValue = "0";

  void dropSeverityCallback(String? selectedValue){
    if(selectedValue is String){
      setState(() {
        globalFiltr.severityFiltration = selectedValue;
      });
    }
  }

  // void fillFilters(){
  //   setState(() {
  //     _dropCityValue = globalFiltr.cityFiltration;
  //     _dropSeverityValue = globalFiltr.severityFiltration;

  //     dropCityCallback(_dropCityValue);
  //     dropSeverityCallback(_dropSeverityValue);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //fillFilters();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
          backgroundColor: Colors.indigo,
          child: const Icon(Icons.keyboard_return_outlined),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: DropdownButton(
                  items: const [
                    DropdownMenuItem(value: "Moscow", child: Text("Москва")),
                    DropdownMenuItem(value: "Leningrad", child: Text("Ленинград")),
                    DropdownMenuItem(value: "Kazan", child: Text("Казань")),
                    DropdownMenuItem(value: "Tver", child: Text("Тверь")),
                    DropdownMenuItem(value: "Yaroslavl", child: Text("Ярославль")),
                    DropdownMenuItem(value: "", child: Text("(Отсутствует)")),
                  ],
                  onChanged: dropCityCallback,
                  value: globalFiltr.cityFiltration,
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: DropdownButton(
                  items: const [
                        DropdownMenuItem(value: "5", child: Text("Мировая")),
                        DropdownMenuItem(value: "4", child: Text("Государственная")),
                        DropdownMenuItem(value: "3", child: Text("Областная")),
                        DropdownMenuItem(value: "2", child: Text("Городская")),
                        DropdownMenuItem(value: "1", child: Text("Районная")),
                        DropdownMenuItem(value: "0", child: Text("(Отсутствует)")),
                  ],
                  onChanged: dropSeverityCallback,
                  value: globalFiltr.severityFiltration,
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Center(
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigo)),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/home');
                      }, 
                      child: const Text("Задать фильтры")),
                  ),
              ),
            ],
          )
        ),
      );
  }
}