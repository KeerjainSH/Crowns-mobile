import 'package:crowns/modules/pesanan/providers/desain_custom_provider.dart';
import 'package:crowns/modules/pesanan/providers/pesanan_provider.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadDesainDialog extends StatefulWidget {
  const UploadDesainDialog({Key? key}) : super(key: key);

  @override
  _UploadDesainDialogState createState() => _UploadDesainDialogState();
}

class _UploadDesainDialogState extends State<UploadDesainDialog> {
  final _descController = TextEditingController();
  String? _description;

  var border = OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(5),
    ),
    borderSide: BorderSide(width: 1, style: BorderStyle.none),
  );

  @override
  Widget build(BuildContext context) {
    PesananProvider detailPesananProvider =
        Provider.of<PesananProvider>(context, listen: false);
    DesainCustomProvider desainCustomProvider =
        Provider.of<DesainCustomProvider>(context, listen: false);

    void save() {
      if (_descController.text == '') {
        _description = 'tidak ada deskripsi';
      } else {
        _description = _descController.text;
      }
      detailPesananProvider.addDesain(
          desainCustomProvider.image, _description!);
      Navigator.of(context).pop();
    }

    return Provider(
      create: (context) => desainCustomProvider.reset(),
      lazy: false,
      child: Dialog(
        child: Consumer<DesainCustomProvider>(
          builder: (context, model, child) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text(model.detailPesananStatus.toString()),
                    buildDialogTextLabel(context, 'Gambar desain'),
                    model.desainDialogStatus == DesainCustomStatus.Picked
                        ? Image.file(model.image)
                        : Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                              top: 5,
                              bottom: 10,
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: ColorConstants.softGrey,
                              ),
                              onPressed: model.pickImage,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.file_upload,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 5),
                                  buildFormLabel(
                                      context, 'Pilih gambar desain'),
                                ],
                              ),
                            ),
                          ),
                    buildDialogTextLabel(context, 'Deskripsi'),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: TextField(
                        controller: _descController,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          border: border,
                          focusedBorder: border,
                          enabledBorder: border,
                          errorBorder: border,
                          disabledBorder: border,
                          fillColor: ColorConstants.softGrey,
                        ),
                        keyboardType: TextInputType.multiline,
                        minLines: 2,
                        maxLines: null,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomButton(
                        text: 'simpan',
                        callback: save,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
