class Filtr{
  String cityFiltration;
  String severityFiltration;
  
  Filtr({required this.cityFiltration, required this.severityFiltration});
}

Filtr globalFiltr = Filtr(cityFiltration: "", severityFiltration: "0");