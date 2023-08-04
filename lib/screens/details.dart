import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/constents.dart';
import 'package:fashion_app/models/product_model.dart';
import 'package:fashion_app/screens/navigation_bar.dart';
import 'package:fashion_app/start_component/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../start_component/horizontal_listview.dart';

class Details extends StatefulWidget {
  const Details({super.key,});
  static const detailsPageRoute='detailsPage';

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<String> text = ['S', 'M', 'L', 'XL', 'XXL'];
  List<String> shoesText = ['37', '38', '39', '40', '41'];

  int selectedItem=0;


  @override
  Widget build(BuildContext context) {
    final details =ModalRoute.of(context)?.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Shopbop',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const NavBarPage()));

              },
              icon: const Icon(
                IconlyLight.home,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: KPrimaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 100, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Image.network(
                     details.image,
                      fit: BoxFit.fill,
                      height: 350,
                      width: 280,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 220,
                          child: Text(
                            details.title,
                            maxLines: 2,
                            style: const TextStyle(
                                fontFamily: 'Lumanosimo',
                                fontWeight: FontWeight.bold,
                                fontSize: 21),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            r'$''${details.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      details.details,
                      maxLines: 2,
                      style: TextStyle(color: Colors.grey[800], fontSize: 14),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 32,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return horizontalListView(
                              text: details.category=='shoes'?shoesText:text,
                              index: index,
                              onTap: ()async {
                                setState(()  {
                                  selectedItem = index;
                                  details.size=details.category=='shoes'?shoesText[selectedItem]:text[selectedItem];

                                });
                                await FirebaseFirestore.instance
                                    .collection('All')
                                    .doc(details.id)
                                    .set(details.toJson());
                              },
                              selectedItem: selectedItem,
                              width: 40,
                              radius: 45);
                        },
                        itemCount: text.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (favoriteItemsId.contains(details.id) ) {


                      favoriteItems.remove(details);
                      favoriteItemsId.remove(details.id);

                    } else {
                      favoriteItems.add(details);
                      favoriteItemsId.add(details.id);




                    }
                  });
                },
                icon: Icon(
                  favoriteItemsId.contains(details.id)
                      ?Icons.favorite
                      : Icons.favorite_border_rounded,
                  color: KHomePageColor,
                  size: 30,
                )),
            Expanded(
              child: buttonComponent(
                text: InCart.contains(details.id)
                    ? 'Added'
                    : 'Add to cart',
                onPressed: () {


                  if (InCart.contains(details.id)) {
                    InCart.remove(details.id);
                    itemsInCart.remove(details);
                    SnackBar snackBar = const SnackBar(
                      content: Text('item removed from the cart'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    InCart.add(details.id);
                    itemsInCart.add(details);
                    SnackBar snackBar = const SnackBar(
                      content: Text('item added to the cart'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }

                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
