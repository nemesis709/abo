class BatterStatModel {
  final String id;
  final double avg;
  final int game;
  final int hit;
  final int hr;
  final int bb;
  final double obp;
  final double ops;
  final double pa;
  final int rbi;
  final int sb;
  final double slg;
  final int so;
  final double war;

  BatterStatModel({
    required this.id,
    required this.avg,
    required this.game,
    required this.hit,
    required this.hr,
    required this.bb,
    required this.obp,
    required this.ops,
    required this.pa,
    required this.rbi,
    required this.sb,
    required this.slg,
    required this.so,
    required this.war,
  });

  Map toJson() => {
        'id': id.toString(),
        'avg': avg.toString(),
        'game': game.toString(),
        'hit': hit.toString(),
        'hr': hr.toString(),
        'bb': bb.toString(),
        'obp': obp.toString(),
        'ops': ops.toString(),
        'pa': pa.toString(),
        'rbi': rbi.toString(),
        'sb': sb.toString(),
        'slg': slg.toString(),
        'so': so.toString(),
        'war': war.toString(),
      };

  static BatterStatModel fromJson(Map json) {
    return BatterStatModel(
      id: json['id'],
      avg: double.parse(json['avg']),
      game: double.parse(json['game']).toInt(),
      hit: double.parse(json['hit']).toInt(),
      hr: double.parse(json['hr']).toInt(),
      bb: double.parse(json['bb']).toInt(),
      obp: double.parse(json['obp']),
      ops: double.parse(json['ops']),
      pa: double.parse(json['pa']),
      rbi: double.parse(json['rbi']).toInt(),
      sb: double.parse(json['sb']).toInt(),
      slg: double.parse(json['slg']),
      so: double.parse(json['so']).toInt(),
      war: double.parse(json['war']),
    );
  }
}
