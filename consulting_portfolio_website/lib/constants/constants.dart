import 'package:flutter/material.dart';

import '../features/screens/contactus.dart';
import '../features/widgets/custombutton.dart';
import 'global_variables.dart';

const webScreenSize = 600;

var webHomeScreenItems = [
  const SizedBox(
    width: GlobalVariables.lineWidth,
  ),
  const Text(
    "MAGNOLIA IT SOLUTIONS",
    style: TextStyle(
      fontSize: 16,
    ),
  ),
  const SizedBox(
    width: 200,
  ),
  const SizedBox(
    width: GlobalVariables.lineWidth,
  ),
  DropdownMenuItem(child: const Text("Services")),
  CustomDropdownItem(),
  const SizedBox(
    width: GlobalVariables.lineWidth,
  ),
  const Text("Technologies"),
  const SizedBox(
    width: GlobalVariables.lineWidth,
  ),
  const Text("Clients"),
  const SizedBox(
    width: GlobalVariables.lineWidth,
  ),
];

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("CloudInfrastructureDevelopment"),value: "CloudInfrastructureDevelopment"),
    DropdownMenuItem(child: Text("WebDevelopment"),value: "WebDevelopment"),
    DropdownMenuItem(child: Text("MobileDevelopment"),value: "MobileDevelopment"),
    DropdownMenuItem(child: Text("Devops"),value: "Devops"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItemsTech{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Terraform"),value: "Terraform"),
    DropdownMenuItem(child: Text("Packer"),value: "Packer"),
    DropdownMenuItem(child: Text("Django"),value: "Django"),
    DropdownMenuItem(child: Text("PowerShell"),value: "PowerShell"),
    DropdownMenuItem(child: Text("BashScripting"),value: "Bashscripting"),
    DropdownMenuItem(child: Text("Python"),value: "Python"),
    DropdownMenuItem(child: Text("Flutter"),value: "Flutter"),
    DropdownMenuItem(child: Text("GoLang"),value: "GoLang"),
    DropdownMenuItem(child: Text("PowerPlatform"),value: "PowerPlatform")

  ];
  return menuItems;
}

class CustomDropdownItem extends StatefulWidget {
  const CustomDropdownItem({Key? key}) : super(key: key);

  @override
  State<CustomDropdownItem> createState() => _CustomDropdownItemState();
}

class _CustomDropdownItemState extends State<CustomDropdownItem> {
  String value = "Services";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        items: dropdownItems,
        value: value,
        onChanged: (_){});
  }
}
