import 'package:boo/repo/product_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductLoading());
  ProductRepo productRepo = ProductRepo();
  getProductData()async{
    try{
      final productList = await productRepo.fetchProducts();
      if (productList.isNotEmpty) {
        emit(ProductLoaded(productList));
      } else {
        emit(const ProductError('No products found'));
      }
    }
    on Exception catch(e){
      emit(ProductError(e.toString()));
    }
  }
}
