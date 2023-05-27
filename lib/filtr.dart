import 'package:flutter/material.dart';
import 'package:flutter_survey_app/materials/filtr.dart';

class FiltrPage extends StatefulWidget {
  const FiltrPage({super.key});

  @override
  State<StatefulWidget> createState() => _FiltrState();
}

class _FiltrState extends State<FiltrPage> {

  String _dropCityValue = "";

  void dropCityCallback(String? selectedValue){
    if(selectedValue is String){
      setState(() {
        _dropCityValue = selectedValue;
      });
    }
  }

  String _dropSeverityValue = "0";

  void dropSeverityCallback(String? selectedValue){
    if(selectedValue is String){
      setState(() {
        _dropSeverityValue = selectedValue;
      });
    }
  }

  void fillFilters(){
    dropSeverityCallback(globalFiltr.severityFiltration);
    dropSeverityCallback(globalFiltr.cityFiltration);
  }

  @override
  Widget build(BuildContext context) {
    //fillFilters();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                  value: _dropCityValue,
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: DropdownButton(
                  items: const [
                        DropdownMenuItem(value: "4", child: Text("Мировая")),
                        DropdownMenuItem(value: "3", child: Text("Государственная")),
                        DropdownMenuItem(value: "2", child: Text("Областная")),
                        DropdownMenuItem(value: "1", child: Text("Городская")),
                        DropdownMenuItem(value: "0", child: Text("Районная")),
                  ],
                  onChanged: dropSeverityCallback,
                  value: _dropSeverityValue,
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        globalFiltr.cityFiltration = _dropCityValue;
                        globalFiltr.severityFiltration = _dropSeverityValue;
                        Navigator.popAndPushNamed(context, '/home');
                      }, 
                      child: const Text("Задать фильтры")),
                  ),
              ),
            ],
          )
        ),
      ),
    );
  }
}