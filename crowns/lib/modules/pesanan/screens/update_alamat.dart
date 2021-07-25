import 'package:crowns/modules/pesanan/models/alamat.dart';
import 'package:crowns/modules/pesanan/models/pesanan_baru.dart';
import 'package:crowns/modules/pesanan/providers/alamat_provider.dart';
import 'package:crowns/modules/pesanan/providers/pesanan_provider.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:crowns/constants/app_constants.dart';
import 'package:provider/provider.dart';

class UpdateAlamatScreen extends StatefulWidget {
  PesananBaru pesanan;

  UpdateAlamatScreen({required this.pesanan});

  @override
  _UpdateAlamatScreenState createState() => _UpdateAlamatScreenState();
}

class _UpdateAlamatScreenState extends State<UpdateAlamatScreen> {
  Alamat _alamat = Alamat(
    alamat: '',
    kota: '',
    kecamatan: '',
    dijemput: 1,
    id_pesanan: 0,
    instruksi: '',
    kode_pos: 0,
    waktu: '',
  );

  final formKey = new GlobalKey<FormState>();
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    AlamatProvider alamatProvider =
        Provider.of<AlamatProvider>(context, listen: false);

    final buttonChoice = Center(
      child: Container(
        width: 227,
        child: _alamat.dijemput == 1
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
                            _alamat.dijemput = 0;
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
                            _alamat.dijemput = 1;
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

    final diambilContent = Form(
      key: formKey,
      child: Column(
        children: [
          buildHeadline(context, 'Lokasi Kamu'),
          buildSubtitle(context, 'Isi dengan benar ya!'),
          SizedBox(height: 15),
          buildFormLabel(context, 'Alamat'),
          SizedBox(height: 5),
          TextFormField(
            onSaved: (value) => _alamat.alamat = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Kecamatan'),
          SizedBox(height: 5),
          TextFormField(
            onSaved: (value) => _alamat.kecamatan = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Kota'),
          SizedBox(height: 5),
          TextFormField(
            onSaved: (value) => _alamat.kota = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Kode Pos'),
          SizedBox(height: 5),
          TextFormField(
            onSaved: (value) => _alamat.kode_pos = int.parse(value!),
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Instruksi penjemputan'),
          SizedBox(height: 5),
          TextFormField(
            minLines: 3,
            maxLines: null,
            onSaved: (value) => _alamat.instruksi = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
          SizedBox(height: 8),
          buildFormLabel(context, 'Waktu Penjemputan'),
          SizedBox(height: 6),
          DateTimePicker(
            type: DateTimePickerType.dateTime,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            icon: Icon(
              Icons.event,
              color: ColorConstants.black,
            ),
            onSaved: (value) => _alamat.waktu = value!,
            validator: (value) => value == '' ? 'harus diisi' : null,
          ),
        ],
      ),
    );

    final antarSendiriContent = Column(
      children: [
        buildHeadline(context, 'Lokasi Penjahit'),
        buildSubtitle(context, 'Antar kesini ya!'),
        SizedBox(height: 15),
        buildHeadline2(context, 'Pak Kamirin'),
        SizedBox(height: 10),
        buildFormLabel(context, 'Kelurahan'),
        SizedBox(height: 5),
        buildBodyText3(context, 'Keputih'),
        SizedBox(height: 10),
        buildFormLabel(context, 'Kecamatan'),
        SizedBox(height: 5),
        buildBodyText3(context, 'Sukolilo'),
        SizedBox(height: 10),
        buildFormLabel(context, 'Kota'),
        SizedBox(height: 5),
        buildBodyText3(context, '60234'),
        SizedBox(height: 10),
        buildFormLabel(context, 'No Telepon'),
        SizedBox(height: 5),
        buildBodyText3(context, '08001128888'),
      ],
    );

    final submitButton = CustomButton(
      text: 'berikutnya',
      callback: () {
        final FormState? formState = formKey.currentState;

        if (formState!.validate()) {
          formState.save();

          final Future<Map<String, dynamic>> successfulMessage =
              alamatProvider.updateAlamat(_alamat, widget.pesanan);

          successfulMessage.then((response) {
            if (response['status']) {
              Navigator.pushNamed(
                context,
                RouteConstants.menungguKonfirmasi,
                // (route) => false,
              );
            }
          });
        }
      },
    );

    return Scaffold(
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

              buttonChoice,
              SizedBox(height: 22),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: _alamat.dijemput == 1
                    ? diambilContent
                    : antarSendiriContent,
              ),
              SizedBox(height: 30),
              submitButton,
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
