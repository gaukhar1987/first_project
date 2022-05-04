part of 'regis_bloc.dart';

@immutable
abstract class RegisEvent {}

class RegisPressed extends RegisEvent {
final String? email;
final String? nickname;
final String? phone;
final String? password;

RegisPressed({
  required this.email,
  required this.nickname,
  required this.phone,
  required this.password,
});
}

