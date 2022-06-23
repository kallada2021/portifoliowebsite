import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/services/contact_service.dart';
import 'package:consulting_portfolio_website/features/widgets/custombutton.dart';
import 'package:consulting_portfolio_website/features/widgets/textfield.dart';
import 'package:flutter/material.dart';

enum RadioButton {
  emailNotSent,
  emailSent,
}

class ContactUsScreen extends StatefulWidget {
  static const String routeName = "/contact-us";

  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _contactUsFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ContactService contactService = ContactService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _messageController.dispose();
  }

  void sendEmail() {
    contactService.sendEmailMessage(
      context: context,
      name: _nameController.text,
      phoneNumber: _phoneController.text,
      emailAddress: _emailController.text,
      message: _messageController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.grayBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                const Text(
                  "contact us",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      "Send us an email",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // leading: Radio(
                  //   value: RadioButton.emailNotSent,
                  //   groupValue: _radioButton,
                  //   onChanged: (RadioButton? val) {
                  //     setState(() {
                  //       _radioButton = val!;
                  //     });
                  //   },
                  //   activeColor: GlobalVariables.secondaryColor,
                  // ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _contactUsFormKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomTextField(
                            controller: _nameController,
                            hintText: "Name",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomTextField(
                            controller: _emailController,
                            hintText: "Your Email Address",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomTextField(
                            controller: _phoneController,
                            hintText: "Your Phone Number",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomTextField(
                            controller: _messageController,
                            hintText: "Your Message",
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomButton(
                            text: "Contact us",
                            onPressed: () {
                              if (_contactUsFormKey.currentState!.validate()) {
                                sendEmail();
                              }
                            }),
                        const SizedBox(
                          height: GlobalVariables.lineHeight,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
