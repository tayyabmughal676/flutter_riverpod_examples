import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/models/NewUserResponse.dart';
import 'package:http/http.dart';

class ApiServices {
  String endPoint = "https://reqres.in/api/users?page=2";

  Future<List<NewUserResponse>> getUser() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => NewUserResponse.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userProvider = Provider<ApiServices>((ref) => ApiServices());
