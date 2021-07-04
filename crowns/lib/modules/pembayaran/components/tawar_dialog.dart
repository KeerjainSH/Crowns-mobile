import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class TawarDialog extends StatefulWidget {
  @override
  _TawarDialogState createState() => _TawarDialogState();
}

class _TawarDialogState extends State<TawarDialog> {
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
                  Text('Rp. 440.000'),
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorConstants.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
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
    );
  }
}
