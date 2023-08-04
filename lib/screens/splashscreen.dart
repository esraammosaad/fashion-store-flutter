import 'package:fashion_app/screens/page_viewer.dart';
import 'package:fashion_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../start_component/button.dart';
import '../start_component/page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageViewScreen pageView = const PageViewScreen();

  // Color(0xffBEA384)
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const Image(
            image: AssetImage('assets/images/splashscreen.png'),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.4),
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.7),
                  Colors.white.withOpacity(0.8),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 230),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(

                children: [



                  const Spacer(
                    flex: 12,
                  ),
                  const Indicator(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buttonComponent(
                      text: 'Get Started',
                      onPressed: () {
                        controller.jumpToPage(1);
                      },
                    ),
                  ),


                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (Context)=>const SignUp()));


                      }, child:
                      const Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Skip',style: TextStyle(color: Colors.black),),
                          Icon(IconlyBold.arrowRight2,color: Colors.black,),
                        ],
                      ),

                      ),


                  const Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
