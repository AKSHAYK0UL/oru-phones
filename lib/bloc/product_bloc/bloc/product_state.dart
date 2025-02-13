part of 'product_bloc.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProdLoadingState extends ProductState {
  final ProdENUM laodingSource;
  ProdLoadingState({required this.laodingSource});
}

class ProdErrorState extends ProductState {
  final String errorMessage;
  final ProdENUM errorSource;
  ProdErrorState({required this.errorMessage, required this.errorSource});
}

class ProdDatState extends ProductState {
  Product prod;
  final ProdENUM dataSoure;
  ProdDatState({required this.prod, required this.dataSoure});
}

final class ProdSuccessState extends ProductState {}
