import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:crowns/constants/api_path.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/auth/providers/auth_provider.dart';
import 'package:crowns/modules/pesanan/models/desain_custom.dart';
import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
import 'package:crowns/modules/pesanan/models/pesanan.dart';
import 'package:crowns/modules/pesanan/models/pesanan_baru.dart';
import 'package:crowns/utils/services/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  RequestStatus _allPesananStatus = RequestStatus.NotFetched;

  PesananBaru? _pesanan;
  List<DetailPesanan> _detailPesananList = [];
  List<DesainCustom> _desainCustomList = [];

  RequestStatus get allPesananStatus => _allPesananStatus;

  // List<Pesanan> _pesananBelumValidList = [];

  RequestStatus _fetchPesananBelumValidStatus = RequestStatus.NotFetched;

  RequestStatus get fetchPesananBelumValidStatus =>
      _fetchPesananBelumValidStatus;
  // List<Pesanan> get pesananBelumValidList => _pesananBelumValidList;

  List<Pesanan> _pesananSelesaiList = [];

  List<Pesanan> _pesananDikerjakanList = [];

  PesananBaru get pesanan => _pesanan!;
  PesananStatus get pesananStatus => _pesananStatus;
  List<DesainCustom> get desainCustomList => _desainCustomList;
  List<DetailPesanan> get detailPesananList => _detailPesananList;

  void createPesanan(int id_penjahit, int id_baju) async {
    final Map<String, dynamic> pesananData = {
      'id_penjahit': id_penjahit,
      'id_baju': id_baju
    };

    _pesananStatus = PesananStatus.PesananCreating;
    notifyListeners();

    String token = await UserPreferences().getToken();

    final Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await post(
      Uri.parse(ApiPath.createPesanan),
      headers: header,
      body: jsonEncode(pesananData),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var pesananData = responseData['data'];

      _pesanan = new PesananBaru.fromJson(pesananData);

      inspect(_pesanan);

      addDetailPesanan();

      _pesananStatus = PesananStatus.PesananCreated;
      notifyListeners();
      print('berhasil');
    } else {
      _pesananStatus = PesananStatus.Failed;
      notifyListeners();
      print('gagal');
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

    print(requestBody);

    var token = await UserPreferences().getToken();
    print(token);

    Response response = await post(
      Uri.parse(ApiPath.uploadDesain),
      body: json.encode(requestBody),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    // inspect(response);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var desainCustomData = responseData['data'];

      _pesananStatus = PesananStatus.DesainUploaded;
      notifyListeners();
      print('berhasil');
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);
      _pesananStatus = PesananStatus.Failed;
      notifyListeners();
      print(responseData['message']);
    }
  }

  Future<Map<String, dynamic>> updateDetailPesanan(
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

    var token = await UserPreferences().getToken();

    Map<String, dynamic> requestBody = {
      'jumlah': detailPesananList.length,
      'id_pesanan': pesananBaru.id,
      'list_detail': detailPesananDataList,
      'kain_sendiri': kainSendiri,
    };

    print(requestBody);

    Response response = await post(
      Uri.parse(ApiPath.updateDetail),
      body: json.encode(requestBody),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    var result;

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      result = {
        'status': true,
        'message': responseData['message'],
      };
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);
      result = {
        'status': true,
        'message': responseData['message'],
      };
    }
    return result;
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

  Future<List<Map<String, dynamic>>> fetchAllPesanan() async {
    print('in');
    List<Map<String, dynamic>> result = [];

    // _allPesananStatus = RequestStatus.Fetching;
    // notifyListeners();

    result.add(await fetchPesanan(ApiPath.pesananBelumValid));
    result.add(await fetchPesanan(ApiPath.pesananValid));
    result.add(await fetchPesanan(ApiPath.getHistoryPesananbyId(3)));

    // _allPesananStatus = RequestStatus.Fetched;
    // notifyListeners();

    return result;
  }

  Future<Map<String, dynamic>> fetchPesanan(url) async {
    var result;
    _fetchPesananBelumValidStatus = RequestStatus.Fetching;

    var token = await UserPreferences().getToken();
    print(token);

    Response response = await get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // String fixed = response.body.replaceAll(r"\", "");

      final Map<String, dynamic> responseData = json.decode(response.body);

      var pesananBelumValidDataList = responseData['data'];

      /// For dummy image
      /// Commnet soon
      // ByteData bytes = await rootBundle.load(ImageConstants.pestaProduct1);
      // var buffer = bytes.buffer;
      // var base64Image = base64.encode(Uint8List.view(buffer));

      // print(base64Image);
      List<Pesanan> pesananList = [];

      for (final pesananBelumValid in pesananBelumValidDataList) {
        print('here');
        Pesanan pesanan = Pesanan.fromJson(pesananBelumValid);
        pesananList.add(pesanan);
      }

      _fetchPesananBelumValidStatus = RequestStatus.Fetched;
      notifyListeners();

      result = {
        'status': true,
        'message': responseData['message'],
        'data': pesananList,
      };
    } else {
      _fetchPesananBelumValidStatus = RequestStatus.Failed;
      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }

    print(result);

    return result;
  }

  void reset() {
    _pesananStatus = PesananStatus.PesananCreated;
    _detailPesananList.removeRange(0, _detailPesananList.length);
    _desainCustomList.removeRange(0, _desainCustomList.length);
  }

  void resetPesananBelumValid() {
    // _pesananBelumValidList.removeRange(0, _pesananBelumValidList.length);
  }
}
