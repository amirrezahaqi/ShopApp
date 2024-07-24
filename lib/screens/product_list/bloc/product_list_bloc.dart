import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopnew/data/model/product.dart';
import 'package:shopnew/data/repo/product_repo.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final IProductRepository _iProductRepository;

  ProductListBloc(this._iProductRepository) : super(ProductListLoading()) {
    on<ProductListEvent>((event, emit) async {
      if (event is ProductListInit) {
        try {
          emit(ProductListLoading());
          final productList =
              await _iProductRepository.getAllByCategory(event.param);
          emit(ProductListLoaded(productList: productList));
        } catch (e) {
          emit(ProductListError());
        }
      }
    });
  }
}
