import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/auth_remote_datasources.dart';
import '../../data/models/auth_response_model.dart';
import '../../data/models/request/login_request_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(_Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      print("login loading");
      final result = await AuthRemoteDatasource().login(event.model);
      result.fold(
        (l) => emit(_Error(l)),
        (r) {
          print("login berhasil");
          emit(_Loaded(r));
        },
      );
    });
  }
}
