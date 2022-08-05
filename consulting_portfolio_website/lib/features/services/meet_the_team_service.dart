import 'dart:convert';

import 'package:consulting_portfolio_website/features/models/meet_the_team_model.dart';
import "package:http/http.dart" as http;
import 'dart:developer';
import 'package:flutter/material.dart';
import '../../constants/errors.dart';
import '../../constants/global_variables.dart';

class MeetTheTeamService {
  static Future<List<MeetTheTeam>> getTeamMembers({
    required BuildContext context,
  }) async {
    List<MeetTheTeam> teamMembersList = [];

    try {
      http.Response res = await http
          .get(Uri.parse("$uri/api/meet-the-team/"), headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      });
      print(res);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              teamMembersList.add(
                MeetTheTeam.fromJson(
                  jsonEncode(jsonDecode(res.body)[i]),
                ),
              );
            }
          });

      return teamMembersList;
    } catch (e) {
      //showSnackBar(context, e.toString(), Colors.red);
      log(e.toString());
      throw e.toString();
    }
  }
}
