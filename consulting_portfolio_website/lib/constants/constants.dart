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
const String azureDevopsIntro =
    "Azure DevOps supports a collaborative culture and set of processes that bring together developers, project managers, and contributors to develop software. It allows organizations to create and improve products at a faster pace than they can with traditional software development approaches.";
const String jenkinsIntro =
    "Jenkins is a powerful application that allows continuous integration and continuous delivery of projects, regardless of the platform you are working on. It is a free source that can handle any kind of build or continuous integration.";
const String kubernetesIntro =
    "Kubernetes can also be deployed across multi-cloud environments. It is an open-source tool that enables users to use hybrid, cloud or on-premises infrastructures. In addition, Kubernetes makes it possible for multiple cloud providers to be used within the same managed Kubernetes cluster.";
const String githubActionsIntro =
    "GitHub Actions now supports OpenID Connect (OIDC) for secure deployments to cloud, which uses short-lived tokens that are automatically rotated for each deployment. This enables: Seamless authentication between Cloud Providers and GitHub without the need for storing any long-lived cloud secrets in GitHub";
const String flutterIntro =
    "Flutter is a multiplatform library used to create primary iOS and Android apps and can also be used to create websites and desktop applications.  We also work with Flutter and can setup an Android app as well as an iOS app as well as a landing page or website for your company saving your costs.";
const String swiftIntro =
    "Swift is Apple's language for creating iOS apps.  Apps for iPhones, iPads and Mac computers are created with Swift. We can provide solutions for iOS system applications for your company";
const String kotlinIntro =
    "Kotlin is used for creating Android application as well as Multiplatform applications and backend APIs. We can provide Android solutions and Fullstack solutions for your company.";
const String htmlCssIntro =
    "HTML (the Hypertext Markup Language) and CSS (Cascading Style Sheets) are two of the core technologies for building Web pages";
const String javascriptInto =
    "Javascript is used by programmers across the world to create dynamic and interactive web content like applications and browsers. JavaScript is so popular that it's the most used programming language in the world, used as a client-side programming language by 97.0% of all websites.";
const String djangoIntro =
    "Django is a high-level Python web framework that encourages rapid development and clean, pragmatic design. Built by experienced developers, it takes care of much of the hassle of web development, so you can focus on writing your app without needing to reinvent the wheel. ";
const String golangIntro =
    "Go (also called Golang or Go language) is an open source programming language used for general purpose. Go was developed by Google engineers to create dependable and efficient software. Most similarly modeled after C, Go is statically typed and explicit.";
const String csharpIntro =
    "C# is a simple, modern, general-purpose, object-oriented programming language developed by Microsoft within its .NET initiative led by Anders Hejlsberg";
const String powershellIntro =
    "PowerShell. PowerShell is a task automation and configuration management program from Microsoft, consisting of a command-line shell and the associated scripting language";