import 'package:fashion_app/constents.dart';
import 'package:fashion_app/screens/login.dart';
import 'package:fashion_app/screens/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../services/getdata_firebase.dart';
import 'aboutUs.dart';
import 'editprofile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoad = true;
  String? image;
  String? name;
  getName() async {
    name = await getUserName();
    image = await getUserImage();
    setState(() {
      isLoad = false;
    });
  }

  @override
  void initState() {
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoad
        ? const Center(
            child: CircularProgressIndicator(
              color: KHomePageColor,
            ),
          )
        : Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, top: 8, bottom: 70),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: KPrimaryColor,
                    backgroundImage: NetworkImage(image ??
                        'https://t4.ftcdn.net/jpg/00/64/67/27/360_F_64672736_U5kpdGs9keUll8CRQ3p3YaEv2M6qkVY5.jpg'),
                  ),
                  Text(
                    name!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  card(
                      text: 'Edit profile',
                      icon: IconlyBold.profile,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditProfile()));
                      }),
                  card(
                      text: 'Orders',
                      icon: Icons.payments_outlined,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const YourOrders()));
                      }),
                  card(
                      text: 'About Us',
                      icon: Icons.info_outline,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutUs()));
                      }),
                  card(
                      text: 'Log out',
                      icon: IconlyBold.logout,
                      onTap: () {
                        firstNameController.clear();
                        lastNameController.clear();
                        emailController.clear();
                        passwordController.clear();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      }),
                ],
              ),
            ),
          );
  }
}

card(
    {required String text,
    required IconData icon,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
          borderSide: const BorderSide(color: Colors.white)),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        leading: Icon(
          icon,
          color: Colors.grey,
          size: 30,
        ),
      ),
    ),
  );
}
