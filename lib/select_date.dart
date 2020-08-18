import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_design/blocs/date_anim/date_anim_bloc.dart';

class Dates extends StatelessWidget {
  final Color bgColor;
  final Color txtColor;
  final String date;

  const Dates({Key key, this.bgColor, this.txtColor, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animDate = BlocProvider.of<DateAnimBloc>(context);
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
      child: AnimatedContainer(
        key: Key('animated'),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        height: 50.0,
        width: date.length > 2 ? 70.0 : 40.0,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: bgColor),
        child: GestureDetector(
          key: Key('gesture_animate'),
          onTap: () => animDate.add(SelectedDate(date: date)),
          child: Center(
            child: Text(
              date ?? '16',
              key: Key('selectTextWidget'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: txtColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectDateScreen extends StatelessWidget {
  final String date;

  SelectDateScreen({Key key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateAnimBloc, DateAnimState>(
      builder: (context, state) {
        if (state is DateAnimInitial) {
          return Dates(
            bgColor: Colors.grey[300],
            txtColor: Colors.black,
            date: date,
          );
        } else if (state is DateSelected) {
          if (state.date == date) {
            return Dates(
              bgColor: Colors.orange[300],
              txtColor: Colors.white,
              date: date,
            );
          } else {
            return Dates(
              bgColor: Colors.grey[300],
              txtColor: Colors.black,
              date: date,
            );
          }
        }
        return Container();
      },
    );
  }
}
