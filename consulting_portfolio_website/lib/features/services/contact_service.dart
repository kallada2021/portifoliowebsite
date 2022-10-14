import 'package:consulting_portfolio_website/constants/utils.dart';

import '../../constants/errors.dart';
import '../../constants/global_variables.dart';
import '../models/contact.dart';
import "package:http/http.dart" as http;
import "package:flutter/material.dart";

class ContactService {
  // send email message to server
  void sendEmailMessage({
    required BuildContext context,
    required String name,
    required String phoneNumber,
    required String emailAddress,
    required String message,
  }) async {
    try {
      Contact contact = Contact(
        name: name,
        phoneNumber: phoneNumber,
        emailAddress: emailAddress,
        message: message,
      );

      http.Response res = await http.post(
          Uri.parse(
            "api/create-contact/",
            // "$uri/api/create-contact/",
          ),
          body: contact.toJson(),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            "Referer": "https://www.magnoliaitsolutionsgroup.com"
          });
      // print(res.body);
      print(res.statusCode);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Message sent successfully", Colors.green);
        },
      );
    } catch (e) {
      if (e.toString().contains("XMLHttp")) {
        showSnackBar(
            context,
            "Please check your internet connection. Message not sent!",
            Colors.red);
      } else {
        showSnackBar(context, e.toString(), Colors.red);
      }
    }
  }
}
