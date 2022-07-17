import 'package:card_swiper/card_swiper.dart';
import 'package:consulting_portfolio_website/features/screens/featuredservicewidget.dart';
import 'package:flutter/material.dart';

import '../../constants/utils.dart';

class ServicesHomeScreen extends StatefulWidget {
  final List<String> imageUrls = ["https://testing-portfolio-website-magnolia-bucket.s3.amazonaws.com/Images/code.png","https://testing-portfolio-website-magnolia-bucket.s3.amazonaws.com/Images/django.png","https://testing-portfolio-website-magnolia-bucket.s3.amazonaws.com/Images/flutter.png","https://testing-portfolio-website-magnolia-bucket.s3.amazonaws.com/Images/powershell.png"];
  ServicesHomeScreen({Key? key}) : super(key: key);

  @override
  State<ServicesHomeScreen> createState() => _ServicesHomeScreenState();
}

class _ServicesHomeScreenState extends State<ServicesHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.screenSize;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.33,
            child: Center(
              //TODO: Code snippets go here
              child: Swiper(
                itemCount: widget.imageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                   widget.imageUrls[index],
                    fit: BoxFit.fill,
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
          const Text(
            "Our Featured Services",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: size.height * 0.4,
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FeaturedServiceWidget();
                }),
          ),
        ],
      ),
    );
  }
}
