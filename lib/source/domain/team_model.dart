enum Team {
  Kiwoom('키움', 10),
  Hanwha('한화', 6),
  Lotte('롯데', 5),
  Doosan('두산', 2),
  Samsung('삼성', 4),
  LG('LG', 7),
  Kia('KIA', 8),
  KT('KT', 3),
  SSG('SSG', 9),
  NC('NC', 1);

  final String name;
  final int id;

  const Team(this.name, this.id);
}
