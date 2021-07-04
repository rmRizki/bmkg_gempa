import 'package:bmkg_gempa/bmkg_gempa.dart';
import 'package:test/test.dart';

void main() {
  late BmkgGempa client;

  setUpAll(() {
    client = BmkgGempa();
  });
  test('mendapatkan satu data gempa terbaru', () async {
    var gempaTerbaru = await client.gempaTerbaru();
    expect(gempaTerbaru, isA<Gempa>());
    expect(gempaTerbaru.bujur, isA<String>());
    expect(gempaTerbaru.lintang, isA<String>());
    expect(gempaTerbaru.coordinates, isA<String>());
    expect(gempaTerbaru.dateTime, isA<DateTime>());
    expect(gempaTerbaru.dirasakan, isA<String>());
    expect(gempaTerbaru.jam, isA<String>());
    expect(gempaTerbaru.kedalaman, isA<String>());
    expect(gempaTerbaru.magnitude, isA<String>());
    expect(gempaTerbaru.potensi, isA<String>());
    expect(gempaTerbaru.shakemap, isA<String>());
    expect(gempaTerbaru.tanggal, isA<String>());
    expect(gempaTerbaru.wilayah, isA<String>());
  });

  test('mendapatkan kumpulan data gempa terkini', () async {
    var gempaList = await client.gempaTerkini();
    var gempa = gempaList[0];
    expect(gempaList, isA<List<Gempa>>());
    expect(gempaList.length, 15);
    expect(gempa, isA<Gempa>());
    expect(gempa.bujur, isA<String>());
    expect(gempa.lintang, isA<String>());
    expect(gempa.coordinates, isA<String>());
    expect(gempa.dateTime, isA<DateTime>());
    expect(gempa.dirasakan, null);
    expect(gempa.jam, isA<String>());
    expect(gempa.kedalaman, isA<String>());
    expect(gempa.magnitude, isA<String>());
    expect(gempa.potensi, isA<String>());
    expect(gempa.shakemap, null);
    expect(gempa.tanggal, isA<String>());
    expect(gempa.wilayah, isA<String>());
  });

  test('mendapatkan kumpulan data gempa yang dirasakan', () async {
    var gempaList = await client.gempaDirasakan();
    var gempa = gempaList[0];
    expect(gempaList, isA<List<Gempa>>());
    expect(gempaList.length, 15);
    expect(gempa, isA<Gempa>());
    expect(gempa.bujur, isA<String>());
    expect(gempa.lintang, isA<String>());
    expect(gempa.coordinates, isA<String>());
    expect(gempa.dateTime, isA<DateTime>());
    expect(gempa.dirasakan, isA<String>());
    expect(gempa.jam, isA<String>());
    expect(gempa.kedalaman, isA<String>());
    expect(gempa.magnitude, isA<String>());
    expect(gempa.potensi, null);
    expect(gempa.shakemap, null);
    expect(gempa.tanggal, isA<String>());
    expect(gempa.wilayah, isA<String>());
  });
}
