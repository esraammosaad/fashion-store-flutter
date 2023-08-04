import 'package:fashion_app/screens/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../constents.dart';

class YourOrders extends StatelessWidget {
  const YourOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        elevation: 0,
        title: const Text(
          'Orders',
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NavBarPage()));
              },
              icon: const Icon(
                IconlyLight.home,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => cartOrder(index: index),
        itemCount: itemsInCart.length,
      ),
    );
  }
}

Widget cartOrder({required int index}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, top: 16),
    child: SizedBox(
      height: 130,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                itemsInCart[index].image,
                fit: BoxFit.cover,
                height: 120,
                width: 95,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemsInCart[index].title,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    itemsInCart[index].details,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'size: ${itemsInCart[index].size}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        r'$' + itemsInCart[index].price.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                      Text(
                        '${itemsInCart[index].numberOfItem} item',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: KHomePageColor),
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                      const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.done_outline,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
