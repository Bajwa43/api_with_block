import 'dart:convert';

// import 'package:flutter_api_f11/album.dart';
import 'package:api_with_block/Model/foodResultModel.dart';
import 'package:http/http.dart' as http;

extension RESTCodes on http.Response {
  bool get isSuccessful {
    return statusCode == 200;
  }

  bool get isCreated {
    return statusCode == 201;
  }
}

abstract class ApiProvider {
  fetch() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.isSuccessful) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}

class RecepieApiProvider extends ApiProvider {
  Future<List<Recepie>> fetchRecepies() async {
    List mapList = await fetch();
    print(mapList);

    // List list = mapList['results'];
    // print('.....${list.length}');
    // var listOf = list.map((map) => Recepie.fromMap(map)).toList();
    // print(listOf);
    return mapList.map((map) => Recepie.fromMap(map)).toList();
  }
}
