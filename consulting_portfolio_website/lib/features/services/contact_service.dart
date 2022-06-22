import '../../constants/global_variables.dart';
import '../models/contact.dart';
import "package:http/http.dart" as http;

class ContactService {
  // send email message to server
  void sendEmailMessage({
    required String name,
    required String phoneNumber,
    required String emailAddress,
    required String message,
  }) async {
    try {
      Contact contact = Contact(
          id: "", name: "", phoneNumber: "", emailAddress: "", message: "");

      http.Response res = await http.post(Uri.parse("$uri/api/contact"),
          body: contact.toJson(),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF=8",
          });
      print(res.body);
      print(res.statusCode);
    } catch (e) {}
  }
}
