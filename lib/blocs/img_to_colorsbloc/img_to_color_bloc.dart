import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_design/module/img_to_color_module.dart';

part 'img_to_color_event.dart';
part 'img_to_color_state.dart';

class ImgToColorBloc extends Bloc<ImgToColorEvent, ImgToColorState> {
  final List<Color> colors = [];

  ImgToColorBloc() : super(ImgToColorInitial());

  @override
  Stream<ImgToColorState> mapEventToState(
    ImgToColorEvent event,
  ) async* {
    if (event is LoadedColor) {
      yield* _mapAddImageToState(event);
    }
  }

  Stream<ImgToColorState> _mapAddImageToState(LoadedColor event) async* {
    yield ImgToColorInitial();

    Color color = await GetImageColor.getImagePalette(AssetImage(event.image));

    colors.add(color);
    print(colors.length);

    yield ImgToColorLoaded(colors);
  }
}
