import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crowns/constants/api_path.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/pesanan/models/desain_custom.dart';
import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
import 'package:crowns/modules/pesanan/models/pesanan.dart';
import 'package:crowns/modules/pesanan/models/pesanan_baru.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

enum PesananStatus {
  PesananNotCreated,
  PesananCreating,
  PesananCreated,
  DesainPenjahitSelected,
  DesainSendiriSelected,
  DesainAdded,
  DesainUploading,
  DesainUploaded,
  DetailPesananUpdating,
  DetailPesananUpdated,
  Failed,
}

class PesananProvider extends ChangeNotifier {
  PesananStatus _pesananStatus = PesananStatus.PesananNotCreated;
  PesananBaru? _pesanan;
  List<DetailPesanan> _detailPesananList = [];
  List<DesainCustom> _desainCustomList = [];

  List<Pesanan> _pesananBelumValidList = [];
  RequestStatus _fetchPesananBelumValidStatus = RequestStatus.NotFetched;
  RequestStatus get fetchPesananBelumValidStatus =>
      _fetchPesananBelumValidStatus;
  List<Pesanan> get pesananBelumValidList => _pesananBelumValidList;

  List<Pesanan> _pesananSelesaiList = [];

  List<Pesanan> _pesananDikerjakanList = [];

  PesananBaru get pesanan => _pesanan!;
  PesananStatus get pesananStatus => _pesananStatus;
  List<DesainCustom> get desainCustomList => _desainCustomList;
  List<DetailPesanan> get detailPesananList => _detailPesananList;

  void createPesanan(int id_penjahit, int id_baju) async {
    final Map<String, dynamic> pesananData = {
      'id_penjahit': id_penjahit,
      'id_baju': id_baju,
    };

    _pesananStatus = PesananStatus.PesananCreating;
    notifyListeners();

    // String token = await UserPreferences().getToken();
    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxNCIsImp0aSI6IjgxY2UyODI5NzNiYjJlMTZkZGEyODM1M2ViYTdiNzMyMmI3MTdhYWNhZmE2YTRlMGVlNmUwNTQzOWE1MzcxMmI2OGU4NmFmMzFiMDlhMTc0IiwiaWF0IjoxNjI1NDkzMTMwLjUyOTQ5NywibmJmIjoxNjI1NDkzMTMwLjUyOTUwNiwiZXhwIjoxNjU3MDI5MTMwLjUxODQ1Nywic3ViIjoiMSIsInNjb3BlcyI6W119.oFlyY_Z8400Kp3kmBYkZEfAzZENfqdcAnPaSdhOyXB13Ph0u-EMYGk9kRxIQ70dAiw7WRSYroqm_jZDDnlw4S5rBlSSMx4SUlfAc5TdKWTFjhUOSVZI2pnoTpovEwvKw_bRRtm6iyVmx2zd337qJ-8t28M3wMiodcmlUXz9CcPuSCDeNacpbz5zFhXihC_1SK91NpCNwZVxe-8-Sh_teR63D424OMnUrtsqmOvfeGsKxIYC7RaNTAwZZbOEx55Xia0w04J2zDFYGkkLK57mBx19V4p_hB2ClZav91HfC5BIR0s4QbRmqi1Hb_gffPZRFo-EZCT7w71venAyXl8yaJLPcJOnTfOro51t7UeunhQwW-KDhZK1GS_MPseONKZwTjMxeLppYg_e25epnOs1ogA94v3gAuofJ7YmYsHI8jPJ4iZYas6E9bNUtAqjQk7GJd2m5yuYfNgGsfXwAawTKzAjChajeglaRvTAtbJgBn8bzPzNjk3yan_vr4baaZaZ-53o2UdPpm4Fp1llbDjNwJ02uvDNqz7Q1Enm2XDqWpdjsBvx1apu904XwjSUT2E332VHoz42PkihhGSaAFDq7zPK6ssVx7kwh9QmDFCIP4fe_ofI3N4pDgPxa9XcsmU48se1lVZScDU9MDgndELCkT4qn2_yqkpZvZSjh1lssrGM';

    Response response = await post(
      Uri.parse(ApiPath.createPesanan),
      body: json.encode(pesananData),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var pesananData = responseData['data'];

      _pesanan = new PesananBaru.fromJson(pesananData);

      addDetailPesanan();

      _pesananStatus = PesananStatus.PesananCreated;
      notifyListeners();
    } else {
      _pesananStatus = PesananStatus.Failed;
      notifyListeners();
    }
  }

  void addDesain(File image, String description) {
    final desainCustom = new DesainCustom(foto: image, deskipsi: description);

    _desainCustomList.add(desainCustom);
    _pesananStatus = PesananStatus.DesainAdded;
    notifyListeners();
  }

  void addDetailPesanan() {
    _detailPesananList.add(createEmptyDetailPesanan());
    notifyListeners();
  }

  void removeLastDetailPesanan() {
    _detailPesananList.removeLast();
    notifyListeners();
  }

  void uploadDesain() async {
    List<Map<String, dynamic>> desainCustomDataList = [];

    for (final desainCustom in desainCustomList) {
      List<int> imageBytes = desainCustom.foto.readAsBytesSync();
      String base64Image = 'data:image/png;base64,' + base64.encode(imageBytes);
      final Map<String, dynamic> desainCustomData = {
        'foto': base64Image,
        'deskripsi': desainCustom.deskipsi,
      };
      desainCustomDataList.add(desainCustomData);
    }

    Map<String, dynamic> requestBody = {
      'id_pesanan': _pesanan!.id,
      'list_foto': desainCustomDataList,
    };

    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5IiwianRpIjoiNjEwYjY3MjA1YjIxZjU2NjVkNDhmOGVkNTVhMjQyZDU0MzIyZTg4YzlhYzRhNzUyZWY2ZGIxYjhiNDE1MWNkMzliOTQ5NDg4OTJiOTk1YTYiLCJpYXQiOjE2MjQ5NDI4MzMuNjMxNzE3LCJuYmYiOjE2MjQ5NDI4MzMuNjMxNzI0LCJleHAiOjE2NTY0Nzg4MzMuNjA1NTkxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.S7lueOFzs1hXCzDaKutAAITsn-RB1aENHjF1zqWuaaa80XvtLAsoh7dPi65vHze3zWz7wkomgouDO8teSRBc32QEXFnrQhIAEyV5B5_s9XSrl24kPgn2gO8z9zM6a8yypI_EKliH0QpsjYCgBFMCZQKOestVHiuwuLO0c8lNzzkPlylmeb3upagRFWynS2DiaazjQjNZ3wW0VvGeTXeBFAfy8bHA6U74QAxiQrXsjBAe4aMJTlk1VQSxM2WSChI6EJUGJfLnO3UoSGdXfaNrkXBxbZtj8VnKgktZPIBCik_O_h_V61U0uDupZkoj32G1609dGpZWq7z9mqThnRXbPWYALA2U2H9XiswlSQ7XJzt3ndg9CLFGg-L7uCSvkgSJbCxgkzN3VXU8orKuJV9tLWmZJgmUPkyzS0IDMAcfnlTLeC0DkvPaYtPYkWzGfiZ82mzVYlMj_Ctc3vqAyxUqVH34ioRomxD0seU2LBb8gLKRAApzm91vjepeaa03zV2F0uMkiAsObsp1cbuJu3jZLjNdIStnHFhIpobqtL9t5wW1r83uKAdJvZ1KBITMZYxqlqp6rUD6oIKLd7eIbrRlidKvpLO3uzqrfvVXAEAQM8_l2zh0EET1_xWukcqM_yVAtvWoSAvTPpEzmaLDEJlEqYDJp4xBoqhyn8gRAytfO3Y';

    Response response = await post(
      Uri.parse(ApiPath.uploadDesain),
      body: json.encode(requestBody),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var desainCustomData = responseData['data'];

      _pesananStatus = PesananStatus.DesainUploaded;
      notifyListeners();
    } else {
      _pesananStatus = PesananStatus.Failed;
      notifyListeners();
    }
  }

  void updateDetailPesanan(
    List<DetailPesanan> detailPesananList,
    PesananBaru pesananBaru,
    bool kainSendiri,
  ) async {
    List<Map<String, dynamic>> detailPesananDataList = [];

    for (final detailPesanan in detailPesananList) {
      final Map<String, dynamic> detailPesananData = {
        'nama_lengkap': detailPesanan.nama_lengkap,
        'lengan': detailPesanan.lengan,
        'pinggang': detailPesanan.pinggang,
        'dada': detailPesanan.dada,
        'leher': detailPesanan.leher,
        'tinggi_tubuh': detailPesanan.tinggi_tubuh,
        'berat_badan': detailPesanan.berat_badan,
        'instruksi_pembuatan': detailPesanan.instruksi_pembuatan,
      };
      detailPesananDataList.add(detailPesananData);
    }

    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5IiwianRpIjoiNzgzMzRjMzYzY2ViNDA5NjUxMmNjNTUwNWNjNjZkNTBkYmJiNzUwOTQ2YjQ2NGE1NmI5NzQxN2I4NGMzMDUwZjJjOTVkNDQ3NmJhZDVlOWUiLCJpYXQiOjE2MjQ5NDMzNDkuNzcwODc1LCJuYmYiOjE2MjQ5NDMzNDkuNzcwODg1LCJleHAiOjE2NTY0NzkzNDkuNzYyNTgsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.nXhC5MrFgGFD-L0sRfUGppY_W7JGmF9jwWlhXjAcTEJs4u3A8JXJY3ENL4hufl7gfcQ_E0pKHxh4-sxdMo5ajKVAYAfbMeN0l-jTtVD5UNW3qmO12LoMY2-y6KgKt26nXGICugjyPj1Jb5qwHjvI_h96XXQIVw1fa0c88TwC-BakI-mKu7aRtUUVINchWNP3UNaAHqZoeEiTZv53sLW1IDqGhsOT6ecd2g0k3CHfrzTQle1oc2nzjiHn7fDY58LnRdliSzo4WctdnUegk0gDsAffE6_ctA03Lw6ov3xMawD7Rezx4DTgRkLt5i6NUwFkMkpCdVTzZyWm6VwTGeZiT28a5kBnUp4q6gc7OXcxMVsut-PWSmGIqn5dfTpGl_yFG2puHurA15EK2QltVJ_pQPUJsPQhpxP5K-I3JgTzf21d6Epb7qL-yiA7qQJSngOsoo__L1gWTokvPVSSRNntNBs-m94IBU5mx7epXVMlty-SXE_-jrkS-y-xIOWvXEivFltXyRRvUA5rrIkAUsIZUunjsmij6j3zJ1vHAZWhCjTv6oGzy9oEOgPTOBfS03mWEg4EZ2eTbev4x7YsDCHjzMYjsdUp00hxOPmHiF0dKviAszdLmwDDhABG4s8blC5kYQmNRxRkkfDrRNuOJcqPsHcCMKMc1LlXUGJ-eroIljA';

    Map<String, dynamic> requestBody = {
      'jumlah': detailPesananList.length,
      'id_pesanan': pesananBaru.id,
      'list_detail': detailPesananDataList,
    };

    Response response = await post(
      Uri.parse(ApiPath.updateDetail),
      body: json.encode(requestBody),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  void setStatus(PesananStatus status) {
    _pesananStatus = status;
    notifyListeners();
  }

  DetailPesanan createEmptyDetailPesanan() {
    return new DetailPesanan(
      nama_lengkap: '',
      dada: 0,
      leher: 0,
      lengan: 0,
      pinggang: 0,
      berat_badan: 0,
      tinggi_tubuh: 0,
      instruksi_pembuatan: '',
    );
  }

  Future<Map<String, dynamic>> fetchAllPesananBelumValid() async {
    var result;
    _fetchPesananBelumValidStatus = RequestStatus.Fetching;

    var token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDAxOWEyY2U2ZWUyNzA3OGQ4NjFjY2I2Y2NlYjExZDY2NjM3ODFlYTI4YmVmYWNkMzljYWM5NWRkZWI0NTFmZmZlNzBlMjlhNzJkYjBkOWUiLCJpYXQiOjE2MjY1MjMwODYuNTIzNzQxLCJuYmYiOjE2MjY1MjMwODYuNTIzNzY2LCJleHAiOjE2NTgwNTkwODYuNDk0MDc5LCJzdWIiOiI1MiIsInNjb3BlcyI6W119.cgR5DDJ1Mwr8wKkgYmBILnX9JYEFOUkUF_OiIFzPaDRqREW0Zk2i5eVVQY8zz_mI3JsnaKikI4WBAA5SEYnmrfuvO1U5LSWORxM9W9gHa4dacRzT7F4UXsApGdULh194V5ekoDZEalAkBwO6Yn8xJ-KzjauGzCeMKivk7-uPfWCRLEYNdTcB5naTjxM_KWLjJ1JXSIl4632zEwcOVa-H815aCz-pXnSdpGjLSYUKI3ihMMt1GKIKUtp2cXj_8cAPx_hYzxCNmVLYBeaprfFhpVmPN8iG26eknCex5TbZbYIL5tIxJ8okjuINkyJqPPv_L7NUQdFNLlgWasAUVetfJPycU5FeWuU1koAlkqEv6oB4r_7d6WHzorS37Dw7iyHMSMjqO_f7FCiBM1IcIyyy8kfwug7NISCa1uirqFTZDBZiUxRd2kf1-0L4wSm8PLBndKT9tUxDMmxb6vOuiYhuJ6788s1SOf3F4tAWOUtyTDLNgBXDeqBs5B3D8s3ncqIwuVUZnu5C7kAgnzdnYzmTMuBtuVZR50AvG52olAZaT2ac6xbaECeMMACubk7rvju4rFyt4JrX5a9rGQ4mpf28YNVqITHbcNcAm0pGTra7Lyy5CW1g0UgdptoYM2B9eW0a0-63ji2l2GmnxX3ZcgtWI0VDIrwAxGLRb2usSe0V6Xo';

    Response response = await get(
      Uri.parse(ApiPath.pesananBelumValid),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var pesananBelumValidDataList = responseData['data'];

      /// For dummy image
      /// Commnet soon
      ByteData bytes = await rootBundle.load(ImageConstants.pestaProduct1);
      var buffer = bytes.buffer;
      var base64Image = base64.encode(Uint8List.view(buffer));

      for (final pesananBelumValid in pesananBelumValidDataList) {
        Pesanan pesanan = Pesanan.fromJson(pesananBelumValid, base64Image);
        _pesananBelumValidList.add(pesanan);
      }

      _fetchPesananBelumValidStatus = RequestStatus.Fetched;
      notifyListeners();

      result = {
        'status': true,
        'message': json.decode(response.body)['message'],
        'data': _pesananBelumValidList,
      };
    } else {
      _fetchPesananBelumValidStatus = RequestStatus.Failed;
      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }
    return result;
  }

  void reset() {
    _pesananStatus = PesananStatus.PesananCreated;
    _detailPesananList.removeRange(0, _detailPesananList.length);
    _desainCustomList.removeRange(0, _desainCustomList.length);
  }
}
