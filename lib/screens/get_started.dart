import 'package:flutter/material.dart';
import '../start_component/button.dart';
import '../start_component/page_indicator.dart';
import 'login.dart';
import 'signup.dart';

class Started extends StatelessWidget {
  const Started({Key? key}) : super(key: key);

  // Color(0xffBEA384)

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const Image(
            image: AssetImage('assets/images/firstone.png'),
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
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.7),
                  Colors.white.withOpacity(0.8),
                  Colors.white.withOpacity(0.9),
                  Colors.white.withOpacity(0.9),
                  Colors.white.withOpacity(0.9),
                  Colors.white.withOpacity(1),
                  Colors.white.withOpacity(1),
                  Colors.white.withOpacity(1),
                  Colors.white.withOpacity(1),
                  Colors.white,
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,

            child: Column(

              children: [
                const Spacer(flex: 12,),
                const Text(
                  '   Your Apperance \nShows Your Quality ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '   Change The Quality Of Your\nAppearance With Shopbop Now! ',
                  style: TextStyle(color: Colors.grey[900], fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Indicator(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: buttonComponent(
                    text: 'Sign Up',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style:
                            TextStyle(color: Colors.grey[800], fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: Text(
                          'Login here',
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
