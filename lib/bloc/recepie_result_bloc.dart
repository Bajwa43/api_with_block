import 'package:api_with_block/Api_provider/food_api.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '../Model/foodResultModel.dart';

part 'recepie_result_event.dart';
part 'recepie_result_state.dart';

class RecepieResultBloc extends Bloc<RecepieResultEvent, RecepieResultState> {
  RecepieResultBloc() : super(RecepieResultInitial()) {
    RecepieApiProvider apiProvider = RecepieApiProvider();

    on<RecepieResultEvent>((event, emit) async {
      emit(RecepieResultLoading());
      print('.....');
      List<Recepie> recepieList = await apiProvider.fetchRecepies();

      print(recepieList);

      try {
        emit(RecepieResultLoaded(list: recepieList));
      } catch (e) {
        emit(RecepieResultError(error: e.toString()));
      }
    });
  }
}
