import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../constants/utils.dart';

class FeaturedServiceWidget extends StatefulWidget {
  final String featuredServiceName;
  final String serviceDescription;
  final String imageUrl;

  const FeaturedServiceWidget({
    Key? key,
    required this.featuredServiceName,
    required this.serviceDescription,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<FeaturedServiceWidget> createState() => _FeaturedServiceWidgetState();
}

class _FeaturedServiceWidgetState extends State<FeaturedServiceWidget> {
  bool isHovered = false;

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
          onTap: () {
            Utils.showPictureBox(context, "Featured Services", widget.imageUrl);
          },
          onHover: (isHoovered) {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.featuredServiceName,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      FancyShimmerImage(
                        imageUrl: widget.imageUrl,
                        //width: size.width * 0.22,
                        height: size.width > 800
                            ? size.width * 0.17
                            : size.width * 0.25,
                        boxFit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  FittedBox(
                    child: Text(
                      widget.serviceDescription,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                      // textAlign: TextAlign.justify,
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
      ),
    );
  }
}
