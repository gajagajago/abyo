import 'package:flutter/material.dart';
import 'dart:convert';
import 'asset.dart';
import 'package:flutter/foundation.dart';
import '../../helpers/http_request.dart';

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
    print(val);
    notifyListeners();
  }

  Future fetchAssets(String authToken) async {
    try {
      loading = true;
      await HttpRequest()
          .get(partialUrl: "assets", authToken: authToken)
          .then((response) {
            final List<dynamic> jsonList = json.decode(response.body);
            _assets = jsonList.map((e) => Asset.fromJson(e)).toList();
            loading = false;
          });
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }
}
