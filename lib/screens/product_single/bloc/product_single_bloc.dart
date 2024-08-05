import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopnew/data/model/product_details.dart';
import 'package:shopnew/data/repo/product_repo.dart';

part 'product_single_event.dart';
part 'product_single_state.dart';

class ProductSingleBloc extends Bloc<ProductSingleEvent, ProductSingleState> {
  final IProductRepository iProductRepository;

  ProductSingleBloc(this.iProductRepository) : super(ProductSingleLoading()) {
    on<ProductSingleEvent>((event, emit) async {
      if (event is ProductSingleInit) {
        try {
          emit(ProductSingleLoading());
          final productDetails =
              await iProductRepository.getProductDetails(event.id);
          emit(ProductSingleLoaded(productDetails));
        } catch (e) {
          emit(ProductSingleError());
        }
      }
    });
  }
}
