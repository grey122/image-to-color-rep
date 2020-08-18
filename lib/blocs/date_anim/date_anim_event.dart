part of 'date_anim_bloc.dart';

@immutable
abstract class DateAnimEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SelectedDate extends DateAnimEvent {
  final String date;

  SelectedDate({this.date});

  @override
  List<Object> get props => [date];

  @override
  String toString() => 'selectedDate { date: $date }';
}
