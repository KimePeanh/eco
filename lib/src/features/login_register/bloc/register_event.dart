part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterPress extends RegisterEvent{
  final String username;
  final String email;
  final String password;

  RegisterPress({required this.username, required this.email, required this.password});
}