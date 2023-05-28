import 'package:flutter/material.dart';
import 'package:flutter_survey_app/materials/filtr.dart';
import 'package:flutter_survey_app/materials/taked_survey.dart';
import 'package:flutter_survey_app/survey_join.dart';
import 'materials/survey.dart';
import 'home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  

  @override
  Widget build(BuildContext context) {
  List<Survey> tempHomeList = <Survey>[];
    void researchList(){
      for(int i = 0; i < surveys.length; i++){
        if(surveys[i].isVoited == 0){
          if(globalFiltr.cityFiltration != "" || globalFiltr.severityFiltration != "0"){
            if(globalFiltr.cityFiltration == surveys[i].city && globalFiltr.severityFiltration == surveys[i].severity){
              tempHomeList.add(surveys[i]);
            }
            else if(globalFiltr.cityFiltration == surveys[i].city){
              tempHomeList.add(surveys[i]);
            }
            else if(globalFiltr.severityFiltration == surveys[i].severity){
              tempHomeList.add(surveys[i]);
            }
          }
          else {
            tempHomeList.add(surveys[i]);
          }
        }
      }
    }

    researchList();
    var primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("Что нового?", style: TextStyle(color: Colors.white, fontSize: 25),),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, '/filtr');
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.filter_alt_sharp),
      ),
      drawer: const MenuDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
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
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
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
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white
                                    ),
                                    tempHomeList[i].title!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                ),

                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.white
                                    ),
                                    tempHomeList[i].description!,
                                    textAlign: TextAlign.center,
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

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SingleChildScrollView(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width * 0.8,
//           child: ListView.builder(
//             scrollDirection: Axis.vertical,
//             shrinkWrap: true,
//             itemCount: surveys.length,
//             itemBuilder: (context, i) {
//               return Card(
//                 elevation: 2.0,
//                 margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//                 child: Center(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width * 0.2,
//                               child: Text(
//                                 surveys[i].title!,
//                               ),
//                             ),
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width * 0.4,
//                               child: Text(
//                                 surveys[i].description!,
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
