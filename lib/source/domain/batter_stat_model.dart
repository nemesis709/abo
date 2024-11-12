class BatterStatModel {
  final String id;
  final double avg;
  final double game;
  final double hit;
  final double hr;
  final double bb;
  final double obp;
  final double ops;
  final double pa;
  final double rbi;
  final double sb;
  final double slg;
  final double so;
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
      game: double.parse(json['game']),
      hit: double.parse(json['hit']),
      hr: double.parse(json['hr']),
      bb: double.parse(json['bb']),
      obp: double.parse(json['obp']),
      ops: double.parse(json['ops']),
      pa: double.parse(json['pa']),
      rbi: double.parse(json['rbi']),
      sb: double.parse(json['sb']),
      slg: double.parse(json['slg']),
      so: double.parse(json['so']),
      war: double.parse(json['war']),
    );
  }
}
