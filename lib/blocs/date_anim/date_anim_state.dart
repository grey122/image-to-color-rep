part of 'date_anim_bloc.dart';

@immutable
abstract class DateAnimState extends Equatable {
  @override
  List<Object> get props => [];
}

class DateAnimInitial extends DateAnimState {}

class DateSelected extends DateAnimState {
  final String date;

  DateSelected(this.date);

  @override
  List<Object> get props => [date];

  @override
  String toString() => 'DateSelected { date: $date }';
}
