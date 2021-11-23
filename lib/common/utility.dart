import 'package:flutter/material.dart';

class FiverAppUtility{
  static List arrayIntoSubArrays(List list, int chunkSize){
    int len = list.length;
    List itemList = [];
    for (var i = 0; i < len; i += chunkSize) {
      int size = i+chunkSize;
      itemList.add(list.sublist(i, size > len ? len : size));
    }
    return itemList;
  }

  static List addItemsToSubArrays<T>(List<T> list, T item, int chunkSize){
    list.add(item);
    List itemList = FiverAppUtility.arrayIntoSubArrays(list, chunkSize);
    return itemList;
  }

}