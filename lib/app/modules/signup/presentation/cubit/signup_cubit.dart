import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/dto/Signup_dto.dart';
import '../../domain/entites/user_entity.dart';
import '../../domain/usecases/store_user_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final IStoreUserUseCase storeUserUseCase;

  SignupCubit({
    required this.storeUserUseCase,
  }) : super(SignupInitial());

  Future<void> storeUser(UserEntity user) async {
    if (state is SignupLoading) return;

    emit(SignupLoading());

    final dto = SignupDTO(user: user);
    final result = await storeUserUseCase(dto);

    result.fold(
      (success) {
        emit(SignupStored());
      },
      (failure) {
        return emit(SignupError());
      },
    );
  }
}
