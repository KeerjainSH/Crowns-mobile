import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/modules/pembayaran/models/tawaran.dart';
import 'package:crowns/modules/pembayaran/providers/pembayaran_provider.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class TawarDialog extends StatefulWidget {
  final String totalHarga;
  final int idPesanan;
  final PembayaranProvider pembayaranProvider;

  TawarDialog({
    required this.totalHarga,
    required this.idPesanan,
    required this.pembayaranProvider,
  });

  @override
  _TawarDialogState createState() => _TawarDialogState();
}

class _TawarDialogState extends State<TawarDialog> {
  Tawaran tawaran = new Tawaran(
    jumlahPenawaran: 0,
    hariTawar: DateTime.now(),
  );
  final formKey = new GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildHeadline(context, 'Tawar'),
              SizedBox(height: 25),
              buildDialogTextLabel(context, 'Harga dari penjahit'),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Biaya:'),
                    Text('Rp. ${widget.totalHarga}'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              buildDialogTextLabel(context, 'Biaya yang ingin kamu tawarkan'),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.27,
                      child: Text('Harga: '),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text('Rp. '),
                          SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                isDense: true,
                              ),
                              onSaved: (value) =>
                                  tawaran.jumlahPenawaran = int.parse(value!),
                              validator: (value) =>
                                  value == '' ? 'Wajib diisi' : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.27,
                      child: Text('Hari: '),
                    ),
                    Expanded(
                      child: DateTimePicker(
                        type: DateTimePickerType.date,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        onSaved: (value) {
                          tawaran.hariTawar = DateTime.parse(value!);
                          print(tawaran.hariTawar);
                          // tawaran.hari_tawar = value!
                        },
                        // onSaved: (value) => tawaran.hari_tawar = DateTime.now(),
                        validator: (value) =>
                            value == '' ? 'Wajib diisi' : null,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: isLoading
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: ColorConstants.primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {
                            final FormState? form = formKey.currentState;

                            if (form!.validate()) {
                              form.save();

                              final Future<Map<String, dynamic>>
                                  successfulMessage = widget.pembayaranProvider
                                      .postTawar(tawaran, widget.idPesanan);

                              setState(() {
                                isLoading = true;
                              });

                              successfulMessage.then((response) {
                                setState(() {
                                  isLoading = false;
                                });
                                if (response['status']) {
                                  Navigator.pop(context, 2);
                                }
                              });
                            }
                          },
                          child: Text(
                            'Kirim tawaran',
                            style: TextStyle(
                              // color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
