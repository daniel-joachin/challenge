import 'package:app/dashboard/bloc/dogs_bloc.dart';
import 'package:app/dashboard/models/allBreeds.dart';
import 'package:app/dashboard/views/subs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dogs'),
      ),
      body: BlocBuilder<DogsBloc, DogsState>(
        builder: (context, state) {
          return Container(
            child: ListView.builder(
              itemCount: AllBreeds.allBreeds.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              Subs(breed: AllBreeds.allBreeds[index]),
                        ),
                      );
                    },
                    title: Text(AllBreeds.allBreeds[index].name),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
