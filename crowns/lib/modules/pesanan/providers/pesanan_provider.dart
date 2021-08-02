import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:crowns/constants/api_path.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/pesanan/models/desain_custom.dart';
import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
import 'package:crowns/modules/pesanan/models/pesanan.dart';
import 'package:crowns/modules/pesanan/models/pesanan_baru.dart';
import 'package:crowns/utils/services/user_preferences.dart';
import 'package:flutter/cupertino.dart';
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
  RequestStatus _updateDetailStatus = RequestStatus.NotFetched;

  RequestStatus _allPesananStatus = RequestStatus.NotFetched;

  PesananBaru? _pesanan;
  List<DetailPesanan> _detailPesananList = [];
  List<DesainCustom> _desainCustomList = [];

  RequestStatus get allPesananStatus => _allPesananStatus;
  RequestStatus get updateDetailStatus => _updateDetailStatus;

  RequestStatus _fetchPesananBelumValidStatus = RequestStatus.NotFetched;

  RequestStatus get fetchPesananBelumValidStatus =>
      _fetchPesananBelumValidStatus;

  PesananBaru get pesanan => _pesanan!;
  PesananStatus get pesananStatus => _pesananStatus;
  List<DesainCustom> get desainCustomList => _desainCustomList;
  List<DetailPesanan> get detailPesananList => _detailPesananList;

  Future<Map<String, dynamic>> createPesanan(int idPenjahit, int idBaju) async {
    var result;

    final Map<String, dynamic> pesananData = {
      'id_penjahit': idPenjahit,
      'id_baju': idBaju
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
      result = {
        'status': true,
        'message': responseData['message'],
      };
    } else {
      _pesananStatus = PesananStatus.Failed;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }
    print(result);
    return result;
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

  Future<Map<String, dynamic>> uploadDesain() async {
    var result;

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

    var token = await UserPreferences().getToken();

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

      _pesananStatus = PesananStatus.DesainUploaded;
      notifyListeners();
      result = {
        'status': true,
        'message': responseData['message'],
      };
    } else {
      _pesananStatus = PesananStatus.Failed;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }
    print(result);
    return result;
  }

  Future<Map<String, dynamic>> updateDetailPesanan(
    List<DetailPesanan> detailPesananList,
    PesananBaru pesananBaru,
    bool kainSendiri,
  ) async {
    _updateDetailStatus = RequestStatus.Fetching;
    notifyListeners();

    List<Map<String, dynamic>> detailPesananDataList = [];

    for (final detailPesanan in detailPesananList) {
      final Map<String, dynamic> detailPesananData = {
        'nama_lengkap': detailPesanan.namaLengkap,
        'lengan': detailPesanan.lengan,
        'pinggang': detailPesanan.pinggang,
        'dada': detailPesanan.dada,
        'leher': detailPesanan.leher,
        'tinggi_tubuh': detailPesanan.tinggiTubuh,
        'berat_badan': detailPesanan.beratBadan,
        'instruksi_pembuatan': detailPesanan.instruksiPembuatan,
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

      _updateDetailStatus = RequestStatus.Fetched;
      notifyListeners();

      result = {
        'status': true,
        'message': responseData['message'],
      };
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);

      _updateDetailStatus = RequestStatus.Fetched;
      notifyListeners();

      result = {
        'status': false,
        'message': responseData['message'],
      };
    }
    print(result);
    return result;
  }

  void setStatus(PesananStatus status) {
    _pesananStatus = status;
    notifyListeners();
  }

  DetailPesanan createEmptyDetailPesanan() {
    return new DetailPesanan(
      namaLengkap: '',
      dada: 0,
      leher: 0,
      lengan: 0,
      pinggang: 0,
      beratBadan: 0,
      tinggiTubuh: 0,
      instruksiPembuatan: '',
    );
  }

  Future<List<Map<String, dynamic>>> fetchAllPesanan() async {
    List<Map<String, dynamic>> result = [];

    final user = await UserPreferences().getUser();
    final userId = user.id;

    var token = await UserPreferences().getToken();
    print(token);

    result.add(await fetchPesanan(ApiPath.pesananBelumValid));
    result.add(await fetchPesanan(ApiPath.pesananValid));
    result.add(await fetchPesanan(ApiPath.getHistoryPesananbyId(userId)));

    print(result);

    return result;
  }

  Future<Map<String, dynamic>> fetchPesanan(url) async {
    var result;

    var token = await UserPreferences().getToken();

    Response response = await get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var pesananBelumValidDataList = responseData['data'];

      List<Pesanan> pesananList = [];

      for (final pesananBelumValid in pesananBelumValidDataList) {
        Pesanan pesanan = Pesanan.fromJson(pesananBelumValid);
        pesananList.add(pesanan);
      }

      result = {
        'status': true,
        'message': responseData['message'],
        'data': pesananList,
      };
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }

    print(result);
    return result;
  }

  Future<Map<String, dynamic>> giveRating(int id, double rating) async {
    var token = await UserPreferences().getToken();

    final Map<String, dynamic> ratingData = {
      'id_pesanan': id,
      'rating': rating,
    };

    Response response = await post(
      Uri.parse(ApiPath.beriRating),
      body: jsonEncode(ratingData),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
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
      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }

    print(result);
    return result;
  }

  Future<Map<String, dynamic>> markDone(int idPesanan) async {
    var token = await UserPreferences().getToken();
    print(token);

    final Map<String, dynamic> requestData = {
      'id_pesanan': idPesanan,
    };

    Response response = await post(
      Uri.parse(ApiPath.konfirmasiSelesai),
      body: jsonEncode(requestData),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    print(json.decode(response.body));

    var result;

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      result = {
        'status': true,
        'message': responseData['message'],
      };
    } else {
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
}
