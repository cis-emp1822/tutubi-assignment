part of 'screen1_cubit.dart';

@immutable
abstract class Screen1State {}

class Screen1Initial extends Screen1State {}

class Screen1ShapePosition extends Screen1State {
  final List<CoveredSpace>? shapeList;
  Screen1ShapePosition({this.shapeList});
}
