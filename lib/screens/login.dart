import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/models/userModel.dart';
import 'package:fashion_app/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constents.dart';
import '../start_component/button.dart';
import '../start_component/reusableComp.dart';
import 'navigation_bar.dart';

User? loggedinUser;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isVisible = true;
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  final auth = FirebaseAuth.instance;
  bool isValidate = true;

  void getCurrentUser() async {


    try {
      final user = auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Shopbop',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          top: 8,
          right: 15,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Login to your account now",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField(
                  onFeildSubmitted: (value){
                    emailLoginController.text=value;


                  },
                  controller: emailLoginController,
                  keyboardType: TextInputType.emailAddress,
                  text: 'Email Address',
                  isPassword: false,
                  icon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.email,
                        color: Colors.grey,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                reusableTextField(
                  onFeildSubmitted: (value){
                    passwordLoginController.text=value;


                  },

                  controller: passwordLoginController,
                  keyboardType: TextInputType.visiblePassword,
                  text: 'Password',
                  isPassword: isVisible,
                  icon: IconButton(
                      onPressed: () {
                        isVisible = !isVisible;
                        setState(() {});
                      },
                      icon: isVisible
                          ? const Icon(Icons.visibility_off, color: Colors.grey)
                          : const Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                            )),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle_outlined,
                      color: Colors.grey,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Remember me',
                      style: TextStyle(color: Colors.grey[800], fontSize: 12),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                buttonComponent(
                  text: 'Login',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await auth.signInWithEmailAndPassword(
                            email: emailLoginController.text,
                            password: passwordLoginController.text);
                        FirebaseFirestore.instance
                            .collection('users')
                            .get()
                            .then((value) {
                          for (int i = 0; i < value.size; i++) {
                            if (UserModel.fromJson(value.docs[i].data())
                                    .email ==
                                emailLoginController.text) {
                              nameId = value.docs[i].id;
                            }
                          }
                        });


                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NavBarPage()));
                      } on FirebaseAuthException catch (e) {
                        SnackBar snackBar = SnackBar(
                          content: Text(e.code.toString()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      print(emailLoginController.text);
                      print(passwordLoginController.text);
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey[800], fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        child: Text(
                          'Sign Up here',
                          style:
                              TextStyle(fontSize: 13, color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
