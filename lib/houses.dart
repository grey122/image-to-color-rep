import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/img_to_colorsbloc/img_to_color_bloc.dart';

class Houses extends StatefulWidget {
  final String houseType;
  final String housePrice;
  final String houseImage;
  final int index;

  const Houses(
      {Key key, this.houseType, this.housePrice, this.houseImage, this.index})
      : super(key: key);

  @override
  _HousesState createState() => _HousesState();
}

class _HousesState extends State<Houses> {
  ImgToColorBloc imgToColor;
  @override
  void initState() {
    imgToColor = BlocProvider.of<ImgToColorBloc>(context);
    imgToColor.add(LoadedColor(widget.houseImage));
    super.initState();
  }

  @override
  void dispose() {
    imgToColor?.close();
    super.dispose();
  }

  @override
  void didUpdateWidget(Houses oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('please dont loop');
    return BlocBuilder<ImgToColorBloc, ImgToColorState>(
      builder: (context, state) {
        if (state is ImgToColorInitial) {
          return _loading();
        } else if (state is ImgToColorLoaded) {
          print(state.colors[widget.index]);
          return house(widget.houseType, widget.housePrice, widget.houseImage,
              state.colors[widget.index]);
        }

        return Container();
      },
    );
  }

  Widget house(
    String houseType,
    String housePrice,
    String houseImage,
    Color color,
  ) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0, bottom: 15.0),
      child: Container(
        width: 380.0,
        height: 230.0,
        //color: Colors.blue,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: color,
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    houseType ?? 'A-frame',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    housePrice ?? '80\$ -120\$',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loading() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, right: 10.0),
      child: Container(
        width: 380.0,
        height: 230.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(150, 80, 150, 80),
          child: CircularProgressIndicator(
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
