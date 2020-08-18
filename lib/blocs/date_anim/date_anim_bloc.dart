import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'date_anim_event.dart';
part 'date_anim_state.dart';

class DateAnimBloc extends Bloc<DateAnimEvent, DateAnimState> {
  String selectdate;
  DateAnimBloc({this.selectdate}) : super(DateAnimInitial());

  @override
  Stream<DateAnimState> mapEventToState(
    DateAnimEvent event,
  ) async* {
    if (event is SelectedDate) {
      yield DateSelected(event.date);
    } else {
      yield DateAnimInitial();
    }
  }
}
