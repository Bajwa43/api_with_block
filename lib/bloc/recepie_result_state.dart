part of 'recepie_result_bloc.dart';

@immutable
sealed class RecepieResultState {}

final class RecepieResultInitial extends RecepieResultState {}

final class RecepieResultLoading extends RecepieResultState {}

final class RecepieResultLoaded extends RecepieResultState {
  final List<Recepie> list;
  RecepieResultLoaded({required this.list});
}

final class RecepieResultError extends RecepieResultState {
  final String error;
  RecepieResultError({required this.error});
}
