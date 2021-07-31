class DetailPesanan {
  String namaLengkap;
  double lengan;
  double leher;
  double pinggang;
  double tinggiTubuh;
  double dada;
  double beratBadan;
  String instruksiPembuatan;

  DetailPesanan({
    required this.namaLengkap,
    required this.dada,
    required this.leher,
    required this.lengan,
    required this.pinggang,
    required this.beratBadan,
    required this.tinggiTubuh,
    required this.instruksiPembuatan,
  });

  factory DetailPesanan.fromJson(Map<String, dynamic> responseData) {
    return new DetailPesanan(
      namaLengkap: responseData['nama_lengkap'] ?? '',
      dada:
          responseData['dada'] == null ? 0.0 : responseData['dada'].toDouble(),
      leher: responseData['leher'] == null
          ? 0.0
          : responseData['leher'].toDouble(),
      lengan: responseData['lengan'] == null
          ? 0.0
          : responseData['lengan'].toDouble(),
      pinggang: responseData['pinggang'] == null
          ? 0.0
          : responseData['pinggang'].toDouble(),
      beratBadan: responseData['berat_badan'] == null
          ? 0.0
          : responseData['berat_badan'].toDouble(),
      tinggiTubuh: responseData['tinggi_tubuh'] == null
          ? 0.0
          : responseData['tinggi_tubuh'].toDouble(),
      instruksiPembuatan: responseData['instruksi_pembuatan'] == null
          ? ''
          : responseData['instruksi_pembuatan'],
    );
  }
}
