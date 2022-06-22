import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import '../../constants/global_variables.dart';
import '../../constants/utils.dart';

class TechnologyService {
  // Get list of techs from backend api
  void getTechs({
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http
          .get(Uri.parse("$uri/api/technologies"), headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      });
      print(res);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
