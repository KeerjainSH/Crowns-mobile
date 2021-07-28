import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/modules/pesanan/models/pesanan.dart';
import 'package:crowns/modules/pesanan/providers/pesanan_provider.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDialog extends StatefulWidget {
  PesananProvider pesananProvider;
  Pesanan pesanan;

  RatingDialog({
    required this.pesananProvider,
    required this.pesanan,
  });

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  bool isLoading = false;
  double _rating = 3;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                _rating = rating;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Align(
              alignment: Alignment.center,
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : CustomButton(
                      text: 'submit',
                      callback: () {
                        final Future<Map<String, dynamic>> successfulMessage =
                            widget.pesananProvider
                                .giveRating(widget.pesanan.id, _rating);

                        setState(() {
                          isLoading = true;
                        });

                        successfulMessage.then((response) {
                          setState(() {
                            isLoading = false;
                          });
                          if (response['status']) {
                            Navigator.pop(context, _rating);

                            final snackBar = SnackBar(
                              content: Text('Berhasil memberikan rating'),
                              backgroundColor: ColorConstants.black,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            final snackBar = SnackBar(
                              content: Text(
                                  'Terjadi kesalahan saat memberikan rating'),
                              backgroundColor: ColorConstants.black,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                      },
                    ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
