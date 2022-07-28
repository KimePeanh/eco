
part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class Loading extends RegisterState{}

class Success extends RegisterState{}

class Error extends RegisterState{
  final String e;
  Error({required this.e});
}