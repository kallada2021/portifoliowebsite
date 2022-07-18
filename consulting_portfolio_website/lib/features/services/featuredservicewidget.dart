import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../constants/utils.dart';

class FeaturedServiceWidget extends StatefulWidget {
  final String featuredServiceName;
  final String serviceDescription;

  FeaturedServiceWidget({
    Key? key,
    required this.featuredServiceName,
    required this.serviceDescription,
  }) : super(key: key);

  @override
  State<FeaturedServiceWidget> createState() => _FeaturedServiceWidgetState();
}

class _FeaturedServiceWidgetState extends State<FeaturedServiceWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor.withOpacity(0.9),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.featuredServiceName,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        FancyShimmerImage(
                          imageUrl:
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Apricot_and_cross_section.jpg/1280px-Apricot_and_cross_section.jpg",
                          //width: size.width * 0.22,
                          height: size.width > 800
                              ? size.width * 0.12
                              : size.width * 0.2,
                          boxFit: BoxFit.fill,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                IconlyBold.chart,
                                size: 22,
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                //const PriceWidget(),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.serviceDescription,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
