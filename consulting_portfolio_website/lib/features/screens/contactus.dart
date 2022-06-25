import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/services/contact_service.dart';
import 'package:consulting_portfolio_website/features/widgets/custombutton.dart';
import 'package:consulting_portfolio_website/features/widgets/textfield.dart';
import 'package:flutter/material.dart';

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
                    fontSize: 25,
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
                            inputType: TextInputType.name,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomTextField(
                            controller: _emailController,
                            hintText: "Your Email Address",
                            inputType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomTextField(
                            controller: _phoneController,
                            hintText: "Your Phone Number",
                            inputType: TextInputType.phone,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomTextField(
                            controller: _messageController,
                            hintText: "Your Message",
                            inputType: TextInputType.text,
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
                        ),
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

class MobileContactScreen extends StatefulWidget {
  static const String routeName = "/contact-us-mobile";
  const MobileContactScreen({Key? key}) : super(key: key);

  @override
  State<MobileContactScreen> createState() => _MobileContactScreenState();
}

class _MobileContactScreenState extends State<MobileContactScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            const SizedBox(
              height: 64,
            ),
            CustomTextField(
              controller: _nameController,
              hintText: "Name",
              inputType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _emailController,
              hintText: "Your Email Address",
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _phoneController,
              hintText: "Your Phone Number",
              inputType: TextInputType.phone,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _messageController,
              hintText: "Your Message",
              inputType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: GestureDetector(
                onTap: () {
                  //TODO: implement contact us
                  print("Contact");
                },
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: GlobalVariables.secondaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  child: const Text(
                    "SEND MESSAGE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
          ],
        ),
      ),
    ));
  }
}
