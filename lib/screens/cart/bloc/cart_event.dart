part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class CartInitEvent extends CartEvent {}

final class CartItemCountEvent extends CartEvent {}

final class AddToCartEvent extends CartEvent {
  final int productId;

  const AddToCartEvent(this.productId);
  @override
  List<Object> get props => [productId];
}

final class RemoveFromCartEvent extends CartEvent {
  final int productId;

  const RemoveFromCartEvent(this.productId);
  @override
  List<Object> get props => [productId];
}

final class DeleteFromCartEvent extends CartEvent {
  final int productId;

  const DeleteFromCartEvent(this.productId);
  @override
  List<Object> get props => [productId];
}
