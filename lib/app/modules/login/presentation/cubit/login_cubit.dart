import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_page_flutter/app/modules/login/domain/dto/login_dto.dart';
import 'package:login_page_flutter/app/modules/login/domain/usecases/login_usecase.dart';

import '../../domain/entites/user_entity.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ILoginUserUseCase loginUserUseCase;

  LoginCubit({
    required this.loginUserUseCase,
  }) : super(LoginInitial());

  Future<void> login(UserEntity user) async {
    if (state is LoginLoading) return;

    emit(LoginLoading());

    final dto = LoginDTO(user: user);
    final result = await loginUserUseCase(dto);

    result.fold(
      (success) {
        emit(LoginLoaded(isAuth: success));
      },
      (failure) {
        return emit(LoginError());
      },
    );
  }
}
