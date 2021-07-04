import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bmkg_gempa/src/models/gempa.dart';

class BmkgGempa {
  final String _baseUrl = 'data.bmkg.go.id';
  final String _path = '/DataMKG/TEWS/';

  Future<dynamic> _getRequest(String url, {Map<String, String>? query}) async {
    var uri = Uri.https(_baseUrl, url, query);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }

  /// Mendapatkan data gempabumi terbaru
  ///
  /// Mengembalikan object [Gempa] jika pemanggilan sukses
  /// Nilai properti yang tersedia pada method ini berupa :
  /// - Tanggal
  /// - Jam
  /// - DateTime
  /// - Coordinates
  /// - Lintang
  /// - Bujur
  /// - Magnitude
  /// - Kedalaman
  /// - Wilayah
  /// - Potensi
  /// - Dirasakan
  /// - Shakemap
  /// 
  /// Throws [Exception] jika terjadi error
  Future<Gempa> gempaTerbaru() async {
    var url = '${_path}autogempa.json';
    var response = await _getRequest(url);
    var json = response['Infogempa']['gempa'];
    return Gempa.fromJson(json);
  }

  /// Mendapatkan daftar 15 data gempabumi M 5.0+
  ///
  /// Mengembalikan object List [Gempa] jika pemanggilan sukses
  /// Nilai properti yang tersedia pada method ini berupa :
  /// - Tanggal
  /// - Jam
  /// - DateTime
  /// - Coordinates
  /// - Lintang
  /// - Bujur
  /// - Magnitude
  /// - Kedalaman
  /// - Wilayah
  /// - Potensi
  /// 
  /// Throws [Exception] jika terjadi error
  Future<List<Gempa>> gempaTerkini() async {
    var url = '${_path}gempaterkini.json';
    var response = await _getRequest(url);

    var gempaList = <Gempa>[];
    List json = response['Infogempa']['gempa'];
    for (var e in json) {
      var gempa = Gempa.fromJson(e);
      gempaList.add(gempa);
    }
    return gempaList;
  }

  /// Mendapatkan daftar 15 data gempabumi yang dirasakan
  ///
  /// Mengembalikan object List [Gempa] jika pemanggilan sukses.
  /// Nilai properti yang tersedia pada method ini berupa :
  /// - Tanggal
  /// - Jam
  /// - DateTime
  /// - Coordinates
  /// - Lintang
  /// - Bujur
  /// - Magnitude
  /// - Kedalaman
  /// - Wilayah
  /// - Dirasakan  
  /// 
  /// Throws [Exception] jika terjadi error
  Future<List<Gempa>> gempaDirasakan() async {
    var url = '${_path}gempadirasakan.json';
    var response = await _getRequest(url);

    var gempaList = <Gempa>[];
    List json = response['Infogempa']['gempa'];
    for (var e in json) {
      var gempa = Gempa.fromJson(e);
      gempaList.add(gempa);
    }
    return gempaList;
  }
}
