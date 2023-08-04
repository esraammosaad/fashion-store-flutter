import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/constents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class FavoriteItems extends StatefulWidget {
  const FavoriteItems({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteItems> createState() => _FavoriteItemsState();
}

class _FavoriteItemsState extends State<FavoriteItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => cartItem(
          onPressed: () async {
            if (favoriteItemsId.contains(favoriteItems[index].id)) {
              await FirebaseFirestore.instance
                  .collection('All')
                  .doc(favoriteItems[index].id)
                  .update({'isFavorite': false});
               favoriteItemsId.remove(favoriteItems[index].id);
              favoriteItems.remove(favoriteItems[index]);

            }

            setState(() {});
          },
          index: index),
      itemCount: favoriteItems.length,
    );
  }
}

Widget cartItem({required VoidCallback onPressed, required int index}) {
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
                    favoriteItems[index].image,
                    fit: BoxFit.cover,
                    height: 120,
                    width: 95,
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: const Icon(
                      IconlyBold.heart,
                      size: 17,
                      color: KHomePageColor,
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
                    favoriteItems[index].title,
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
                    favoriteItems[index].details,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        r'$' + favoriteItems[index].price.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Spacer(
                        flex: 1,
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
