// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_design/blocs/date_anim/date_anim_bloc.dart';
import 'package:random_design/blocs/img_to_colorsbloc/img_to_color_bloc.dart';
import 'package:random_design/module/img_to_color_module.dart';
import 'package:random_design/lon_kat.dart';
import 'package:random_design/select_date.dart';

class MockSelectedDateBlock extends MockBloc<DateAnimState>
    implements DateAnimBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('convert image to color', () {
    test('test colorPalet expect blue ', () async {
      final colorToImg =
          await GetImageColor.getImagePalette(AssetImage("assets/red.png"));

      expect(colorToImg, Color(0xff900000));
    });
  });

  group('real test widget on selectdate', () {
    DateAnimBloc selectedDateBlock;
    setUp(() {
      selectedDateBlock = MockSelectedDateBlock();
    });

    testWidgets('should render properly', (WidgetTester tester) async {
      when(selectedDateBlock.state).thenAnswer((_) => DateSelected('Today'));

      await tester.pumpWidget(
        BlocProvider.value(
          value: selectedDateBlock,
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(),
              body: SelectDateScreen(date: 'Today'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final findtextWidget = find.byKey(Key('selectTextWidget'));
      await tester.tap(findtextWidget);
      expect(findtextWidget, findsOneWidget);
    });

    testWidgets('verify text widget clickabel', (WidgetTester tester) async {
      when(selectedDateBlock.state).thenAnswer((_) => DateSelected('Today'));
      when(selectedDateBlock.add(SelectedDate(date: 'Today')))
          .thenReturn(DateSelected('Today'));
      await tester.pumpWidget(
        BlocProvider.value(
          value: selectedDateBlock,
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(),
              body: SelectDateScreen(
                date: 'Today',
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      final findtextWidget = find.byKey(Key('selectTextWidget'));
      await tester.tap(findtextWidget);
      expect(findtextWidget, findsOneWidget);

      verify(selectedDateBlock.add(SelectedDate(date: 'Today'))).called(1);
    });

    testWidgets(
        'verify test intial state color is txtColor: black and bgColor: grey',
        (WidgetTester tester) async {
      when(selectedDateBlock.state).thenReturn(DateAnimInitial());
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<DateAnimBloc>.value(value: selectedDateBlock),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: SelectDateScreen(
              date: 'Today',
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();

      final findtextWidget = find.byKey(Key('selectTextWidget'));
      expect(findtextWidget, findsOneWidget);
      expect(((tester.firstWidget(find.text('Today')) as Text).style).color,
          Colors.black);
      expect(
          ((tester.firstWidget(find.byType(AnimatedContainer))
                      as AnimatedContainer)
                  .decoration as BoxDecoration)
              .color,
          Colors.grey[300]);
    });

    testWidgets(
        'expect when test clicked txtcolor is white and background color is grey',
        (WidgetTester tester) async {
      when(selectedDateBlock.state).thenAnswer((_) => DateSelected('Today'));
      when(selectedDateBlock.add(SelectedDate(date: 'Today')))
          .thenReturn(DateSelected('Today'));
      await tester.pumpWidget(
        BlocProvider.value(
          value: selectedDateBlock,
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(),
              body: SelectDateScreen(
                date: 'Today',
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      final findtextWidget = find.byKey(Key('selectTextWidget'));
      await tester.tap(findtextWidget);
      expect(findtextWidget, findsOneWidget);
      expect(((tester.firstWidget(find.text('Today')) as Text).style).color,
          Colors.white);
      expect(
          ((tester.firstWidget(find.byType(AnimatedContainer))
                      as AnimatedContainer)
                  .decoration as BoxDecoration)
              .color,
          Colors.orange[300]);
    });
  });
}
