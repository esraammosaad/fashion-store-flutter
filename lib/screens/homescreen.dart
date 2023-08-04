import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constents.dart';
import '../models/product_model.dart';
import '../services/getdata_firebase.dart';
import '../start_component/gridview.dart';
import '../start_component/horizontal_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> text = [
    'All',
    'Women',
    'Men',
    'unisex',
    'Children',
    'shoes',
    'shirts',
    'bags',
    'Accessosries',
    'pants',
    'dresses'
  ];

  bool isLoading = true;
  List<ProductModel>? productData = [];
  List<ProductModel> setProducts = [
    ProductModel(
        image:
            'https://i.pinimg.com/564x/cd/f8/e0/cdf8e0cd3c7b0cc27908211ea2172797.jpg',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '0',
        title: 'printed shirt',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'Men',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        title: "over size top",
        image:
            'https://i.pinimg.com/564x/6f/52/48/6f52480c37d39cfd8f88d867c5163734.jpg',
        details: 'Women Letter Graphic Drop Shoulder Tee',
        price: 39,
        id: '1',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'Women',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        title: 'T-Shirt Dress',
        image:
            'https://i.pinimg.com/564x/e7/29/01/e72901fa5d19d767d8bc105e3c931c9d.jpg',
        details: 'Painted Picnic T-Shirt Dress',
        price: 39,
        id: '2',
        isFavorite: false,
        mainCategory: 'Women',
        category: 'shirts',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        title: 'Crop Top',
        image:
            'https://i.pinimg.com/564x/c5/26/07/c5260784d192221b75558541ffdea552.jpg',
        details: 'Hot cheetos Crop Top',
        price: 20,
        id: '3',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'Women',
        numberOfItem: 1,
        size: 'S'),
    ProductModel(
        title: 'Cream Shirt',
        image:
            'https://i.pinimg.com/564x/17/df/37/17df3707e7fcff7274ff00285c487a84.jpg',
        details: 'JUST BE FUCKING KIND Cream Crewneck',
        price: 35,
        id: '4',
        isFavorite: false,
        mainCategory: 'Women',
        category: 'shirts',
        numberOfItem: 1,
        size: 'S'),
    ProductModel(
        title: 'High Top Sneakers',
        image:
            'https://i.pinimg.com/564x/f5/36/c1/f536c166aa03763df1bc96af8fa4d527.jpg',
        details: 'Converse Run Star Hike Leather High Top Sneakers',
        price: 100,
        id: '5',
        isFavorite: false,
        category: 'shirts',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Men'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/27/2f/31/272f31493b26f8409743dcfb539e937a.jpg',
        details:
            'Retro Women Rectangle Square Frame Fashion Glasses Shades For Summer Or Daily Life',
        price: 7.9,
        id: '6',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'Men',
        numberOfItem: 1,
        size: 'S'),
    ProductModel(
        title: 'Over Size Hoodie',
        image:
            'https://i.pinimg.com/564x/df/19/a3/df19a32deaaf42df41b4740874ff245b.jpg',
        details: 'Women Letter Graphic Drop Hoodie',
        price: 29.9,
        id: '7',
        isFavorite: false,
        category: 'shirts',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'SweatShirt',
        image:
            'https://i.pinimg.com/564x/a8/37/2d/a8372d9f7ef95cee2f702431f9f64a3d.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 88,
        id: '8',
        isFavorite: false,
        category: 'shirts',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Graphic SweatShirt',
        image:
            'https://i.pinimg.com/564x/df/77/c0/df77c0e836f308a0d46dce2fc3057199.jpg',
        details: 'Men Pullover SweatShirt',
        price: 12.44,
        id: '9',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'unisex',
        numberOfItem: 1,
        size: 'S'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/2d/58/8b/2d588bed29f69d224a850de88744f241.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 45.98,
        id: '10',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'Women',
        numberOfItem: 1,
        size: 'S'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/92/39/73/9239735aae46b1d13e1888e4878c9ce8.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 90,
        id: '11',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'unisex',
        numberOfItem: 1,
        size: 'S'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/fd/cb/a9/fdcba93f84100a2c8fa7252bbd8ae7d6.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 88,
        id: '12',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'Men',
        numberOfItem: 1,
        size: 'S'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/47/44/9a/47449a79174b07b2dc948151831d9699.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 44,
        id: '13',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'unisex',
        numberOfItem: 1,
        size: 'S'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/a3/fe/9a/a3fe9a805a519ca863498c081c6e191f.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 12,
        id: '14',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'unisex',
        numberOfItem: 1,
        size: 'S'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/b7/5f/78/b75f784610ea8a74ac522e29e8287f23.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 90,
        id: '15',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'unisex',
        numberOfItem: 1,
        size: 'S'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/80/a4/22/80a4221aac66df8e790c8d1861ffd616.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 11,
        id: '16',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'unisex',
        numberOfItem: 1,
        size: 'S'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/73/94/a0/7394a084eea3a1a7f89ce7b79f76cb7f.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 66.88,
        id: '17',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'unisex',
        numberOfItem: 1,
        size: 'S'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/8f/26/2f/8f262fbc1d77144bc7ffa0ab5fde0eab.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 22,
        id: '18',
        isFavorite: false,
        category: 'shirts',
        mainCategory: 'Women',
        numberOfItem: 1,
        size: 'S'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/0c/d2/36/0cd23618d6424e68fc80361de37c7717.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 33.88,
        id: '19',
        isFavorite: false,
        category: 'shirts',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/ae/a6/00/aea60064d1b87075233c0383c6227fea.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 33.88,
        id: '20',
        isFavorite: false,
        category: 'shirts',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/3a/de/35/3ade3574d40ed76fb8137998445f20c4.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 33.88,
        id: '21',
        isFavorite: false,
        category: 'shirts',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/a9/03/bf/a903bf21fa07e614ae3c1ff4bc75ac7e.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 33.88,
        id: '22',
        isFavorite: false,
        category: 'shirts',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Bag',
        image:
            'https://i.pinimg.com/564x/f5/70/11/f570112cd3eef7abd29460cea272c2d1.jpg',
        details: 'Chicago Women Pullover SweatShirt',
        price: 33.88,
        id: '23',
        isFavorite: false,
        category: 'bags',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Bag',
        image:
            'https://i.pinimg.com/564x/1c/c3/41/1cc3412a04f8ea69b2079e39c7a854ef.jpg',
        details: 'Chicago Women bag',
        price: 33.88,
        id: '24',
        isFavorite: false,
        category: 'bags',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Bag',
        image:
            'https://i.pinimg.com/564x/3c/2c/bd/3c2cbdbb4867c00e9efbac5998f7098a.jpg',
        details: 'Chicago Women bag',
        price: 33.88,
        id: '25',
        isFavorite: false,
        category: 'bags',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Bag',
        image:
            'https://i.pinimg.com/564x/e0/f0/fb/e0f0fb3ffea1e5ac32fda693b85de745.jpg',
        details: 'Chicago Women bag',
        price: 33.88,
        id: '26',
        isFavorite: false,
        category: 'bags',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shirt',
        image:
            'https://i.pinimg.com/564x/97/b4/9d/97b49d3a7b6353dbbfc4a58bfaa5af1c.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '27',
        isFavorite: false,
        category: 'shirts',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Bag',
        image:
            'https://i.pinimg.com/564x/37/e5/c8/37e5c8f6ebd547a1573bf9ec530eba36.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '28',
        isFavorite: false,
        category: 'bags',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shoes',
        image:
            'https://i.pinimg.com/564x/a8/ea/df/a8eadf63ca730c7c051334cc2492d376.jpg',
        details: 'Chicago Women shoes',
        price: 33,
        id: '29',
        isFavorite: false,
        category: 'shoes',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shoes',
        image:
            'https://i.pinimg.com/564x/3c/48/89/3c4889183d966718d113fe52e46398cf.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '30',
        isFavorite: false,
        category: 'shoes',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Bag',
        image:
            'https://i.pinimg.com/564x/e9/91/60/e99160845e260d6d267b42e50995150c.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '31',
        isFavorite: false,
        category: 'bags',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Bag',
        image:
            'https://i.pinimg.com/564x/7c/23/06/7c23063505cf2073da0728ad3d7be0cb.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '32',
        isFavorite: false,
        category: 'bags',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Bag',
        image:
            'https://i.pinimg.com/564x/fb/29/ca/fb29ca3aa806583fd71ae078d5f82d78.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '33',
        isFavorite: false,
        category: 'bags',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Bag',
        image:
            'https://i.pinimg.com/564x/bb/23/0a/bb230a8829f313421b1300a620fd2c32.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '34',
        isFavorite: false,
        category: 'bags',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Bag',
        image:
            'https://i.pinimg.com/564x/ee/ce/3a/eece3af2a556391bb585945336789bd5.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '35',
        isFavorite: false,
        category: 'bags',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Bag',
        image:
            'https://i.pinimg.com/564x/d9/93/31/d99331c54d3cfdc9ecf75f43caa432c1.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '36',
        isFavorite: false,
        category: 'bags',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Bag',
        image:
            'https://i.pinimg.com/564x/fc/bf/3f/fcbf3f5bfde2013137e741baacdecd3d.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '37',
        isFavorite: false,
        category: 'bags',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Bags',
        image:
            'https://i.pinimg.com/564x/8d/ff/a6/8dffa63349b903fe079cf9d7bef3cc95.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '38',
        isFavorite: false,
        category: 'bags',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shoes',
        image:
            'https://i.pinimg.com/564x/78/08/f8/7808f89acea45c940d098e543a040dd4.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '39',
        isFavorite: false,
        category: 'shoes',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shoes',
        image:
            'https://i.pinimg.com/564x/c3/eb/7e/c3eb7e05db72bb958a0146e8f84b0ee3.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '40',
        isFavorite: false,
        category: 'shoes',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shoes',
        image:
            'https://i.pinimg.com/564x/87/a1/2e/87a12e37db2641be485fa91842d7cb3e.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '41',
        isFavorite: false,
        category: 'shoes',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Dresses',
        image:
            'https://i.pinimg.com/564x/54/18/1c/54181c77b110b09b00204c6414ada035.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '42',
        isFavorite: false,
        category: 'dresses',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shoes',
        image:
            'https://i.pinimg.com/564x/55/80/5f/55805ffbcec0db4ecd7bcf5662601e17.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '43',
        isFavorite: false,
        category: 'shoes',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shoes',
        image:
            'https://i.pinimg.com/564x/6e/ce/7c/6ece7c02bbe87e8c5fa3f0ae1549b492.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '44',
        isFavorite: false,
        category: 'shoes',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shoes',
        image:
            'https://i.pinimg.com/564x/8f/a7/db/8fa7db4f7ceb80a84bc52aed7b649da9.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '45',
        isFavorite: false,
        category: 'shoes',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shoes',
        image:
            'https://i.pinimg.com/564x/92/9c/ec/929cec9943f15af3a4b2185906461cfd.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '46',
        isFavorite: false,
        category: 'shoes',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shoes',
        image:
            'https://i.pinimg.com/564x/32/17/9d/32179dd7f719ef4c0d2788ef818057af.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '47',
        isFavorite: false,
        category: 'shoes',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
        title: 'Shoes',
        image:
            'https://i.pinimg.com/564x/6e/62/ac/6e62ac401433266a4f0c9d94630adf9d.jpg',
        details: 'Chicago Women bag',
        price: 33,
        id: '48',
        isFavorite: false,
        category: 'shoes',
        numberOfItem: 1,
        size: 'S',
        mainCategory: 'Women'),
    ProductModel(
      title: 'Dresses',
      image:
          'https://i.pinimg.com/564x/16/71/34/167134bd1608c117c48777decb93b346.jpg',
      details: 'Chicago Women bag',
      price: 33,
      id: '49',
      isFavorite: false,
      category: 'dresses',
      numberOfItem: 1,
      size: 'S',
      mainCategory: 'Women',
    ),
    ProductModel(
        image:
            'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1663623093-GUEST_38605b4a-010d-4274-b7b6-59afba61c170.jpg?crop=1xw:1.00xh;center,top&resize=980:*',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '50',
        title: 'printed shirt',
        isFavorite: false,
        category: 'Children',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://images.squarespace-cdn.com/content/v1/5292bd6fe4b032abc30bd862/1631131820031-LM08H93DPQLTNRRLBVL6/denim_look3_4407.jpg',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '51',
        title: 'denim jacket',
        isFavorite: false,
        category: 'Children',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://cdn.shopify.com/s/files/1/1953/4751/products/boy-in-jacket_1600x.jpg?v=1618766799',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '52',
        title: 'printed shirt',
        isFavorite: false,
        category: 'Children',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://www2.hm.com/content/dam/TOOLBOX/PRE_SEASON/2023_s07/june_2023/TCK8005-2x3.jpg',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '53',
        title: 'printed shirt',
        isFavorite: false,
        category: 'Children',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://ae.hm.com/assets/styles/HNM/15187174/e7ae36589eb0d81d86019d64cd4a64b92da89491/1/image-thumb__4386904__product_listing/e7ae36589eb0d81d86019d64cd4a64b92da89491.jpg',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '54',
        title: 'printed shirt',
        isFavorite: false,
        category: 'Children',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://media.karousell.com/media/photos/products/2021/6/16/shein_accessories_1623822997_a4e9c2ea_progressive.jpg',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '55',
        title: 'thick chain',
        isFavorite: false,
        category: 'colorful earings',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://media.vogue.co.uk/photos/6315cc4a5f96daa29371f0e6/2:3/w_2560%2Cc_limit/commerce_0509_SKO_19007_UKVOGUE_Shot_10_009_2123SK_B_RGB.jpg',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '56',
        title: 'necklace',
        isFavorite: false,
        category: 'Accessosries',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://i.pinimg.com/736x/4d/92/79/4d9279595eebd65510ebb5f78a03a0dd.jpg',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '57',
        title: 'glasses',
        isFavorite: false,
        category: 'Accessosries',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://img.ltwebstatic.com/images3_pi/2023/01/28/16748739447cbbde3da23f0c9cf91b424dc1e6fdfd_thumbnail_750x.webp',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '58',
        title: 'gold earings',
        isFavorite: false,
        category: 'Accessosries',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://ae01.alicdn.com/kf/H39192efe187a49b28a0ce57718fa67bdv/Tocona-New-Simple-Chain-Gold-Color-Wafer-Pendant-Necklace-Charms-Alloy-Metal-Multi-layer-Adjustable-Party.jpg',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '59',
        title: 'necklace',
        isFavorite: false,
        category: 'Accessosries',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://di2ponv0v5otw.cloudfront.net/posts/2023/03/01/640054cc8bb2e26cff36576c/m_640054df678c3a8fb21937cd.jpg',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '60',
        title: 'Pants',
        isFavorite: false,
        category: 'pants',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://media.karousell.com/media/photos/products/2021/4/27/shein_baggy_pants_1619550713_399d7081.jpg',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '61',
        title: 'pants',
        isFavorite: false,
        category: 'pants',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://img.ltwebstatic.com/images3_pi/2022/09/16/16632977677dd387dfa145f2315b6ca15878970e6b_thumbnail_720x.webp',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '62',
        title: 'pants',
        isFavorite: false,
        category: 'pants',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://img.ltwebstatic.com/images3_pi/2022/10/08/1665199411f324a21fc8af6a1f3050dfe826fa1b70_thumbnail_405x552.webp',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '63',
        title: 'pants',
        isFavorite: false,
        category: 'pants',
        size: 'S',
        numberOfItem: 1),
    ProductModel(
        image:
            'https://img.ltwebstatic.com/images3_pi/2022/08/19/16608868332b33533ceecd44464a8fd0de35a0c8a5_thumbnail_720x.webp',
        details: 'Men Letter Graphic Drop Shoulder Tee',
        price: 9.49,
        id: '64',
        title: 'pants',
        isFavorite: false,
        category: 'pants',
        size: 'S',
        numberOfItem: 1),
  ];

  set() {
    for (int i = 0; i < setProducts.length; i++) {
      FirebaseFirestore.instance
          .collection('All')
          .doc('$i')
          .set(setProducts[i].toJson());
    }
  }

  gettingProductData({
    String? text,
  }) async {
    productData = await getData(
      text: text ?? 'All',
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    gettingProductData();

    set();

    super.initState();
  }

  @override
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(color: KHomePageColor),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Text(
                      'NEW IN',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_circle_down_rounded,
                      size: 35,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              Container(
                height: 32,
                margin: const EdgeInsets.only(left: 10, top: 5),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return horizontalListView(
                        text: text,
                        index: index,
                        onTap: () {
                          gettingProductData(
                            text: text[index],
                          );
                          print(text[index]);
                          setState(() {
                            selectedItem = index;
                          });
                        },
                        selectedItem: selectedItem);
                  },
                  itemCount: text.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Expanded(
                child: buildGridView(items: productData!),
              ),
            ],
          );
  }

  GridView buildGridView({required List<ProductModel> items}) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.66),
      itemBuilder: (context, index) => customCard(
        items: items,
        index: index,
        onPressed: () {
          setState(() {
            if (favoriteItemsId.contains(items[index].id) ||
                items[index].isFavorite == true) {
              favoriteItems.remove(items[index]);
              favoriteItemsId.remove(items[index].id);
              FirebaseFirestore.instance
                  .collection('All')
                  .doc(items[index].id)
                  .update({'isFavorite': false});
            } else {
              favoriteItemsId.add(items[index].id);
              favoriteItems.add(items[index]);
              FirebaseFirestore.instance
                  .collection('All')
                  .doc(items[index].id)
                  .update({'isFavorite': true});
            }
          });
        },
      ),
      itemCount: items.length,
      shrinkWrap: true,
    );
  }
}
