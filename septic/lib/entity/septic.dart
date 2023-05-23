class Septic {
  final String fillPercent;
  final String vmax;
  Septic({
    required this.fillPercent,
    required this.vmax,
  });
  factory Septic.fromJson(Map<String, dynamic> json) {
    return Septic(
        fillPercent: json['fill_percent'] as String,
        vmax: json['vmax'] as String);
  }
}
