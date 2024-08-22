import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopnew/data/model/cart.dart';
import 'package:shopnew/data/repo/cart_repo.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository _cartRepository;

  CartBloc(this._cartRepository) : super(CartInitialState()) {
    on<CartEvent>((event, emit) async {
      try {
        if (event is CartInitEvent) {
          final userCart = await _cartRepository.getUserCart();
          emit(CartLoadedState(userCart));
        } else if (event is RemoveFromCartEvent) {
          await _cartRepository
              .removeFromCart(productId: event.productId)
              .then((value) => emit(CartItemRemovedState(value)));
        } else if (event is DeleteFromCartEvent) {
          await _cartRepository
              .deletFromCart(productId: event.productId)
              .then((value) => emit(CartItemDeleteState(value)));
        } else if (event is AddToCartEvent) {
          await _cartRepository
              .addToCart(productId: event.productId)
              .then((value) => emit(CartItemAddedState(value)));
        } else if (event is CartItemCountEvent) {
          await _cartRepository
              .countCartItems()
              .then((value) => emit(CartItemCountState()));
        } else if (event is PayEvent) {
          await _cartRepository.payCart().then(
              (value) => emit(RecivedPaymentState(url: value.toString())));
        }
      } catch (e) {
        emit(CartErrorState());
      }
    });
  }
}
