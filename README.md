# bmkg_gempa

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT) 
[![pub package](https://img.shields.io/pub/v/bmkg_gempa.svg)](https://pub.dartlang.org/packages/bmkg_gempa)

Dart client library untuk mendapat data gempabumi dari situs data terbuka BMKG.

## Contoh Penggunaan

```dart
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
```

## License

MIT

## Credits

Sumber data pada package ini berasal dari situs Data Terbuka milik BMKG(Badan Meteorologi, Klimatologi, dan Geofisika) - [Link](https://data.bmkg.go.id/gempabumi/)