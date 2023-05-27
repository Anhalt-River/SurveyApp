import 'survey.dart';

Survey takedSurvey = Survey(severity: "-1", offeredUserEmail: "unnamed");

void fillSurvey(Survey oldSurvey){
  takedSurvey = Survey(
    offeredUserEmail: oldSurvey.offeredUserEmail,
    severity: oldSurvey.severity,
    id: oldSurvey.id,
    isVoited: oldSurvey.isVoited,
    title: oldSurvey.title,
    variants: oldSurvey.variants,
    voices: oldSurvey.voices,
    description: oldSurvey.description,
    city: oldSurvey.city,
  );
}

void saveSurvey(){
  var oldSurvey = surveys.where((element) => element.id == takedSurvey.id).first;
  
  oldSurvey.offeredUserEmail = takedSurvey.offeredUserEmail;
  oldSurvey.title = takedSurvey.title;
  oldSurvey.description = takedSurvey.description;
  oldSurvey.severity = takedSurvey.severity;
  oldSurvey.variants = takedSurvey.variants;
  oldSurvey.voices = takedSurvey.voices;
  oldSurvey.city = takedSurvey.city;
  oldSurvey.isVoited = 1;
}