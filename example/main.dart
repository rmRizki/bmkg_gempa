import 'package:bmkg_gempa/bmkg_gempa.dart';

void main() async {
  var client = BmkgGempa();

  Gempa gempaTerbaru = await client.gempaTerbaru();
  print("Gempa Terbaru : ${gempaTerbaru.magnitude}");
  print("Gempa Terbaru Shakemap : ${gempaTerbaru.shakemap}");

  List<Gempa> gempaTerkini = await client.gempaTerkini();
  for (var gempa in gempaTerkini) {
    print("Gempa Terkini : ${gempa.magnitude}");
    print("Gempa Terkini Potensi : ${gempa.potensi}");
  }

  List<Gempa> gempaDirasakan = await client.gempaDirasakan();
  for (var gempa in gempaDirasakan) {
    print("Gempa Dirasakan : ${gempa.magnitude}");
    print("Gempa Dirasakan : ${gempa.dirasakan}");
  }
}
