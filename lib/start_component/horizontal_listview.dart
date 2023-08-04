import 'package:flutter/material.dart';

import '../constents.dart';
Widget horizontalListView(
    {required List<String> text,
      required VoidCallback onTap,
      required int index,
      required  selectedItem,double ? width, double ? radius}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(left: 5),
      width: width ?? 90,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: selectedItem != index ? KPrimaryColor : Colors.black,
        borderRadius: BorderRadius.circular(
          radius ?? 30,
        ),
      ),
      child: Center(
          child: Text(
            text[index],
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedItem != index ? Colors.black : KPrimaryColor),
          )),
    ),
  );
}
