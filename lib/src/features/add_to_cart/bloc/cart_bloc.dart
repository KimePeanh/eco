import 'package:bloc/bloc.dart';
import 'package:eco/src/features/add_to_cart/repository/cart_repository.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial());
  CartRepository cartRepository = CartRepository();
  int? sizeindex;

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is choosesize) {
      yield Choosingsize();
      try {
        sizeindex = await cartRepository.choosesize(
            size: event.size, index: event.index);
        yield Choosedsize();
      } catch (e) {
        yield Errorhoosingsize();
      }
    }

    if (event is AddtoCartPress) {
      yield Adding();
      try {
        await cartRepository.AddtoCart(
            color: event.color, size: event.size, qty: event.qty);
        yield Added();
      } catch (e) {
        yield ErrorAdd(e: e.toString());
      }
    }
  }
}
