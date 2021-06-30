class MetodeBayar {
  MetodeBayar({
    required this.title,
    required this.number,
    required this.logo,
    this.name = '',
  });

  String title;
  String number;
  String name;
  String logo;
}
