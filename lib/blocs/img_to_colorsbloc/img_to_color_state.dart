part of 'img_to_color_bloc.dart';

abstract class ImgToColorState extends Equatable {
  const ImgToColorState();

  @override
  List<Object> get props => [];
}

class ImgToColorInitial extends ImgToColorState {}

class ImgToColorLoaded extends ImgToColorState {
  final List<Color> colors;

  ImgToColorLoaded(this.colors);

  @override
  List<Object> get props => [colors];

  @override
  String toString() => 'imgTColorLoaded { color: $colors }';
}
