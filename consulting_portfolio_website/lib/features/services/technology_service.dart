import 'dart:convert';

import 'package:consulting_portfolio_website/constants/constants.dart';
import 'package:consulting_portfolio_website/constants/errors.dart';
import 'package:consulting_portfolio_website/features/providers/technology_provider.dart';
import "package:provider/provider.dart";
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import '../../constants/global_variables.dart';
import '../../constants/utils.dart';
import '../models/technology.dart';
import '../providers/appstate.dart';

class TechnologyService {
  AppState appState = AppState.loading;
  // getTechs gets a list of techs from backend api
  Future<List<Technology>> getTechs({
    required BuildContext context,
  }) async {
    List<Technology> techList = [];
    try {
      http.Response res = await http
          .get(Uri.parse("$uri/api/technologies/"), headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      });

      if (res.statusCode != 200) {
        res.statusCode.log();
        throw "An error occurred.";
      }
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            print(jsonDecode(res.body)[i]);
            techList.add(
              Technology.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      e.toString().log();
      if (e.toString().contains("XMLHttp")) {
        showSnackBar(
            context, "Please check your internet connection", Colors.red);
      } else {
        showSnackBar(context, e.toString(), Colors.red);
        throw e.toString();
      }
    }
    appState = AppState.initial;
    return techList;
  }

  // getTechByID gets a tech by id from backend api
  void getTechByID({
    required BuildContext context,
    required String id,
  }) async {
    try {
      http.Response res = await http.get(Uri.parse("$uri/api/technologies/$id"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          });

      var techProvider =
          Provider.of<TechnologyProvider>(context, listen: false);
      techProvider.setTechnologies(res.body);
    } catch (e) {
      showSnackBar(context, e.toString(), Colors.red);
    }
  }
}
