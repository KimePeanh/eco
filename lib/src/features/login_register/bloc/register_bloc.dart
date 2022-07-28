import 'package:bloc/bloc.dart';
import 'package:eco/src/features/login_register/repository/register_repository.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());
  RegisterRepository registerRepository = RegisterRepository();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterPress) {
      yield Loading();
      try {
        await registerRepository.Register(
            email: event.email,
            password: event.password,
            username: event.username);
        yield Success();
      } catch (e) {
        print(e.toString());
        yield Error(e: e.toString());
      }
    }
  }
}
