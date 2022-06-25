import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import '../../constants/global_variables.dart';
import '../../constants/utils.dart';

class SolutionsService {
  // getSolutions gets list of solutions from backend api
  void getSolutions({
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http
          .get(Uri.parse("$uri/api/solutions"), headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      });
      print(res);
    } catch (e) {
      showSnackBar(context, e.toString(), Colors.red);
    }
  }

  // getSolutionByID gets a solution by ID from backend api
  void getSolutionByID({
    required BuildContext context,
    required String id,
  }) async {
    try {
      http.Response res = await http
          .get(Uri.parse("$uri/api/solutions/$id"), headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      });
      print(res);
    } catch (e) {
      showSnackBar(context, e.toString(), Colors.red);
    }
  }
}
