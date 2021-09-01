import 'package:app/dashboard/models/breed.dart';

class AllBreeds {
  static List<Breed> allBreeds = [];

  AllBreeds.fromJson(Map<String, dynamic> map) {
    List<String> breeds = map.keys.toList();
    breeds.forEach((breed) {
      allBreeds.add(Breed(name: breed, subs: map[breed]));
    });
  }
}
