import 'package:flutter/material.dart';
import 'package:flutter_survey_app/materials/taked_survey.dart';
import 'package:flutter_survey_app/survey_join.dart';
import 'materials/survey.dart';
import 'home_drawer.dart';
import 'materials/client.dart';

class MySurveysPage extends StatelessWidget {
  const MySurveysPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Survey> tempHomeList = <Survey>[];
    void researchList(){
      for(int i = 0; i < surveys.length; i++){
        if(surveys[i].offeredUserEmail == authClient.email){
          tempHomeList.add(surveys[i]);
        }
      }
    }
    researchList();
    var primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, '/createsurvey');
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("Ваши опросы", style: TextStyle(color: Colors.white, fontSize: 25),),
        backgroundColor: Colors.indigo,
      ),
      drawer: const MenuDrawer(),
      body: Center(
        child: SingleChildScrollView(
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
                                  width: MediaQuery.of(context).size.width * 0.5,
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
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100
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