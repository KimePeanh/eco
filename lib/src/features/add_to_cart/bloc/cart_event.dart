part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddtoCartPress extends CartEvent {
  final String color;
  final String size;
  final int qty;

  AddtoCartPress({required this.color, required this.size, required this.qty});
}

class choosesize extends CartEvent {
  final String size;
  final int index;
  choosesize({required this.size, required this.index});
}
