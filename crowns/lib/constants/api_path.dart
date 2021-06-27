class ApiPath {
  static const String baseUrl = 'http://10.0.2.2:8000/api';
  static const String login = baseUrl + '/pembeli/login';
  static const String register = baseUrl + '/pembeli/register';

  static const String category = baseUrl + '/kategori';
  static const String catalog = baseUrl + '/katalog';

  static String getCatalogByCategoryId(int id) {
    return baseUrl + '/kategori/' + id.toString() + '/katalog';
  }
}
