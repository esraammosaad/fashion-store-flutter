import 'package:cloud_firestore/cloud_firestore.dart';
import '../constents.dart';
import '../models/product_model.dart';
import '../models/userModel.dart';

Future getData({
  String? text,
}) async {
  List<ProductModel> getData = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> getDocs = [];

  await FirebaseFirestore.instance.collection('All').get().then((value) {
    getDocs = value.docs;

    for (int i = 0; i < getDocs.length; i++) {
      if (text == 'All') {
        getData.add(ProductModel.fromJson(getDocs[i].data()));
      } else if (ProductModel.fromJson(getDocs[i].data()).mainCategory ==
          text) {
        getData.add(ProductModel.fromJson(getDocs[i].data()));
      } else {
        if (ProductModel.fromJson(getDocs[i].data()).category == text) {
          getData.add(ProductModel.fromJson(getDocs[i].data()));
        }
      }
    }
  });

  return getData;
}

// getFavoriteItems() {
//   List<QueryDocumentSnapshot<Map<String, dynamic>>> getDocs;
//   FirebaseFirestore.instance.collection('All').get().then((value) {
//     getDocs = value.docs;
//     for (int i = 0; i < getDocs.length; i++) {
//       if (ProductModel.fromJson(getDocs[i].data()).isFavorite == true) {
//         favoriteItems.add(ProductModel.fromJson(getDocs[i].data()));
//         favoriteItemsId.add(ProductModel.fromJson(getDocs[i].data()).id);
//       }
//     }
//   });
// }

getUserName() async {
  String? name;

  await FirebaseFirestore.instance
      .collection('users')
      .doc(nameId)
      .get()
      .then((value) {
    name = UserModel.fromJson(value.data()).name;
  });
  return name;
}

getUserImage() async {
  String? image;

  await FirebaseFirestore.instance
      .collection('users')
      .doc(nameId)
      .get()
      .then((value) {
    image = UserModel.fromJson(value.data()).image;
  });
  return image;
}
getUserEmail() async {
  String? email;

  await FirebaseFirestore.instance
      .collection('users')
      .doc(nameId)
      .get()
      .then((value) {
    email = UserModel.fromJson(value.data()).email;
  });
  return email;
}

getTotalPrice() async {
  double totalPrice = 0;

  await FirebaseFirestore.instance.collection('All').get().then((value) {
    for (int i = 0; i < value.size; i++) {
      if (InCart.contains(ProductModel.fromJson(value.docs[i].data()).id)) {
        totalPrice += (ProductModel.fromJson(value.docs[i].data()).price *
            ProductModel.fromJson(value.docs[i].data()).numberOfItem);
        print(totalPrice);
      }
    }
  });
  print(totalPrice);
  return totalPrice;
}
