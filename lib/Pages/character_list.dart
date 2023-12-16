import 'package:anywhere_exercise/ViewModel/character_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Characters'),
      ),
      body: BlocBuilder<CharacterListCubit, CharacterListState>(
          builder: (context, state) {
        switch (state) {
          case CharacterListCubitUnitialized():
            context.read<CharacterListCubit>().fetchCharacters();
            return Container();
          case CharacterListCubitFetchingData():
            return const Center(
              child: CircularProgressIndicator(),
            );
          case CharacterListCubitItialized():
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) => Text(state.characters[index].name),
            );
          default:
            return const Text('Something went wrong!');
        }
      }),
    );
  }
}
