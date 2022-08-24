import 'dart:async';

import 'package:consulting_portfolio_website/constants/constants.dart';
import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/constants/utils.dart';

import 'package:consulting_portfolio_website/features/services/contact_service.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/custombutton.dart';
import 'package:consulting_portfolio_website/features/widgets/loading_manager.dart';
import 'package:consulting_portfolio_website/features/widgets/progressbar.dart';
import 'package:consulting_portfolio_website/features/widgets/textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../widgets/footer.dart';

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
  bool isSending = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _messageController.dispose();
  }

  setTimerToHomePage() {
    Timer(const Duration(seconds: 3), () async {
      Navigator.of(context).pop();
    });
  }

  void sendEmail() {
    setState(() {
      isSending = true;
    });
    contactService.sendEmailMessage(
      context: context,
      name: _nameController.text.trim(),
      phoneNumber: _phoneController.text.trim(),
      emailAddress: _emailController.text.trim(),
      message: _messageController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double formPadding = MediaQuery.of(context).size.width > webScreenSize
        ? MediaQuery.of(context).size.width * 0.1
        : 10.0;

    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: customAppBar(context),
      bottomSheet: const Footer(),
      body: SingleChildScrollView(
        child: LoadingManager(
          isLoading: isSending,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      isSending == true ? linearProgressBar() : Container(),
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
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.white,
                        child: Form(
                          key: _contactUsFormKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: formPadding),
                                child: CustomTextField(
                                  controller: _nameController,
                                  hintText: "* Name",
                                  inputType: TextInputType.name,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: formPadding),
                                child: CustomTextField(
                                  controller: _emailController,
                                  hintText: "* Email Address",
                                  inputType: TextInputType.emailAddress,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: formPadding),
                                child: CustomTextField(
                                  controller: _phoneController,
                                  hintText: "* Phone Number",
                                  inputType: TextInputType.phone,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: formPadding),
                                child: CustomTextField(
                                  controller: _messageController,
                                  hintText: "* Message",
                                  inputType: TextInputType.text,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomButton(
                                  text: "Contact us",
                                  onPressed: () {
                                    if (_nameController.text.isNotEmpty &&
                                        _emailController.text.isNotEmpty &&
                                        _messageController.text.isNotEmpty) {
                                      if (_contactUsFormKey.currentState!
                                          .validate()) {
                                        String email = _emailController.text;
                                        bool isValidEmail =
                                            EmailValidator.validate(email);
                                        if (!isValidEmail) {
                                          showSnackBar(
                                            context,
                                            "Please Enter a valid email",
                                            Colors.red,
                                          );
                                          return;
                                        }

                                        sendEmail();
                                        setTimerToHomePage();
                                      }
                                    } else {
                                      showSnackBar(
                                        context,
                                        "Please fill out all form fields",
                                        Colors.red,
                                      );
                                    }
                                  }),
                              const SizedBox(
                                height: GlobalVariables.kLineHeight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // const Footer(),
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
  final _contactUsFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ContactService contactService = ContactService();
  bool isSending = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _messageController.dispose();
  }

  setTimerToHomePage() {
    Timer(const Duration(seconds: 3), () async {
      Navigator.of(context).pop();
    });
  }

  void sendEmail() {
    setState(() {
      isSending = true;
    });
    contactService.sendEmailMessage(
      context: context,
      name: _nameController.text.trim(),
      phoneNumber: _phoneController.text.trim(),
      emailAddress: _emailController.text.trim(),
      message: _messageController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const Footer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: LoadingManager(
            isLoading: isSending,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                const SizedBox(
                  height: 64,
                ),
                CustomTextField(
                  controller: _nameController,
                  hintText: "* Name",
                  inputType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _emailController,
                  hintText: "* Your Email Address",
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _phoneController,
                  hintText: "* Your Phone Number",
                  inputType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _messageController,
                  hintText: "* Your Message",
                  inputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: GestureDetector(
                    onTap: () {
                      if (_nameController.text.isNotEmpty &&
                          _emailController.text.isNotEmpty &&
                          _messageController.text.isNotEmpty) {
                        if (_contactUsFormKey.currentState!.validate()) {
                          String email = _emailController.text;
                          bool isValidEmail = EmailValidator.validate(email);
                          if (!isValidEmail) {
                            showSnackBar(
                              context,
                              "Please Enter a valid email",
                              Colors.red,
                            );
                            return;
                          }

                          sendEmail();
                          setTimerToHomePage();
                        }
                      } else {
                        showSnackBar(
                          context,
                          "Please fill out all form fields",
                          Colors.red,
                        );
                      }
                    },
                    child: const Text(
                      "SEND MESSAGE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
