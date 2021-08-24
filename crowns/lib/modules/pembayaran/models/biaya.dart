class Biaya {
  int biayaJahit;
  int biayaMaterial;
  int biayaKirim;
  int biayaJemput;

  Biaya({
    required this.biayaJahit,
    required this.biayaJemput,
    required this.biayaKirim,
    required this.biayaMaterial,
  });

  int getBiayaTotal() {
    return this.biayaJemput +
        this.biayaKirim +
        this.biayaMaterial +
        this.biayaJahit;
  }
}
