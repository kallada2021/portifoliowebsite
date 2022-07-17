import 'package:card_swiper/card_swiper.dart';
import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/screens/featuredservicewidget.dart';
import 'package:flutter/material.dart';

import '../../constants/utils.dart';

class ServicesHomeScreen extends StatefulWidget {
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
                    return Image.network(
                      widget.imageUrls[index],
                      fit: BoxFit.fill,
                      //  height: 400,
                      width: size.width * 0.8,
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
      ),
    );
  }
}
