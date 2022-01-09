import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tutubi_assignment/repositories/apis_here.dart';

part 'screen2_state.dart';

class Screen2Cubit extends Cubit<Screen2State> {
  Screen2Cubit() : super(Screen2Initial());

  fetchPhotos() async {
    emit(Screen2Loading());
    Stream<List<String>> photos = await ApisHere().getPhotos();
    photos.listen((event) {
      emit(Screen2Loaded(strings: event));
    }, onError: (error) {
      emit(Screen2Error(errorMessage: error.toString()));
    });
  }
}
