import 'dart:convert';

import 'package:consulting_portfolio_website/constants/errors.dart';
import 'package:consulting_portfolio_website/features/models/projects.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import '../../constants/global_variables.dart';
import '../../constants/utils.dart';

class ProjectsService {
  // getProjects gets list of projects from backend api
  void getProjects({
    required BuildContext context,
  }) async {
    List<Projects> projectsList = [];

    try {
      http.Response res = await http
          .get(Uri.parse("$uri/api/projects"), headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      });
      print(res);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              projectsList.add(Projects.fromJson(
                jsonEncode(jsonDecode(res.body)[i]),
              ));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString(), Colors.red);
    }
  }

  // getProjectsByID gets a solution by ID from backend api
  void getProjectsByID({
    required BuildContext context,
    required String id,
  }) async {
    try {
      http.Response res = await http
          .get(Uri.parse("$uri/api/projects/$id"), headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      });
      print(res);
    } catch (e) {
      showSnackBar(context, e.toString(), Colors.red);
    }
  }
}
