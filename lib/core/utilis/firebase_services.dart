import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../feature/home/domain/entities/product_entity.dart';

class FireBaseServices {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //.........................................................................................
  Future<void> insert(
      {required String email, required ProductEntity item}) async {
    final CollectionReference coll =
        _firestore.collection("Favourite").doc(email).collection("MyFavourite");
    coll.add({
      'id': item.productId,
      'title': item.productTitle,
      'price': item.productPrice,
      'img': item.productImg,
      'caption': item.caption,
      'rating': item.productRating,
      'category': item.productCat,
    });
  }

  //......................................................................................
  Future<Stream<QuerySnapshot<Object?>>> getData(
      {required String email}) async {
    final CollectionReference coll =
        _firestore.collection("Favourite").doc(email).collection("MyFavourite");
    return coll.orderBy("id").snapshots();
  }

//......................................................................................
  Future<void> deleteUsingFieldValue(
      {required String email, required num id}) async {
    final CollectionReference coll =
        _firestore.collection("Favourite").doc(email).collection("MyFavourite");
    QuerySnapshot querySnapshot = await coll.where('id', isEqualTo: id).get();
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }
}
