part of 'favorite_color_bloc.dart';

@immutable
abstract class FavoriteColorEvent {}

class PickColor extends FavoriteColorEvent {
  PickColor({required this.color});
  final String color;
}
