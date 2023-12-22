import 'package:simpsons_character_viewer/ViewModel/character_list_state.dart';
import 'package:simpsons_character_viewer/Widgets/character_tile.dart';
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          case CharacterListCubitFetchingData():
            return const Center(
              child: CircularProgressIndicator(),
            );
          case CharacterListCubitItialized():
            return ListView(
              controller: ScrollController(initialScrollOffset: 66),
              children: [
                SizedBox(
                  height: 66,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                        hintText: 'Search...',
                      ),
                      onChanged: (val) => context
                          .read<CharacterListCubit>()
                          .searchCharacters(input: val),
                    ),
                  ),
                ),
                ...(state.hasSearched
                        ? state.searchCharacters!
                            .map((e) => CharacterTile(character: e))
                        : state.characters
                            .map((e) => CharacterTile(character: e)))
                    .toList()
              ],
            );
          default:
            return const Text('Something went wrong!');
        }
      }),
    );
  }
}
