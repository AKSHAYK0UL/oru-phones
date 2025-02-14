part of 'faqs_bloc.dart';

sealed class FaqsState {}

final class FaqsInitial extends FaqsState {}

final class FaqsLoadingState extends FaqsState {
  final FaqsENUM laodingSource;
  FaqsLoadingState({required this.laodingSource});
}

class FaqsErrorState extends FaqsState {
  final String errorMessage;
  final FaqsENUM errorSource;
  FaqsErrorState({required this.errorMessage, required this.errorSource});
}

final class FaqsDataState extends FaqsState {
  List<FAQ> faqs;
  final FaqsENUM dataSource;
  FaqsDataState({required this.faqs, required this.dataSource});
}
