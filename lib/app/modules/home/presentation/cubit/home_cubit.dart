import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_page_flutter/app/modules/home/domain/entities/person_entity.dart';
import 'package:login_page_flutter/app/modules/home/domain/usecases/get_personal_information.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IGetPersonalInformationUseCase getPersonalInformationUseCase;

  HomeCubit(this.getPersonalInformationUseCase) : super(HomeInitial());

  Future<void> getPerson() async {
    if (state is HomeLoading) return;

    emit(HomeLoading());

    final result = await getPersonalInformationUseCase();

    result.fold(
      (success) {
        return emit(
          HomeLoaded(
            person: success,
          ),
        );
      },
      (failure) {
        return emit(HomeError());
      },
    );
  }
}
