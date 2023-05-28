import 'package:flutter/material.dart';
import 'package:flutter_survey_app/materials/filtr.dart';
import 'package:flutter_survey_app/materials/taked_survey.dart';
import 'package:flutter_survey_app/services/auth_user.dart';
import 'package:provider/provider.dart';
import 'materials/survey.dart';
import 'materials/client.dart';

class SurveyDetails extends StatefulWidget {
  Survey? takedSurvey;
  SurveyDetails({super.key, this.takedSurvey});
  int secVal = revalueVoices();
//   final String searchText;
//   const DealsPage(this.searchText, {super.key});

//   @override
//   State<DealsPage> createState() => _DealsPageState();
// }
  @override
  State<SurveyDetails> createState() => SurveyDetailsState();
}

int revalueVoices(){
  int tempValue = 0;
  for(int i = 0; i < takedSurvey.voices!.length; i++)
  {
    tempValue += takedSurvey.voices![i];
  }
  return tempValue;
}

String formatData(int takedVoices, int secVal){
  return "${"${(takedVoices / secVal ) * 100}".split('.')[0]}%";
}

  int totalVoices = 0;

class SurveyDetailsState extends State<SurveyDetails> {
  
 @override
  void dispose(){
   super.dispose();
  }

  @override
  void initState() {
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        const Text('Наименование: '),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(takedSurvey.title != null ? takedSurvey.title! : "Не описано",
                            maxLines: 3, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        const Text('Описание: '),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(takedSurvey.description != null ? takedSurvey.description! : "Не описано",
                          softWrap: true, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                  

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      children: [
                        const Text('Город: '),
                        Text(takedSurvey.city != null ? takedSurvey.city! : "Не обозначен",
                        style: const TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Row(
                      children: [
                        const Text('Важность: '),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(severityList[int.parse(takedSurvey.severity)],
                          softWrap: true,
                            style: const TextStyle(fontWeight: FontWeight.bold),),
                            ),
                        
                        Text(takedSurvey.severity,
                        style: const TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  
                  const Text('Варианты'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: takedSurvey.variants?.length,
                          itemBuilder: (context, i) {
                            return Card(
                              color: Colors.indigo,
                              elevation: 2.0,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if(takedSurvey.isVoited == 0 && takedSurvey.offeredUserEmail != authClient.email){
                                    setState(() {
                                      takedSurvey.voices![i]++;
                                      widget.secVal = revalueVoices(); 
                                      takedSurvey.isVoited = 1;
                                      saveSurvey();
                                    });
                                    }
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width *
                                                    0.2,
                                            child: Text(
                                                    style: const TextStyle(
                                                      color: Colors.white
                                                    ), 
                                                    takedSurvey.variants![i])
                                            ),
                                        SizedBox(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.4,
                                            // child: Text("${"${(taked_survey.voices![i]/ widget.secVal ) * 100}".split('.')[0]}%",
                                            child: Text(formatData(takedSurvey.voices![i], widget.secVal),
                                                      style: const TextStyle(
                                                        color: Colors.white
                                                      ),),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                                        
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
          backgroundColor: Colors.indigo,
          child: const Icon(Icons.highlight_remove_sharp),
        ));
  }
}
