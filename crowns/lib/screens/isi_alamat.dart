import 'package:crowns/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:crowns/utils/constants.dart';

class IsiAlamatPage extends StatefulWidget {
  @override
  _IsiAlamatPageState createState() => _IsiAlamatPageState();
}

class _IsiAlamatPageState extends State<IsiAlamatPage> {
  int? _state = 1;
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();

  Text buildSubFormLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 13,
        color: ColorConstants.darkGrey,
      ),
    );
  }

  Align buildFormLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  buildMaterialDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate!,
      firstDate: DateTime(2019),
      lastDate: DateTime(2020),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      helpText: 'Select booking date',
      cancelText: 'Not now',
      confirmText: 'Book',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: 'Booking date',
      fieldHintText: 'Month/Date/Year',
      builder: (BuildContext? context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
    if (pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
      });
  }

  buildMaterialTimePicker(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext? context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (pickedTime != selectedTime)
      setState(() {
        selectedTime = pickedTime;
      });
  }

  Container buildTextField() {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      padding: EdgeInsets.only(left: 11),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          keyboardType: TextInputType.multiline,
          minLines: 4,
          maxLines: null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonChoice = Center(
      child: Container(
        width: 227,
        child: _state == 1
            ? Stack(
                /// if state if Di Ambil
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
                            _state = 2;
                          });
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Antar Sendiri",
                            style: TextStyle(
                              color: ColorConstants.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
                        child: Text(
                          "Di Ambil",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
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
                            _state = 1;
                          });
                        },
                        child: Center(
                          child: Text(
                            "Di Ambil",
                            style: TextStyle(
                              color: ColorConstants.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
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
                        child: Text(
                          "Antar Sendiri",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );

    final diambilContent = Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Lokasi Kamu',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Isi dengan benar ya!',
            style: TextStyle(color: ColorConstants.darkGrey),
          ),
        ),
        SizedBox(height: 15),
        buildFormLabel('Alamat'),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: 25,
          padding: EdgeInsets.only(left: 11),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        buildFormLabel('Kecamatan'),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: 25,
          padding: EdgeInsets.only(left: 11),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        buildFormLabel('Kota'),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: 25,
          padding: EdgeInsets.only(left: 11),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        buildFormLabel('Kode Pos'),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: 25,
          padding: EdgeInsets.only(left: 11),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        buildFormLabel('Instruksi penjemputan'),
        SizedBox(height: 5),
        buildTextField(),
        SizedBox(height: 8),
        buildFormLabel('Waktu Penjemputan'),
        SizedBox(height: 6),
        Container(
          padding: EdgeInsets.only(
            left: 12,
            right: 32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 84,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: buildSubFormLabel('Tanggal'),
                      ),
                      SizedBox(height: 2),
                      InkWell(
                        onTap: () => buildMaterialDatePicker(context),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorConstants.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 22,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              DateFormat('dd/MM/yyy').format(selectedDate!),
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 53,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: buildSubFormLabel('Jam'),
                      ),
                      SizedBox(height: 2),
                      InkWell(
                        onTap: () => buildMaterialTimePicker(context),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorConstants.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 22,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              selectedTime!.format(context),
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final antarSendiriContent = Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Lokasi Penjahit',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Antar kesini ya!',
            style: TextStyle(color: ColorConstants.darkGrey),
          ),
        ),
        SizedBox(height: 15),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Pak Kamirin',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ),
        SizedBox(height: 10),
        buildFormLabel('Kelurahan'),
        SizedBox(height: 6),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Keputih',
            style: TextStyle(
              color: ColorConstants.darkGrey,
              fontSize: 10,
            ),
          ),
        ),
        SizedBox(height: 10),
        buildFormLabel('Kecamatan'),
        SizedBox(height: 6),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Sukolilo',
            style: TextStyle(
              color: ColorConstants.darkGrey,
              fontSize: 10,
            ),
          ),
        ),
        SizedBox(height: 10),
        buildFormLabel('Kota'),
        SizedBox(height: 6),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Surabaya 60123',
            style: TextStyle(
              color: ColorConstants.darkGrey,
              fontSize: 10,
            ),
          ),
        ),
        SizedBox(height: 10),
        buildFormLabel('No Telepon'),
        SizedBox(height: 6),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '08001128888',
            style: TextStyle(
              color: ColorConstants.darkGrey,
              fontSize: 10,
            ),
          ),
        ),
      ],
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
                child: _state == 1 ? diambilContent : antarSendiriContent,
              ),
              SizedBox(height: 30),
              buildButton(
                  context, 'berikutnya', RouteConstants.detilPembayaran),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
