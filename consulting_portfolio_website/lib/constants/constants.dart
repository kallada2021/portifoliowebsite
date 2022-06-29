import 'package:flutter/material.dart';

import '../features/widgets/customdropdown.dart';
import 'global_variables.dart';

const webScreenSize = 900;

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
    width: 100,
  ),
  const SizedBox(
    width: GlobalVariables.lineWidth,
  ),
  //const Text("Services"),
  Container(
    width: 270,
    child: const CustomDropdownItem(value: "Services"),
  ),
  const SizedBox(
    width: GlobalVariables.lineWidth,
  ),
  //TODO: implement technology dropdown
  const Text("Technologies"),
  const SizedBox(
    width: GlobalVariables.lineWidth,
  ),
  //TODO: implement clients section
  const Text("Clients"),
  const SizedBox(
    width: GlobalVariables.lineWidth,
  ),
];
List<String> cloudTechnologies = [
  "Amazon Web Services",
  "Azure Cloud",
  "Terraform",
];
List<String> mobileDevelopmentTechnologies = [
  "Flutter",
  "IOS Swift",
  "Android",
];
List<String> webDevelopmentTechnologies = [
  "HTML/CSS",
  "Javascript",
  "Django",
  "GoLang",
];
List<String> devopsTechnologies = [
  "Terraform",
  "Azure Devops",
  "Jenkins",
  "Kubernetes",
  "Github Actions",
];
