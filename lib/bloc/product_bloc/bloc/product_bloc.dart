import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones/core/enum/prodenum.dart';
import 'package:oruphones/model/product/product.dart';
import 'package:oruphones/repository/product_repo/productrepo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo _productRepo;

  ProductBloc(this._productRepo) : super(ProductInitial()) {
    on<FetchProductsEvent>(_fetchProducts);
  }
  Future<void> _fetchProducts(
      FetchProductsEvent event, Emitter<ProductState> emit) async {
    try {
      final data = await _productRepo.fetchProducts();
      emit(ProdDatState(prod: data, dataSoure: ProdENUM.fetchProduct));
    } catch (e) {
      emit(ProdErrorState(
          errorMessage: e.toString(), errorSource: ProdENUM.fetchProduct));
    }
  }
}
