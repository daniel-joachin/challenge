import 'package:app/dashboard/bloc/dogs_bloc.dart';
import 'package:app/dashboard/models/breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Subs extends StatelessWidget {
  final Breed breed;
  Subs({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.breed.name),
      ),
      body: BlocListener<DogsBloc, DogsState>(
        listener: (context, state) {
          if (state is ImageFetched) {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Image.network(state.imageURL),
                  );
                });
          }
        },
        child: ListView.builder(
            itemCount: this.breed.subBreed.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  onTap: () {
                    BlocProvider.of<DogsBloc>(context).add(
                      FetchImage(
                        subBreed: this.breed.subBreed[index].name,
                        breed: this.breed.name,
                      ),
                    );
                  },
                  title: Text(this.breed.subBreed[index].name),
                ),
              );
            }),
      ),
    );
  }
}
