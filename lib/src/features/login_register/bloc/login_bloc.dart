import 'package:bloc/bloc.dart';
import 'package:eco/src/features/login_register/repository/login_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());
  LoginRepository loginRepository = LoginRepository();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginPress) {
      yield Loading();
      try {
        await loginRepository.Login(
            email: event.email, password: event.password);
        yield Success();
      } catch (e) {
        yield Error(e: e.toString());
      }
    }
  }
}
