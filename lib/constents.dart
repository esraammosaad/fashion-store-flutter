import 'package:fashion_app/services/getdata_firebase.dart';
import 'package:flutter/material.dart';
import 'models/product_model.dart';
const KPrimaryColor= Color(0xffFDF6F2);
const KHomePageColor= Color(0xffb39ddf);
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

String ? nameId;

TextEditingController changedNameController = TextEditingController();
TextEditingController changedImageController = TextEditingController();






List<ProductModel> favoriteItems = [];
List<String>favoriteItemsId=[];

List<ProductModel> itemsInCart = [];
List<String> InCart = [];


