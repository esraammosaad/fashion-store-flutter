import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/constents.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({
    Key? key,
  }) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}

Widget cartItem(
    {required VoidCallback onTapremove,
    required VoidCallback onTapadd,
    required VoidCallback onPressed,
    required int index}) {
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
              child: Stack(
                children: [
                  Image.network(
                    itemsInCart[index].image,
                    fit: BoxFit.cover,
                    height: 120,
                    width: 95,
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.dangerous_outlined,
                      size: 17,
                    ),
                    alignment: Alignment.topLeft,
                  )
                ],
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemsInCart[index].details,
                    maxLines: 3,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    itemsInCart[index].details,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  itemsInCart[index].category=='bags'?const SizedBox(height: 0,): Text(
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
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                      GestureDetector(
                        onTap: onTapremove,
                        child: const CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.remove,
                              size: 13,
                              color: KHomePageColor,
                            )),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '0${itemsInCart[index].numberOfItem}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: onTapadd,
                        child: const CircleAvatar(
                            radius: 10,
                            backgroundColor: KHomePageColor,
                            child: Icon(
                              Icons.add,
                              size: 13,
                              color: Colors.black,
                            )),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 3,
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
