import 'package:crowns/modules/pembayaran/models/metode_bayar.dart';

import 'app_constants.dart';

List<MetodeBayar> metodeBayarList = [
  MetodeBayar(
    title: 'Bank BNI',
    number: '0837998971',
    logo: ImageConstants.bankBNIlogo,
    name: 'an. Muhammmad Rayhan',
    subtitle: 'Nomor Rekening BNI',
  ),
  MetodeBayar(
    title: 'Bank Mandiri',
    number: '1400018432386',
    logo: ImageConstants.bankMandiriLogo,
    name: 'an. Johnivan Aldo Sudiono',
    subtitle: 'Nomor Rekening Mandiri',
  ),
  MetodeBayar(
    title: 'Bank BCA',
    number: '6105208140',
    logo: ImageConstants.bankBCAlogo,
    name: 'an. Johnivan Aldo Sudiono',
    subtitle: 'Nomor Rekening BCA',
  ),
  MetodeBayar(
    title: 'Gopay',
    number: '0881023150971',
    logo: ImageConstants.gopayLogo,
    name: 'an. Muhammad Rayhan',
    subtitle: 'Nomor Gopay',
  ),
  MetodeBayar(
    title: 'OVO',
    number: '0881023150971',
    logo: ImageConstants.ovoLogo,
    name: 'an. Muhammad Rayhan',
    subtitle: 'Nomor OVO',
  ),
];
