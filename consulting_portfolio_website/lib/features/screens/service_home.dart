import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/services/services_service.dart';
import 'package:consulting_portfolio_website/features/widgets/featuredservicewidget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../constants/utils.dart';
import '../models/services.dart';

class ServicesHomeScreen extends StatefulWidget {
  List<Map<String, dynamic>> featuredServices = [
    {
      "featuredServices": "AWS Resources Deployed By Terraform",
      "description":
          "Lambda, RDS database, API Gateway and\ncustom VPC and EC2/Autoscaling",
      "imageUrl": "${GlobalVariables.s3Url}AWSWithTerraform.png",
    },
    {
      "featuredServices": "Azure Resources provisioned by Terraform",
      "description": "Azure Function, Active Directory or custom VM",
      "imageUrl": "${GlobalVariables.s3Url}AzureWebApp.JPG",
    },
    {
      "featuredServices":
          "Full stack mobile application deployed to cloud/app store",
      "description":
          "Cross Platform Flutter app with custom backend\n and AWS/Azure hosting.",
      "imageUrl": "${GlobalVariables.s3Url}MobileFeaturedService.png"
    },
    {
      "featuredServices":
          "Full stack web application deployed using Devops to cloud",
      "description":
          "Frontend website with custom backend and AWS/Azure hosting.",
      "imageUrl": "${GlobalVariables.s3Url}FullStackOnAWS.png"
    },
    {
      "featuredServices":
          "Full stack web application deployed using Azure and Asp.Net core ",
      "description":
          "Frontend website/Mobile App with custom backend on Azure.",
      "imageUrl": "${GlobalVariables.s3Url}FullStackonAzure.png"
    }
  ];
  final List<String> imageUrls = [
    "${GlobalVariables.s3Url}code.png",
    "${GlobalVariables.s3Url}django.png",
    "${GlobalVariables.s3Url}flutter.png",
    "${GlobalVariables.s3Url}powershell.png",
  ];

  ServicesHomeScreen({Key? key}) : super(key: key);

  @override
  State<ServicesHomeScreen> createState() => _ServicesHomeScreenState();
}

class _ServicesHomeScreenState extends State<ServicesHomeScreen> {
  List<Services>? services;
  bool isError = false;
  String errorMsg = "";
  @override
  void didChangeDependencies() {
    getFeaturedServices();
    super.didChangeDependencies();
  }

  getFeaturedServices() async {
    try {
      services = await ServicesService.getAllServices(context: context);
      print("Services from widget $services");
    } catch (error) {
      log("An error occured $error");
      isError = true;
      errorMsg = "Sorry, an unexpected error occured";
    }
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.screenSize;

    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: size.width > 800 ? size.height * 0.6 : size.height * 0.45,
              width: size.width > 800 ? size.width * 0.7 : size.width,
              child: Center(
                child: Swiper(
                  // containerHeight: 500,
                  itemCount: widget.imageUrls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Utils.showPictureBox(context, "Featured Services",
                            widget.imageUrls[index]);
                      },
                      child: FancyShimmerImage(
                        imageUrl: widget.imageUrls[index],
                        boxFit: BoxFit.fill,
                        width: size.width * 0.8,
                      ),
                    );
                  },
                  pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: Colors.red,
                    ),
                  ),
                  autoplay: true,
                  control: const SwiperControl(
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Our Featured Services",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.42,
              child: ListView.builder(
                itemCount: widget.featuredServices.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FeaturedServiceWidget(
                    featuredServiceName: widget.featuredServices[index]
                            ["featuredServices"]
                        .toString(),
                    serviceDescription: widget.featuredServices[index]
                            ["description"]
                        .toString(),
                    imageUrl:
                        widget.featuredServices[index]["imageUrl"].toString(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
