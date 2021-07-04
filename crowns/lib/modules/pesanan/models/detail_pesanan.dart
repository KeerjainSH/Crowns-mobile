class DetailPesanan {
  String nama_lengkap;
  int lengan;
  int leher;
  int pinggang;
  int tinggi_tubuh;
  int dada;
  int berat_badan;
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
    return DetailPesanan(
      nama_lengkap: responseData['nama_lengkap'],
      dada: responseData['dada'],
      leher: responseData['leher'],
      lengan: responseData['lengan'],
      pinggang: responseData['pinggang'],
      berat_badan: responseData['berat_badan'],
      tinggi_tubuh: responseData['tinggi_tubuh'],
      instruksi_pembuatan: responseData['instruksi_pembuatan'],
    );
  }
}
