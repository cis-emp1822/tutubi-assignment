import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tutubi_assignment/models/covered_space.dart';

part 'screen1_state.dart';

class Screen1Cubit extends Cubit<Screen1State> {
  Screen1Cubit() : super(Screen1Initial());
  List<CoveredSpace> lockedSpace = [];
  void acquireSpace(
      {bool circle = false,
      bool square = false,
      @required double? maxX,
      @required double? maxY}) {
    if (!square && !circle) {
      if (lockedSpace.isEmpty) {
        emit(Screen1Initial());
      } else {
        lockedSpace.removeLast();
        emit(Screen1ShapePosition(shapeList: lockedSpace));
      }
      return;
    }
    bool isCovered = true;
    CoveredSpace spaceAvailable =
        CoveredSpace(shape: circle ? Shape.circle : Shape.square);
    while (isCovered) {
      spaceAvailable.xPoint1 =
          Random().nextInt((maxX! - 50).toInt()).toDouble();
      spaceAvailable.yPoint1 =
          Random().nextInt((maxY! - 50).toInt()).toDouble();
      spaceAvailable.xPoint2 = spaceAvailable.xPoint1! + 50;
      spaceAvailable.yPoint2 = spaceAvailable.yPoint1! + 50;
      if (lockedSpace.isEmpty) {
        isCovered = false;
        lockedSpace.add(spaceAvailable);
      } else {
        bool yesItOverlaps = false;
        for (var i in lockedSpace) {
          if (doOverlap(
            Point(spaceAvailable.xPoint1!, spaceAvailable.yPoint1!),
            Point(spaceAvailable.xPoint2!, spaceAvailable.yPoint2!),
            Point(i.xPoint1!, i.yPoint1!),
            Point(i.xPoint2!, i.yPoint2!),
          )) {
            yesItOverlaps = true;
          }
        }
        if (!yesItOverlaps) {
          isCovered = false;
          lockedSpace.add(spaceAvailable);
        }
      }
    }
    if (square || circle) {
      emit(Screen1ShapePosition(shapeList: lockedSpace));
    }
  }

  bool doOverlap(Point l1, Point r1, Point l2, Point r2) {
    // To check if either rectangle is actually a line
    // For example :  l1 ={-1,0}  r1={1,1}  l2={0,-1}
    // r2={0,1}

    if (l1.x == r1.x || l1.y == r1.y || l2.x == r2.x || l2.y == r2.y) {
      // the line cannot have positive overlap
      return false;
    }

    // If one rectangle is on left side of other
    if (l1.x >= r2.x || l2.x >= r1.x) {
      return false;
    }
    // If one rectangle is above other
    if (r1.y >= l2.y || r2.y >= l1.y) {
      return false;
    }

    return true;
  }
}
