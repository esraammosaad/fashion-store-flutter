import 'package:fashion_app/screens/profile.dart';
import 'package:fashion_app/screens/shopping%20_cart.dart';
import 'package:fashion_app/screens/signup.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../constents.dart';
import '../services/getdata_firebase.dart';
import 'aboutUs.dart';
import 'checkout.dart';
import 'editprofile.dart';
import 'favorite_items.dart';
import 'homescreen.dart';
import 'orders.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int index = 0;
  List<Widget> navBarPages = [
    const HomeScreen(),
    const FavoriteItems(),
    const ShoppingCart(),
    const Profile()
  ];
  GlobalKey<ScaffoldState> keyScaffold=GlobalKey<ScaffoldState>();
  List<String> title = ['Home', 'Favorites', 'Cart', 'Profile'];
  bool isLoad=true;
  String? imageDrawer;
  String? nameDrawer;
  String? emailDrawer;

  getDrawerName() async {
    nameDrawer = await getUserName();
    imageDrawer = await getUserImage();
    emailDrawer = await getUserEmail();
    setState(() {
      isLoad=false;

    });

  }


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyScaffold,
      drawer: isLoad
          ? const Center(
              child: CircularProgressIndicator(
              color: KHomePageColor,
            ))
          : Drawer(
              backgroundColor: KPrimaryColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(color: KHomePageColor),
                      accountName: Text(
                        nameDrawer!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      accountEmail: Text(
                        emailDrawer!,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(imageDrawer!),
                      ),
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
                        text: 'Home',
                        icon: IconlyBold.home,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavBarPage()));
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
                                  builder: (context) => const SignUp()));
                        }),
                  ],
                ),
              )),
      backgroundColor: KPrimaryColor,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        leading: IconButton(onPressed: (){
          getDrawerName();



          keyScaffold.currentState?.openDrawer();
        },icon: const Icon(Icons.menu_sharp)),
        elevation: 0,
        title: Text(
          title[index],
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CheckOut()));
              },
              icon: const Icon(
                Icons.payments_outlined,
                color: Colors.black,
                size: 28,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.notification,
                color: Colors.black,
                size: 26,
              )),
        ],
      ),
      body: navBarPages[index],
      bottomNavigationBar: FloatingNavbar(
        borderRadius: 30,
        backgroundColor: Colors.black.withOpacity(0.7),
        selectedItemColor: KHomePageColor,
        selectedBackgroundColor: Colors.transparent,
        elevation: 0,
        iconSize: 25,
        onTap: (int currentIndex) {
          getDrawerName();
          index = currentIndex;

          setState(() {});
        },
        currentIndex: index,
        items: [
          FloatingNavbarItem(
            icon: IconlyBold.home,
          ),
          FloatingNavbarItem(
            icon: IconlyBold.heart,
          ),
          FloatingNavbarItem(
            icon: IconlyBold.buy,
          ),
          FloatingNavbarItem(
            icon: IconlyBold.profile,
          ),
        ],
      ),
    );
  }
}
