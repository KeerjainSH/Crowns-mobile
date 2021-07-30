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
      namaLengkap: responseData['nama_lengkap'],
      dada: responseData['dada'].toDouble(),
      leher: responseData['leher'].toDouble(),
      lengan: responseData['lengan'].toDouble(),
      pinggang: responseData['pinggang'].toDouble(),
      beratBadan: responseData['berat_badan'].toDouble(),
      tinggiTubuh: responseData['tinggi_tubuh'].toDouble(),
      instruksiPembuatan: responseData['instruksi_pembuatan'],
    );
  }
}
