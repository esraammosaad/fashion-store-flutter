import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constents.dart';
import '../start_component/button.dart';
import '../start_component/reusableComp.dart';
import 'navigation_bar.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  GlobalKey<FormState> formKey = GlobalKey();
  bool isVisible = true;
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  final auth = FirebaseAuth.instance;

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
                  'Hello',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Let's create an account",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 150,
                        child:reusableTextField(

                          text: 'First Name',
                          isPassword: false,
                          controller: firstNameController,

                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 150,
                        child: reusableTextField(
                          controller: lastNameController,
                          text: 'Last Name',
                          isPassword: false,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                reusableTextField(
                  controller: emailController,
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
                  height: 10,
                ),
                reusableTextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  text: 'Password',
                  isPassword: isVisible,
                  icon: IconButton(
                      onPressed: () {
                        isVisible = !isVisible;
                        setState(() {});
                      },
                      icon: isVisible
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                            )),
                ),
                const SizedBox(
                  height: 30,
                ),
                buttonComponent(
                  text: 'Sign Up',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {});
                      try {
                        await auth.createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                        FirebaseFirestore.instance.collection('users').add({
                          'name':'${firstNameController.text} ${lastNameController.text}',
                          'email':emailController.text,
                          'image':'https://t4.ftcdn.net/jpg/00/64/67/27/360_F_64672736_U5kpdGs9keUll8CRQ3p3YaEv2M6qkVY5.jpg'
                        }).then((value) {
                          nameId=value.id;

                          print(value.id);
                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NavBarPage()));
                      } on FirebaseAuthException catch (e) {
                        print(e);
                        SnackBar snackBar =  SnackBar(
                          content: Text(e.code.toString()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      print(emailController.text);
                      print(passwordController.text);
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
                        "Already have an account?",
                        style: TextStyle(color: Colors.grey[800], fontSize: 12),
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
