part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class Choosing extends CartState {}

class Choosed extends CartState {}

class Error extends CartState {}

class Choosingsize extends CartState {}

class Choosedsize extends CartState {}

class Errorhoosingsize extends CartState {}

class Adding extends CartState {}

class Added extends CartState {}

class ErrorAdd extends CartState {
  final String e;
  ErrorAdd({required this.e});
}
