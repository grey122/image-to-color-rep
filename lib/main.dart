import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_design/blocs/img_to_colorsbloc/img_to_color_bloc.dart';
import 'package:random_design/lon_kat.dart';

import 'blocs/date_anim/date_anim_bloc.dart';
import 'blocs/simple_bloc_delegate.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<DateAnimBloc>(
              create: (context) => DateAnimBloc(),
            ),
            BlocProvider<ImgToColorBloc>(
              create: (context) => ImgToColorBloc(),
            ),
          ],
          child: LonKate(),
        ));
  }
}
