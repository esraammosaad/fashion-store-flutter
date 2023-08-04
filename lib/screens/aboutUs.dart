import 'package:fashion_app/constents.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _instgramurl = Uri.parse('https://www.instagram.com/esraa.m.mosaad/');
final Uri _facebookurl =
    Uri.parse('https://www.facebook.com/esraamohamed.mosaad?mibextid=LQQJ4d');
final Uri _githuburl = Uri.parse('https://github.com/esraammosaad');
final Uri _twitterurl = Uri.parse('https://twitter.com/EsraaMuhmedMu');

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/two.png',
              height: double.infinity,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Container(
                color: Colors.white.withOpacity(0.2),
                width: double.infinity,
                height: double.infinity),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                )),
            Padding(
                padding: const EdgeInsets.only(
                  top: 230,
                  left: 50,
                ),
                child: Container(
                    decoration: BoxDecoration(
                        color: KPrimaryColor,
                        borderRadius: BorderRadius.circular(25)),
                    width: 260,
                    height: 280,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 8, right: 8),
                      child: Column(children: [
                        const Text(
                          'Your Journey To The World',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lumanosimo'),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          'of Models Begins Here',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lumanosimo'),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'A fashion store is a place that sells',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const Text(' the latest and',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        const Text(
                          'trendy clothes and fashion',
                          style: TextStyle(),
                        ),
                        const Text('accessories to meet',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        const Text('consumer lifestyle needs.',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text('Contact us',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const IconButton(
                                // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                icon: FaIcon(FontAwesomeIcons.instagram,
                                    color: Colors.pinkAccent),
                                onPressed: _instgramUrl),
                            const IconButton(
                                // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                icon: FaIcon(FontAwesomeIcons.facebook,
                                    color: Colors.blue),
                                onPressed: _facebookUrl),
                            const IconButton(
                                // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                icon: FaIcon(FontAwesomeIcons.github,
                                    color: Colors.black),
                                onPressed: _githubUrl),
                            InkWell(
                                onTap: _twitterUrl,
                                child: Image.asset(
                                  'assets/images/X-app.png',
                                  height: 26,
                                  width: 26,
                                )),
                          ],
                        ),
                      ]),
                    ))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 208),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ABOUT',
                    style: TextStyle(fontSize: 38),
                  ),
                  const Text(
                    'US',
                    style: TextStyle(fontSize: 38),
                  ),
                  SizedBox(
                      width: 40,
                      child: Divider(
                        color: Colors.grey[800],
                        height: 5,
                      ))
                ],
              ),
            ),
            const Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 410),
                    child: Text(
                      'Developed by Esraa Mosaad',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )))
          ],
        ),
      ),
    );
  }
}

Future<void> _instgramUrl() async {
  if (!await launchUrl(_instgramurl)) {
    throw Exception('Could not launch $_instgramurl');
  }
}

Future<void> _facebookUrl() async {
  if (!await launchUrl(_facebookurl)) {
    throw Exception('Could not launch $_facebookurl');
  }
}

Future<void> _githubUrl() async {
  if (!await launchUrl(_githuburl)) {
    throw Exception('Could not launch $_githuburl');
  }
}

Future<void> _twitterUrl() async {
  if (!await launchUrl(_twitterurl)) {
    throw Exception('Could not launch $_githuburl');
  }
}
