import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../constents.dart';
import '../models/product_model.dart';
import '../screens/details.dart';

class customCard extends StatelessWidget {
  customCard(
      {super.key,
      required this.items,
      required this.index,
      required this.onPressed});
  List<ProductModel> items;
  int index;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Details.detailsPageRoute,
                      arguments: items[index]);
                },
                child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.network(
                      items[index].image,
                      fit: BoxFit.cover,
                      height: 190,
                      width: 128,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 86, top: 144),
                child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      items[index].isFavorite! ||
                              favoriteItemsId.contains(items[index].id)
                          ? IconlyBold.heart
                          : IconlyLight.heart,
                      size: 26,
                      color: KHomePageColor,
                    )),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                items[index].title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                r'$' + items[index].price.toString(),
                style: TextStyle(color: Colors.grey[900]),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
