import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import '../../constants/global_variables.dart';
import '../../constants/utils.dart';

class ServicesService {
  // getServices gets list of solutions from backend api
  void getServices({
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http
          .get(Uri.parse("$uri/api/services"), headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      });
      print(res);
    } catch (e) {
      showSnackBar(context, e.toString(), Colors.red);
    }
  }

  // getServicesByID gets a solution by ID from backend api
  void getServicesByID({
    required BuildContext context,
    required String id,
  }) async {
    try {
      http.Response res = await http
          .get(Uri.parse("$uri/api/services/$id"), headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      });
      print(res);
    } catch (e) {
      showSnackBar(context, e.toString(), Colors.red);
    }
  }
}
