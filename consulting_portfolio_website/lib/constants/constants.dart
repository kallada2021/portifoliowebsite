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

const String terraformIntro =
    "Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can be used on many types of cloud providers to manage services and infrastructure. Terraform uses a declarative language called the HashiCorp Configuration Language (HCL). We will create your infrastructure as code using Terraform in order to help manage your servers and cloud services";
const String amazonIntro =
    "Amazon Web Services (AWS) provides on-demand cloud computing platforms and APIs to individuals, companies, and governments, on a pay-as-you-go basis. We can help you setup cloud computing web services that provide distributed computing processing capacity and software tools on AWS. One of these services we specialize in is called Amazon Elastic Compute Cloud (EC2), which provides users a virtual cluster of computers, available all the time, through the Internet. We can set up an EC2 service offering a choice of operating systems, networking, and pre-loaded application software such as web servers and databases. We will configure your application to run on AWS using these technologies";
const String azureIntro =
    "Azure is a cloud platform designed to simplify the process of building modern applications. Whether you choose to host your applications entirely in Azure or extend your on-premises applications with Azure services, Azure helps you create applications that are scalable, reliable, and maintainable.Azure supports the most popular programming languages in use today, including Python, JavaScript, Java, .NET and Go. With a comprehensive SDK library and extensive support in tools you already use like VS Code, Visual Studio, IntelliJ, and Eclipse, Azure is designed to take advantage of skills you already have and make you productive right away.";
