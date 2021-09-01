import 'dart:async';

import 'package:app/dashboard/repository/dogs.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dogs_event.dart';
part 'dogs_state.dart';

class DogsBloc extends Bloc<DogsEvent, DogsState> {
  DogsBloc() : super(DogsInitial());

  @override
  Stream<DogsState> mapEventToState(
    DogsEvent event,
  ) async* {
    if (event is Fetch) {
      await Dogs.getBreeds();
      yield DoneFetch();
    }
    if (event is FetchImage) {
      String imageUrl =
          await Dogs.getImage(subBreed: event.subBreed, breed: event.breed);

      yield ImageFetched(imageURL: imageUrl);
    }
  }
}
