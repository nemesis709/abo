class PitcherStatModel {
  final String id;
  final double bb9;
  final double era;
  final double fip;
  final int game;
  final int hold;
  final double inning;
  final double k9;
  final int lost;
  final int save;
  final double war;
  final int win;

  PitcherStatModel({
    required this.id,
    required this.bb9,
    required this.era,
    required this.fip,
    required this.game,
    required this.hold,
    required this.inning,
    required this.k9,
    required this.lost,
    required this.save,
    required this.war,
    required this.win,
  });

  Map toJson() => {
        'id': id.toString(),
        'bb9': bb9.toString(),
        'era': era.toString(),
        'fip': fip.toString(),
        'game': game.toString(),
        'hold': hold.toString(),
        'inning': inning.toString(),
        'k9': k9.toString(),
        'lost': lost.toString(),
        'save': save.toString(),
        'war': war.toString(),
        'win': win.toString(),
      };

  static PitcherStatModel fromJson(Map json) {
    return PitcherStatModel(
      id: json['id'],
      bb9: double.parse(json['bb9']),
      era: double.parse(json['era']),
      fip: double.parse(json['fip']),
      game: int.parse(json['game']),
      hold: int.parse(json['hold']),
      inning: double.parse(json['inning']),
      k9: double.parse(json['k9']),
      lost: int.parse(json['lost']),
      save: int.parse(json['save']),
      war: double.parse(json['war']),
      win: int.parse(json['win']),
    );
  }
}

