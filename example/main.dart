import 'package:bmkg_gempa/bmkg_gempa.dart';

void main() async {
  // init client BmkgGempa
  var client = BmkgGempa();

  // mendapatkan satu data gempa terbaru
  Gempa gempaTerbaru = await client.gempaTerbaru();
  print('--------------------------------');
  print('Gempabumi terbaru:');
  print("Tanggal : ${gempaTerbaru.tanggal}");
  print("Jam : ${gempaTerbaru.jam}");
  print("DateTime : ${gempaTerbaru.dateTime}");
  print("Coordinates : ${gempaTerbaru.coordinates}");
  print("Lintang : ${gempaTerbaru.lintang}");
  print("Bujur : ${gempaTerbaru.bujur}");
  print("Magnitude : ${gempaTerbaru.magnitude}");
  print("Kedalaman : ${gempaTerbaru.kedalaman}");
  print("Wilayah : ${gempaTerbaru.wilayah}");
  print("Potensi : ${gempaTerbaru.potensi}");
  print("Dirasakan : ${gempaTerbaru.dirasakan}");
  print("Shakemap : ${gempaTerbaru.shakemap}");
  print('--------------------------------');

  // mendapatkan kumpulan data gempa terkini
  List<Gempa> gempaTerkini = await client.gempaTerkini();
  print('Daftar 15 Gempabumi M 5.0+:');
  for (var gempa in gempaTerkini) {
    print('--------------------------------');
    print("Tanggal : ${gempa.tanggal}");
    print("Jam : ${gempa.jam}");
    print("DateTime : ${gempa.dateTime}");
    print("Coordinates : ${gempa.coordinates}");
    print("Lintang : ${gempa.lintang}");
    print("Bujur : ${gempa.bujur}");
    print("Magnitude : ${gempa.magnitude}");
    print("Kedalaman : ${gempa.kedalaman}");
    print("Wilayah : ${gempa.wilayah}");
    print("Potensi : ${gempa.potensi}");
    print('--------------------------------');
  }

  // mendapatkan kumpulan data gempa yang dirasakan
  List<Gempa> gempaDirasakan = await client.gempaDirasakan();
  print('Daftar 15 Gempabumi Dirasakan: ');
  for (var gempa in gempaDirasakan) {
    print('--------------------------------');
    print("Tanggal : ${gempa.tanggal}");
    print("Jam : ${gempa.jam}");
    print("DateTime : ${gempa.dateTime}");
    print("Coordinates : ${gempa.coordinates}");
    print("Lintang : ${gempa.lintang}");
    print("Bujur : ${gempa.bujur}");
    print("Magnitude : ${gempa.magnitude}");
    print("Kedalaman : ${gempa.kedalaman}");
    print("Wilayah : ${gempa.wilayah}");
    print("Dirasakan : ${gempa.dirasakan}");
    print('--------------------------------');
  }
}
