part of 'dogs_bloc.dart';

@immutable
abstract class DogsEvent {}

class Fetch extends DogsEvent {}

class FetchImage extends DogsEvent {
  String subBreed;
  String breed;

  FetchImage({required this.subBreed, required this.breed});
}
