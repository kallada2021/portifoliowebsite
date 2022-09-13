import 'dart:developer' as devtools show log;
import 'package:flutter/material.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

const webScreenSize = 800;

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
  "AWS CDK",
];

const String terraformIntro =
    "Terraform is a cloud agnostic scripting language to create cloud resources and manage services and infrastructure. Terraform uses a declarative language called the HashiCorp Configuration Language (HCL). We will create your infrastructure as code using Terraform in order to help manage your servers and cloud services.";
const String cdkIntro =
    "AWS CDK is an infrastructure as cloud library using Python or Typescript to deploy resources to AWS and manage serverless applications and code pipelines. We can create serverless apps and pipelines using AWS CDK.";
const String amazonIntro =
    "Amazon Web Services (AWS) provides on-demand cloud computing platforms and APIs, on a pay-as-you-go basis. We can help you setup cloud computing web services and software on AWS. Some services include EC2 (virtual server), Database options, and Lambdas for serverless APIs. We will configure your application to run on AWS using these technologies";
const String azureIntro =
    "Azure is a public cloud platform from Microsoft. A wide range of services such as compute, analytics, storage and networking are provided and can be used for IaaS, Pass and SaaS. Azure can be used to supplement On-premise servers or migrate from on-premise to cloud.";
const String azureDevopsIntro =
    "Azure Devops is a SaaS platform from Microsoft providing a complete Devops toolkit for developing and deploying software. Azure Devops provides Azure Boards for agile planning, Cloud agnostic Azure CI,CD pipelines, Azure repos, Azure Artifacts and test plans.";
const String jenkinsIntro =
    "Jenkins is an open source Pipeline tool. It is useful for creating build and deployment pipeline and can run on cloud servers. We have experience with Jenkins and can use it for your pipeline and infrastructure build needs.";
const String kubernetesIntro =
    "Kubernetes is a managed service for deploying several different Docker containers and services. It can be deployed to AWS EKS or Azure AKS. We have experience deploying different apps on kubernetes.";
const String githubActionsIntro =
    "GitHub Actions is a pipeline to deploy apps on the cloud. It is a customizable deployment tool and also focuses on high security";
const String flutterIntro =
    "Flutter is a multiplatform library used to create primary iOS and Android apps and can also be used to create websites and desktop applications.  We also work with Flutter and can setup an Android app as well as an iOS app and in addition we can use it to create a landing page, portfolio or website for your company to help with saving your costs.";
const String swiftIntro =
    "Swift is Apple's language for creating iOS apps.  Apps for iPhones, iPads and Mac computers are created with Swift. We can provide solutions for iOS system applications for your company";
const String kotlinIntro =
    "Kotlin is used for creating Android application as well as Multiplatform applications and backend APIs. We can provide Android solutions and Fullstack solutions for your company.";
const String htmlCssIntro =
    "HTML is used for defining structure of webpage while CSS provides styling. Together they are building blocks of a website";
const String javascriptInto =
    "Javascript is used by programmers across the world to create dynamic and interactive web content like applications and browsers. JavaScript is so popular that it's the most used programming language in the world, used as a client-side programming language by 97.0% of all websites.";
const String djangoIntro =
    "Django is a Python web and API framework.  It provides an admin panel and built in authentication making for fast and efficient development.  We can create an API with Django and integrate it with a frontend application.";
const String golangIntro =
    "Go (also called Golang or Go language) is a general purpose language.  Go is statically typed and explicit and is suitable for microservices and concurrent applications.";
const String csharpIntro =
    "It is one of the several programming languages that use OOPS to provide flexibility and efficiency. With these capabilities it can solve use cases related to Web Application Development, Windows Forms Development and Gaming using Unity";
const String powershellIntro =
    "PowerShell is a scripting language used primary on Windows and Windows servers to run commands and to help maintain the server and other Microsoft services such as Active Directory.";
const String dockerIntro =
    "Docker is used to containerize applications to allow them to run easily in many different environments. We can run your application in Docker and run it on cloud environments such as AWS or Azure.";
