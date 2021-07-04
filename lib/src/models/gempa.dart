/// Model class [Gempa] digunakan untuk parsing data ketika melakukan
/// pemanggilan method untuk mendapatkan data gempabumi.
class Gempa {
  static final String _baseUrl = 'https://data.bmkg.go.id/DataMKG/TEWS/';

  /// [tanggal] dalam bentuk WIB
  final String? tanggal;

  /// [jam] dalam bentuk WIB
  final String? jam;

  /// [dateTime] sesuai dalam UTC (+00:00)
  final DateTime? dateTime;

  /// [coordinates] yang merupakan gabungan latitude kemudian longitude
  final String? coordinates;

  /// koordinat [lintang] dari lokasi gempa
  final String? lintang;

  /// koordinat [bujur] dari lokasi gempa
  final String? bujur;

  /// [magnitude] merupakan kekuatan gempa
  final String? magnitude;

  /// [kedalaman] kedalaman gempa dalam satuan kilometer(km)
  final String? kedalaman;

  /// [wilayah] terdekat dengan lokasi episenter gempabumi
  final String? wilayah;

  /// [potensi] tsunami atau tidak, dan status gempa dirasakan
  final String? potensi;

  /// [dirasakan] merupakan wilayah yang merasakan gempa dalam skala MMI
  final String? dirasakan;

  /// Gambar [shakemap] (peta guncangan) diawali dengan URL `https://data.bmkg.go.id/DataMKG/TEWS/`
  final String? shakemap;

  Gempa({
    this.tanggal,
    this.jam,
    this.dateTime,
    this.coordinates,
    this.lintang,
    this.bujur,
    this.magnitude,
    this.kedalaman,
    this.wilayah,
    this.potensi,
    this.dirasakan,
    this.shakemap,
  });

  /// Parsing data [json] menjadi objek [Gempa]
  factory Gempa.fromJson(Map<String, dynamic> json) => Gempa(
        tanggal: json['Tanggal'] as String?,
        jam: json['Jam'] as String?,
        dateTime: json['DateTime'] == null ? null : DateTime.parse(json['DateTime'] as String),
        coordinates: json['Coordinates'] as String?,
        lintang: json['Lintang'] as String?,
        bujur: json['Bujur'] as String?,
        magnitude: json['Magnitude'] as String?,
        kedalaman: json['Kedalaman'] as String?,
        wilayah: json['Wilayah'] as String?,
        potensi: json['Potensi'] as String?,
        dirasakan: json['Dirasakan'] as String?,
        shakemap: json['Shakemap'] == null ? null : '$_baseUrl${(json['Shakemap'] as String?)}',
      );
}
