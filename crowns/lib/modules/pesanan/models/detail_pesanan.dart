class DetailPesanan {
  String nama_lengkap;
  double lengan;
  double leher;
  double pinggang;
  double tinggi_tubuh;
  double dada;
  double berat_badan;
  String instruksi_pembuatan;

  DetailPesanan({
    required this.nama_lengkap,
    required this.dada,
    required this.leher,
    required this.lengan,
    required this.pinggang,
    required this.berat_badan,
    required this.tinggi_tubuh,
    required this.instruksi_pembuatan,
  });

  factory DetailPesanan.fromJson(Map<String, dynamic> responseData) {
    return new DetailPesanan(
      nama_lengkap: responseData['nama_lengkap'],
      dada: responseData['dada'].toDouble(),
      leher: responseData['leher'].toDouble(),
      lengan: responseData['lengan'].toDouble(),
      pinggang: responseData['pinggang'].toDouble(),
      berat_badan: responseData['berat_badan'].toDouble(),
      tinggi_tubuh: responseData['tinggi_tubuh'].toDouble(),
      instruksi_pembuatan: responseData['instruksi_pembuatan'],
    );
  }
}
