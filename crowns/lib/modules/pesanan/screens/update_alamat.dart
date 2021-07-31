import 'package:crowns/modules/pesanan/models/alamat.dart';
import 'package:crowns/modules/pesanan/models/penjahit.dart';
import 'package:crowns/modules/pesanan/models/pesanan_baru.dart';
import 'package:crowns/modules/pesanan/providers/alamat_provider.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:crowns/constants/app_constants.dart';
import 'package:provider/provider.dart';

class UpdateAlamatScreen extends StatefulWidget {
  final PesananBaru pesanan;
  final bool kainSendiri;
  final Penjahit penjahit;

  UpdateAlamatScreen({
    required this.pesanan,
    required this.kainSendiri,
    required this.penjahit,
  });

  @override
  _UpdateAlamatScreenState createState() => _UpdateAlamatScreenState();
}

class _UpdateAlamatScreenState extends State<UpdateAlamatScreen> {
  Alamat _alamatSelesai = Alamat(
    alamat: '',
    kota: '',
    provinsi: '',
    kecamatan: '',
    dijemput: 1,
    idPesanan: 0,
    instruksi: '',
    kodePos: 0,
    waktu: '',
    tipe: 2,
  );

  final formKeySelesai = new GlobalKey<FormState>();

  DateTime? selectedDateSelesai = DateTime.now();
  TimeOfDay? selectedTimeSelesai = TimeOfDay.now();

  Alamat _alamatKain = Alamat(
    alamat: '',
    kota: '',
    provinsi: '',
    kecamatan: '',
    dijemput: 1,
    idPesanan: 0,
    instruksi: '',
    kodePos: 0,
    waktu: '',
    tipe: 1,
  );

  final formKeyKain = new GlobalKey<FormState>();

  DateTime? selectedDateKain = DateTime.now();
  TimeOfDay? selectedTimeKain = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    AlamatProvider alamatProvider =
        Provider.of<AlamatProvider>(context, listen: false);

    final buttonChoiceSelesai = Center(
      child: Container(
        width: 227,
        child: _alamatSelesai.dijemput == 1
            ? Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 145, height: 42),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontFamily: 'SFProDisplay'),
                          primary: ColorConstants.backgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(180.0),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _alamatSelesai.dijemput = 0;
                          });
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: buildLightButtonText(context, 'Ambil Sendiri'),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180.0),
                        color: ColorConstants.primaryColor,
                      ),
                      width: 114,
                      height: 42,
                      child: Center(
                        child: buildButtonText(context, 'Di Antar'),
                      ),
                    ),
                  ),
                ],
              )
            : Stack(
                /// if state is Antar Sendiri
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 145, height: 42),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontFamily: 'SFProDisplay'),
                          primary: ColorConstants.backgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(180.0),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _alamatSelesai.dijemput = 1;
                          });
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: buildLightButtonText(context, 'Di Antar'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180.0),
                        color: ColorConstants.primaryColor,
                      ),
                      width: 114,
                      height: 42,
                      child: Center(
                          child: buildButtonText(context, 'Ambil Sendiri')),
                    ),
                  ),
                ],
              ),
      ),
    );

    var diambilContentSelesai = Form(
      key: formKeySelesai,
      child: Column(
        children: [
          buildHeadline(context, 'Lokasi Kamu'),
          buildSubtitle(context, 'Isi dengan benar ya!'),
          SizedBox(height: 15),
          buildFormLabel(context, 'Alamat'),
          SizedBox(height: 5),
          TextFormField(
            onSaved: (value) => _alamatSelesai.alamat = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Kecamatan'),
          SizedBox(height: 5),
          TextFormField(
            onSaved: (value) => _alamatSelesai.kecamatan = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Kota'),
          SizedBox(height: 5),
          TextFormField(
            onSaved: (value) => _alamatSelesai.kota = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Provinsi'),
          SizedBox(height: 5),
          TextFormField(
            onSaved: (value) => _alamatSelesai.provinsi = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Kode Pos'),
          SizedBox(height: 5),
          TextFormField(
            keyboardType: TextInputType.number,
            onSaved: (value) => _alamatSelesai.kodePos = int.parse(value!),
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Instruksi penjemputan'),
          SizedBox(height: 5),
          TextFormField(
            minLines: 3,
            maxLines: null,
            onSaved: (value) => _alamatSelesai.instruksi = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Waktu Penjemputan'),
          SizedBox(height: 6),
          DateTimePicker(
            type: DateTimePickerType.date,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            icon: Icon(
              Icons.event,
              color: ColorConstants.black,
            ),
            onSaved: (value) => _alamatSelesai.waktu = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
        ],
      ),
    );

    final antarSendiriContentSelesai = Column(
      children: [
        buildHeadline(context, 'Lokasi Penjahit'),
        buildSubtitle(context, 'Antar kesini ya!'),
        SizedBox(height: 15),
        buildHeadline2(context, widget.penjahit.nama),
        SizedBox(height: 10),
        buildFormLabel(context, 'Alamat'),
        SizedBox(height: 5),
        buildBodyText3(context, widget.penjahit.alamat),
        SizedBox(height: 10),
        buildFormLabel(context, 'Kecamatan'),
        SizedBox(height: 5),
        buildBodyText3(context, widget.penjahit.kecamatan),
        SizedBox(height: 10),
        buildFormLabel(context, 'Kota'),
        SizedBox(height: 5),
        buildBodyText3(context, widget.penjahit.kota),
        SizedBox(height: 10),
        buildFormLabel(context, 'No Telepon'),
        SizedBox(height: 5),
        buildBodyText3(context, widget.penjahit.noHp),
      ],
    );

    final buttonChoiceKain = Center(
      child: Container(
        width: 227,
        child: _alamatKain.dijemput == 1
            ? Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 145, height: 42),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontFamily: 'SFProDisplay'),
                          primary: ColorConstants.backgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(180.0),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _alamatKain.dijemput = 0;
                          });
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: buildLightButtonText(context, 'Antar Sendiri'),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180.0),
                        color: ColorConstants.primaryColor,
                      ),
                      width: 114,
                      height: 42,
                      child: Center(
                        child: buildButtonText(context, 'Di Ambil'),
                      ),
                    ),
                  ),
                ],
              )
            : Stack(
                /// if state is Antar Sendiri
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 145, height: 42),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontFamily: 'SFProDisplay'),
                          primary: ColorConstants.backgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(180.0),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _alamatKain.dijemput = 1;
                          });
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: buildLightButtonText(context, 'Di Ambil'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180.0),
                        color: ColorConstants.primaryColor,
                      ),
                      width: 114,
                      height: 42,
                      child: Center(
                          child: buildButtonText(context, 'Antar Sendiri')),
                    ),
                  ),
                ],
              ),
      ),
    );

    var diambilContentKain = Form(
      key: formKeyKain,
      child: Column(
        children: [
          buildHeadline(context, 'Lokasi Kamu'),
          buildSubtitle(context, 'Isi dengan benar ya!'),
          SizedBox(height: 15),
          buildFormLabel(context, 'Alamat'),
          SizedBox(height: 5),
          TextFormField(
            onSaved: (value) => _alamatKain.alamat = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Kecamatan'),
          SizedBox(height: 5),
          TextFormField(
            onSaved: (value) => _alamatKain.kecamatan = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Kota'),
          SizedBox(height: 5),
          TextFormField(
            onSaved: (value) => _alamatKain.kota = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Provinsi'),
          SizedBox(height: 5),
          TextFormField(
            onSaved: (value) => _alamatKain.provinsi = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Kode Pos'),
          SizedBox(height: 5),
          TextFormField(
            keyboardType: TextInputType.number,
            onSaved: (value) => _alamatKain.kodePos = int.parse(value!),
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Instruksi penjemputan'),
          SizedBox(height: 5),
          TextFormField(
            minLines: 3,
            maxLines: null,
            onSaved: (value) => _alamatKain.instruksi = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Waktu Penjemputan'),
          SizedBox(height: 6),
          DateTimePicker(
            type: DateTimePickerType.date,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            icon: Icon(
              Icons.event,
              color: ColorConstants.black,
            ),
            onSaved: (value) => _alamatKain.waktu = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
        ],
      ),
    );

    final submitButton = CustomButton(
      text: 'berikutnya',
      callback: () {
        final FormState? formStateSelesai = formKeySelesai.currentState;
        final FormState? formStateKain = formKeyKain.currentState;

        bool validateSelesai = true;
        bool validateKain = true;

        List<Alamat> alamatList = [];

        if (_alamatSelesai.dijemput == 1) {
          if (formStateSelesai!.validate()) {
            formStateSelesai.save();
            if (_alamatSelesai.dijemput == 1) alamatList.add(_alamatSelesai);
          } else
            validateSelesai = false;
        }

        if (widget.kainSendiri) {
          if (_alamatKain.dijemput == 1) {
            if (formStateKain!.validate()) {
              formStateKain.save();
              if (_alamatKain.dijemput == 1) alamatList.add(_alamatKain);
            } else
              validateKain = false;
          }
        }

        if (validateSelesai && validateKain) {
          final Future<Map<String, dynamic>> successfulMessage =
              alamatProvider.updateAlamat(alamatList, widget.pesanan);

          successfulMessage.then((response) {
            if (response['status']) {
              Navigator.pushNamed(
                context,
                RouteConstants.transisiPesanan,
                // (route) => false,
              );
            }
          });
        }
      },
    );

    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Apakah anda yakin?'),
              content: new Text('Jika ia pesanan tidak ada akan diproses'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('Tidak'),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, RouteConstants.landingPage, (route) => false),
                  child: new Text('Ya'),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 41),
                appHeader,
                SizedBox(height: 36),

                /// Show image progress bar
                Container(
                  width: 221,
                  child: Image.asset(ImageConstants.progressBar3),
                ),
                SizedBox(height: 24),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  margin: EdgeInsets.only(bottom: 5),
                  child: Center(
                    child: Text(
                      'Baju kamu',
                      style: TextStyle(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                buttonChoiceSelesai,
                SizedBox(height: 22),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: _alamatSelesai.dijemput == 1
                      ? diambilContentSelesai
                      : antarSendiriContentSelesai,
                ),

                widget.kainSendiri
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            margin: EdgeInsets.only(top: 10, bottom: 5),
                            child: Center(
                              child: Text(
                                'Bahan kain',
                                style: TextStyle(
                                  color: ColorConstants.primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                          buttonChoiceKain,
                          SizedBox(height: 22),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: _alamatKain.dijemput == 1
                                ? diambilContentKain
                                : antarSendiriContentSelesai,
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
                SizedBox(height: 30),
                submitButton,
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
