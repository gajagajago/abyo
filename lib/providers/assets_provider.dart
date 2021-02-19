import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'asset.dart';
import 'package:flutter/foundation.dart';

class AssetsProvider with ChangeNotifier {
  List<Asset> _assets;
  int _assetCategoryId;
  bool loading = false;

  AssetsProvider({@required String authToken}) {
    fetchAssets(authToken);
  }

  get assets => _assets;
  get assetCategoryId => _assetCategoryId;
  set assetCategoryId(val) {
    _assetCategoryId = _assetCategoryId == val ? null : val;
    notifyListeners();
  }

  Future fetchAssets(String authToken) async {
    try {
      loading = true;
      String url = Platform.isAndroid
          ? 'http://10.0.2.2:3000/api/v1/assets'
          : 'http://127.0.0.1:3000/api/v1/assets';
      final response = await http.get(
          url,
          headers: {'Content-Type': "application/json", 'AUTH-TOKEN': authToken}
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        _assets = jsonList.map((e) => Asset.fromJson(e)).toList();
        loading = false;
      }
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }
}
