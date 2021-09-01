import 'package:app/dashboard/models/subBreed.dart';

class Breed {
  String name;
  List<SubBreed> subBreed = [];

  Breed({required this.name, required List<dynamic> subs}) {
    subs.forEach((element) {
      subBreed.add(SubBreed(name: element));
    });
  }
}
