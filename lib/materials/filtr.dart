class Filtr{
  String cityFiltration;
  String severityFiltration;
  
  Filtr({required this.cityFiltration, required this.severityFiltration});
}

Filtr globalFiltr = Filtr(cityFiltration: "", severityFiltration: "0");

List<String> severityList = <String>[
  
  "Отсутствует",
  "Районная",
  "Городская",
  "Областная",
  "Государственная",
  "Мировая",
];