import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_design/blocs/img_to_colorsbloc/img_to_color_bloc.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('img to color bloc', () {
    ImgToColorBloc imgToColorBloc;
    setUp(() {
      imgToColorBloc = ImgToColorBloc();
    });
    blocTest(
      'emit img intial and imgtocolor loaded when succesful ',
      build: () => imgToColorBloc,
      act: (bloc) async => imgToColorBloc.add(LoadedColor("assets/red.png")),
      expect: [
        ImgToColorInitial(),
        ImgToColorLoaded([Color(0xff900000)]),
      ],
    );
  });
}
