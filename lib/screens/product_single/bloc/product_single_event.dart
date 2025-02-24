part of 'product_single_bloc.dart';

sealed class ProductSingleEvent extends Equatable {
  const ProductSingleEvent();

  @override
  List<Object> get props => [];
}

class ProductSingleInit extends ProductSingleEvent {
  // ignore: prefer_typing_uninitialized_variables
  final id;

  const ProductSingleInit({required this.id});
}
