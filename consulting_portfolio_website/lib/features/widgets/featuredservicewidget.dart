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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            imageUrl: widget.imageUrl,
                            //width: size.width * 0.22,
                            height: size.width > 900
                                ? size.width * 0.13
                                : size.width * 0.2,
                            boxFit: BoxFit.fill,
                          ),
                          const SizedBox(
                            height: 15,
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
                    textAlign: TextAlign.justify,
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
