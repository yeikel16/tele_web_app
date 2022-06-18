import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_color_event.dart';

class FavoriteColorBloc extends Bloc<FavoriteColorEvent, String> {
  FavoriteColorBloc() : super('') {
    on<PickColor>((event, emit) {
      if (event.color.isNotEmpty) {
        emit(event.color);
      }
    });
  }
}
