part of 'regis_bloc.dart';

@immutable
abstract class RegisState {}

class RegisInitial extends RegisState {}

class RegisLoading extends RegisState {}

class Regisloaded extends RegisState {}

class RegisFailed extends RegisState {
  final String? message;

  RegisFailed({required this.message});
}