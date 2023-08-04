import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/services/getdata_firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../constents.dart';
import 'orders.dart';
import 'shopping _cart.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  double? total;
  bool isLoading = true;
  getPrice() async {
    total = await getTotalPrice();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        elevation: 0,
        title: const Text(
          'Check Out',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconlyLight.arrowLeftSquare,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => cartItem(
              onPressed: () {
                if (InCart.contains(itemsInCart[index].id)) {
                  InCart.remove(itemsInCart[index].id);
                  itemsInCart.remove(itemsInCart[index]);
                }

                setState(() {});
              },
              onTapremove: () {
                setState(() {
                  if (itemsInCart[index].numberOfItem > 1) {
                    itemsInCart[index].numberOfItem =
                        itemsInCart[index].numberOfItem - 1;
                    FirebaseFirestore.instance
                        .collection('All')
                        .doc(itemsInCart[index].id)
                        .set(itemsInCart[index].toJson());
                  }
                });
              },
              onTapadd: () {
                setState(() {
                  itemsInCart[index].numberOfItem =
                      itemsInCart[index].numberOfItem + 1;
                  FirebaseFirestore.instance
                      .collection('All')
                      .doc(itemsInCart[index].id)
                      .set(itemsInCart[index].toJson());
                });
              },
              index: index),
          itemCount: itemsInCart.length,
        ),
      ),
      bottomSheet: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: KHomePageColor,
            ))
          : Padding(
              padding: const EdgeInsets.only(left: 55, bottom: 10),
              child: Text(
                'Total Price : ${total?.round()}\n Check Out',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lumanosimo'),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const YourOrders()));
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.done_outline),
      ),
    );
  }
}
