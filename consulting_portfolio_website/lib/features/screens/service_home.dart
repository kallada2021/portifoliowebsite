import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../constants/utils.dart';

class ServicesHomeScreen extends StatefulWidget {
  const ServicesHomeScreen({Key? key}) : super(key: key);

  @override
  State<ServicesHomeScreen> createState() => _ServicesHomeScreenState();
}

class _ServicesHomeScreenState extends State<ServicesHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.screenSize;

    return Scaffold(
      body: SizedBox(
        height: size.height * 0.33,
        child: Center(
          //TODO: Code snippets go here
          child: Swiper(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                "https://via.placeholder.com/288x188",
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
    );
  }
}
