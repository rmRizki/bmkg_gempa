class Gempa {
  static final String _baseUrl = 'https://data.bmkg.go.id/DataMKG/TEWS/';

  final String? tanggal;
  final String? jam;
  final DateTime? dateTime;
  final String? coordinates;
  final String? lintang;
  final String? bujur;
  final String? magnitude;
  final String? kedalaman;
  final String? wilayah;
  final String? potensi;
  final String? dirasakan;
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

  factory Gempa.fromJson(Map<String, dynamic> json) => Gempa(
        tanggal: json['Tanggal'] as String?,
        jam: json['Jam'] as String?,
        dateTime: json['DateTime'] == null
            ? null
            : DateTime.parse(json['DateTime'] as String),
        coordinates: json['Coordinates'] as String?,
        lintang: json['Lintang'] as String?,
        bujur: json['Bujur'] as String?,
        magnitude: json['Magnitude'] as String?,
        kedalaman: json['Kedalaman'] as String?,
        wilayah: json['Wilayah'] as String?,
        potensi: json['Potensi'] as String?,
        dirasakan: json['Dirasakan'] as String?,
        shakemap: json['Shakemap'] == null
            ? null
            : '$_baseUrl${(json['Shakemap'] as String?)}',
      );
}
