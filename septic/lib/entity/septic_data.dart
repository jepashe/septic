class SepticData {
  final int id;
  final int device_id;
  //"time": "2023-11-09 23:52:53",
  final int dist_raw;
  final int dist;
  final double fill_percent;
  final double volume_max;
  final double distance;
  final double filling;
  final double percent;

  SepticData(
      {required this.id,
      required this.device_id,
      required this.dist_raw,
      required this.dist,
      required this.fill_percent,
      required this.volume_max,
      required this.distance,
      required this.filling,
      required this.percent});

  factory SepticData.fromJson(Map<String, dynamic> json) {
    return SepticData(
      id: json['id'] as int,
      device_id: json['device_id'] as int,
      dist_raw: json['dist_raw'] as int,
      dist: json['dist'] as int,
      fill_percent: json['fill_percent'] as double,
      volume_max: json['volume_max'] as double,
      distance: json['distance'] as double,
      filling: json['filling'] as double,
      percent: json['percent'] as double,
    );
  }
}
