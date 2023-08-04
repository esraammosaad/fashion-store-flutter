import 'package:fashion_app/constents.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

PageController controller = PageController();

class Indicator extends StatelessWidget {
  const Indicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 2,
      effect: const WormEffect(
        dotColor: Colors.black,
        activeDotColor: KHomePageColor,
        spacing: 10,
        dotHeight: 2,
        dotWidth: 13,
      ),
      onDotClicked: (index) => controller.jumpToPage(index),
    );
  }
}
