part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}


class Loading extends LoginState{}

class Success extends LoginState{}

class Error extends LoginState{
  final String e;
  Error({required this.e});
}