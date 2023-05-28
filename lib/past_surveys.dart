import 'package:flutter/material.dart';
import 'package:flutter_survey_app/materials/taked_survey.dart';
import 'package:flutter_survey_app/survey_join.dart';
import 'materials/survey.dart';
import 'home_drawer.dart';

class PastSurveysPage extends StatelessWidget {
  const PastSurveysPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Survey> tempHomeList = <Survey>[];
    void researchList(){
      for(int i = 0; i < surveys.length; i++){
        if(surveys[i].isVoited == 1){
          tempHomeList.add(surveys[i]);
        }
      }
    }
    researchList();
    var primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("Прошедшие опросы", style: TextStyle(color: Colors.white, fontSize: 25),),
        backgroundColor: Colors.indigo,
      ),
      drawer: const MenuDrawer(),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.8,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: tempHomeList.length,
              itemBuilder: (context, i) {
                return Card(
                    color: Colors.indigo,
                    shadowColor: Colors.blue,
                    elevation: 2.0,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // SurveyDetails().takedSurvey = surveys[i];
                          fillSurvey(tempHomeList[i]);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SurveyDetails()));
                        },
                        
                        child: Column(
                          children: [
                            SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20
                                    ),
                                    tempHomeList[i].title!,
                                  ),
                                ),

                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                ),

                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100,
                                    ),
                                    tempHomeList[i].description!,
                                  ),
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
      ),
    );
  }
}