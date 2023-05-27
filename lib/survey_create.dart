import 'package:flutter/material.dart';
import 'package:flutter_survey_app/materials/client.dart';

import 'materials/survey.dart';


class SurveyCreatePage extends StatefulWidget {
  const SurveyCreatePage({super.key});

  @override
  State<SurveyCreatePage> createState() => _SurveyCreatePageState();
}

class _SurveyCreatePageState extends State<SurveyCreatePage> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _variantController = TextEditingController();
  List<String> variantsList = <String>[];

  String _dropCityValue = " ";
  String _dropSeverityValue = "0";

  void dropCityCall(String? selectedValue){
    if(selectedValue is String){
      setState(() {
        _dropCityValue = selectedValue;
      });
    }
  }

  void dropSeverityCall(String? selectedValue){
    if(selectedValue is String){
      setState(() {
        _dropSeverityValue = selectedValue;
      });
    }
  }


  @override
  void dispose() {
    super.dispose();
    _variantController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                      controller: _titleController,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text("Название"),
                          labelStyle: const TextStyle(color: Colors.blueGrey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(75),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: Colors.deepPurple)),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.indigo,
                          )
                      ),
                    ),
                ),
                
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                      controller: _descriptionController,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text("Описание"),
                          labelStyle: const TextStyle(color: Colors.blueGrey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(75),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: Colors.deepPurple)),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.indigo,
                          )
                      ),
                    ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                        controller: _variantController,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            label: const Text("Новый вариант"),
                            labelStyle: const TextStyle(color: Colors.blueGrey),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(75),
                              borderSide: const BorderSide(color: Colors.purple),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: Colors.deepPurple)),
                          ),
                        ),
                      ),
                      
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: ElevatedButton(
                        onPressed: () {
                          if(_variantController.text != ""){
                            setState(() {
                              variantsList.add(_variantController.text);
                              _variantController.clear();
                              //variantsList.remove(variantsList[i]);
                            });
                          }
                        }, 
                        child: const Text("Добавить")
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: variantsList.length,
                  itemBuilder: (context, i) {
                    return Card(
                        color: Colors.indigo,
                        shadowColor: Colors.blue,
                        elevation: 2.0,
                        margin:
                            const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Text(
                                  style: const TextStyle(
                                    color: Colors.white
                                  ),
                                  variantsList[i]
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    variantsList.remove(variantsList[i]);
                                  });
                                }, 
                                child: const Icon(Icons.delete)
                              )
                            ],
                          ),
                        ),
                      );
                  },
                ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    children: [
                      const Text("Важность:"),

                      DropdownButton(
                      items: const [
                        DropdownMenuItem(value: "4", child: Text("Мировая")),
                        DropdownMenuItem(value: "3", child: Text("Государственная")),
                        DropdownMenuItem(value: "2", child: Text("Областная")),
                        DropdownMenuItem(value: "1", child: Text("Городская")),
                        DropdownMenuItem(value: "0", child: Text("Районная")),
                      ],
                      onChanged: dropSeverityCall,
                      value: _dropSeverityValue,
                      ),
                    ],
                  )
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    children: [
                      const Text("Город:"),

                      DropdownButton(
                      items: const [
                        DropdownMenuItem(value: "Moscow", child: Text("Москва")),
                        DropdownMenuItem(value: "Leningrad", child: Text("Ленинград")),
                        DropdownMenuItem(value: "Kazan", child: Text("Казань")),
                        DropdownMenuItem(value: "Tver", child: Text("Тверь")),
                        DropdownMenuItem(value: "Yaroslavl", child: Text("Ярославль")),
                        DropdownMenuItem(value: " ", child: Text(" ")),
                      ],
                      onChanged: dropCityCall,
                      value: _dropCityValue,
                      ),
                    ],
                  )
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        List<int> voicesList = <int>[];
                        for(int i = 0; i < variantsList.length; i++){
                          voicesList.add(0);
                        }

                        Survey newSurvey = Survey(
                          id: (surveys.length + 1).toString(),
                          title: _titleController.text,
                          variants: variantsList,
                          voices: voicesList,
                          description: _descriptionController.text,
                          city: _dropCityValue,
                          isVoited: 0,
                          offeredUserEmail: authClient.email, 
                          severity: _dropSeverityValue,
                          );
                        surveys.add(newSurvey);  
                        Navigator.popAndPushNamed(context, '/mysurveys');
                      }, 
                      child: const Text("Создать опрос")),
                  ),
                ),

                
              ],
            ),
          ),
      )
    );
  }
}