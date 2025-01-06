import 'package:cloud_firestore/cloud_firestore.dart';

import '../utilis/constants.dart';

Stream<bool> isFav({required num id}) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  return firestore
      .collection('Favourite')
      .doc(appEmail)
      .collection('MyFavourite')
      .where('id', isEqualTo: id)
      .snapshots()
      .map((querySnapshot) {
    // Map the querySnapshot to a boolean
    if (querySnapshot.docs.isNotEmpty) {
      return true;
    }  else{
      return false ;
    }
  });
}
