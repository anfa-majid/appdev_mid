import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/api_service.dart';
import 'event.dart';
import 'state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiService apiService;

  ProductBloc({required this.apiService}) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await apiService.fetchProducts();
        emit(ProductLoaded(products: products));
      } catch (e) {
        emit(ProductError(error: e.toString()));
      }
    });
  }
}