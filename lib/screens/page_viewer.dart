import 'package:fashion_app/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import '../start_component/page_indicator.dart';
import 'get_started.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  List<AppBar> appBar = [
    AppBar(
      backgroundColor: const Color(0xffCDC2B4),
      elevation: 0,
      title: const Text(
        'Shopbop',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              controller.jumpToPage(1);
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ))
      ],
    ),
    AppBar(
      backgroundColor: const Color(0xffBEA283),
      elevation: 0,
      title: const Text(
        'Shopbop',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          controller.jumpToPage(0);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    ),
  ];

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar[pageIndex],
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          pageIndex = index;
          setState(() {});
        },
        children: const [

          SplashScreen(),
          Started(),

        ],
      ),
    );
  }
}
