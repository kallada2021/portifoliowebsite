import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomDropdownItem extends StatefulWidget {
  final String value;
  const CustomDropdownItem({Key? key, required this.value}) : super(key: key);

  @override
  State<CustomDropdownItem> createState() => _CustomDropdownItemState();
}

class _CustomDropdownItemState extends State<CustomDropdownItem> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        dropdownColor: GlobalVariables.kLightBlue,
        menuMaxHeight: 300,
        elevation: 4,
        alignment: AlignmentDirectional.center,
        icon: const Icon(
          Icons.computer,
          size: 20,
          color: Colors.white,
        ),
        items: dropdownItems,
        value: widget.value,
        onChanged: (_) {
          //TODO: Implement onchange
        });
  }
}

List<String> services = [
  "Cloud Infrastructure Development",
  "Mobile Development",
  "Web Development",
  "Devops",
];

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: "Services",
      child: Text(
        "Services",
        style: TextStyle(color: Colors.white),
      ),
    ),
    for (String service in services)
      DropdownMenuItem(
        value: service,
        child: Wrap(
          children: [
            TextButton(
              onPressed: () {
                print("button pressed");
              },
              child: Text(service),
            ),
          ],
        ),
      ),
  ];
  return menuItems;
}

//TODO: Implement tech dropdown - Make list DRY
List<DropdownMenuItem<String>> get dropdownItemsTech {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Terraform"), value: "Terraform"),
    DropdownMenuItem(child: Text("Packer"), value: "Packer"),
    DropdownMenuItem(child: Text("Django"), value: "Django"),
    DropdownMenuItem(child: Text("PowerShell"), value: "PowerShell"),
    DropdownMenuItem(child: Text("BashScripting"), value: "Bashscripting"),
    DropdownMenuItem(child: Text("Python"), value: "Python"),
    DropdownMenuItem(child: Text("Flutter"), value: "Flutter"),
    DropdownMenuItem(child: Text("GoLang"), value: "GoLang"),
    DropdownMenuItem(child: Text("PowerPlatform"), value: "PowerPlatform")
  ];
  return menuItems;
}
