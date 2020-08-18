part of 'img_to_color_bloc.dart';

abstract class ImgToColorEvent extends Equatable {
  const ImgToColorEvent();

  @override
  List<Object> get props => [];
}

class LoadedColor extends ImgToColorEvent {
  final String image;

  LoadedColor(this.image);

  @override
  List<Object> get props => [image];

  @override
  String toString() => 'loadedColor { date: $image }';
}
