// ignore: unused_import
import 'dart:convert';
import 'package:deleateapi/model/delete.model.dart';
import 'package:deleateapi/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit() : super(DeleteIntal(ThreeModel()));
  final HomeRepo homeRepo = HomeRepo();

  void deleteData({int? id}) async {
    emit(DeleteLoading(ThreeModel()));
    // emit(DeleteLoaded(ThreeModel()));
    var response = await homeRepo.deleteData(id);
    response.fold((error) {
      emit(DeleteError(
        error.message,
        ThreeModel(),
      ));
    }, (data) {
      emit(DeleteLoaded(ThreeModel()));
      // ThreeCubit();
    });
  }
}
