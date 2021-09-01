part of 'dogs_bloc.dart';

@immutable
abstract class DogsState {}

class DogsInitial extends DogsState {}

class DoneFetch extends DogsState {}

class ImageFetched extends DogsState {
  String imageURL;

  ImageFetched({required this.imageURL});
}
