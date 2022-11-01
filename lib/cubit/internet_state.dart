part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}
class InternetConnectedState extends InternetState {
  final String message;

  InternetConnectedState({required this.message});
}
class InternetNotConnectedState extends InternetState {
  final String message;

  InternetNotConnectedState({required this.message});
}