part of 'home_cubit.dart';

abstract class HomeState extends Equatable {}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeLoaded extends HomeState {
  final PersonEntity person;

  HomeLoaded({required this.person});
  @override
  List<Object> get props => [person];
}

final class HomeError extends HomeState {
  @override
  List<Object> get props => [];
}
