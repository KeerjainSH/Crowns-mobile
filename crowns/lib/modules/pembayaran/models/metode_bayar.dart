class MetodeBayar {
  MetodeBayar({
    required this.title,
    required this.number,
    required this.logo,
    this.name = '',
    this.subtitle = '',
  });

  String title;
  String number;
  String name;
  String logo;
  String subtitle;
}
