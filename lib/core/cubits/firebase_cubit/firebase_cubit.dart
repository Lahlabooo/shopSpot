import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopspot/core/utilis/firebase_services.dart';
import '../../../feature/home/domain/entities/product_entity.dart';
part 'firebase_state.dart';
class FirebaseCubit extends Cubit<FirebaseState> {
  FirebaseCubit(this._fireBaseServices) : super(FirebaseInitial());
  final FireBaseServices _fireBaseServices;
  List<ProductEntity> favProducts = [];
  static FirebaseCubit get(context) => BlocProvider.of<FirebaseCubit>(context);
//...............................................................................
  Future<void> insertData(
      {required String email, required ProductEntity item}) async {
    try {
      _fireBaseServices.insert(email: email, item: item);
      emit(SuccessInsert());
    } catch (e) {
      emit(FailureInsert());
    }
  }

//.....................................................................................
  Future<void> getData({required String email}) async {
    var snapShot = await _fireBaseServices.getData(email: email);
    try {
      snapShot.listen(
        (event) {
          favProducts.clear();
          for (var doc in event.docs) {
            favProducts.add(ProductEntity.fromJson(doc));
          }
          emit(SuccessGetData());
        },
      );

    } catch (e) {
      emit(FailureGetData());
    }
  }

  //..................................................................................
  Future<void> deleteData({required String email, required num id}) async {
    try {
      _fireBaseServices.deleteUsingFieldValue(email: email, id: id);
      emit(SuccessDeleted());
    } catch (e) {
      emit(FailureDeleted());
    }
  }
}
