import 'package:consulting_portfolio_website/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, "Sorry, an error has occurred");
      break;
    case 500:
      showSnackBar(context,
          "Sorry, Our server can not handle your request. Please try again later.");
      break;
    default:
      showSnackBar(context, response.body);
      break;
  }
}
