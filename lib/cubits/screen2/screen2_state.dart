part of '../screen2/screen2_cubit.dart';

@immutable
abstract class Screen2State {}

class Screen2Initial extends Screen2State {}

class Screen2Loading extends Screen2State {}

class Screen2Loaded extends Screen2State {
  final List<String>? strings;
  Screen2Loaded({this.strings});
}

class Screen2Error extends Screen2State {
  final String? errorMessage;
  Screen2Error({this.errorMessage});
}
