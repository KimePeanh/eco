part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginPress extends LoginEvent{
  final String email;
  final String password;
  LoginPress({required this.email, required this.password});
}