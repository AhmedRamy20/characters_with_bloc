import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:understand_api/business_logic/cubit/characters_cubit.dart';
import 'package:understand_api/constants/colors.dart';
import 'package:understand_api/data/model/all_characters.dart';
import 'package:understand_api/presentation/widgets/single_character.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<AllCharacters> allCharactersList;
  List<AllCharacters> filteredCharacters = [];
  bool isSearching = false;

  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget searchFeild() {
    return TextField(
      controller: searchController,
      cursorColor: ColorsProvider.blue,
      decoration: const InputDecoration(
        hintText: "Search a Character",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: ColorsProvider.blue,
          fontSize: 17,
        ),
      ),
      style: const TextStyle(
        color: ColorsProvider.blue,
        fontSize: 19,
      ),
      onChanged: (searchedValue) {
        searchedItemInList(searchedValue);
      },
    );
  }

  void searchedItemInList(String searchedValue) {
    filteredCharacters = allCharactersList
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedValue))
        .toList();
    setState(() {});
  }

  List<Widget> appBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            setState(() {
              searchController.clear();
            });
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.clear,
            size: 29,
            color: ColorsProvider.darkblue,
          ),
        )
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            ModalRoute.of(context)!.addLocalHistoryEntry(
              LocalHistoryEntry(
                onRemove: stopSearch,
              ),
            );
            setState(() {
              isSearching = true;
            });
          },
          icon: const Icon(
            Icons.search,
            size: 29,
            color: ColorsProvider.blue,
          ),
        )
      ];
    }
  }

  void stopSearch() {
    setState(() {
      searchController.clear();
    });
    setState(() {
      isSearching = false;
    });
  }

  Widget buildBlocBuilder() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharactersList = (state).characters;
          return characterGridWidget();
        } else {
          // Show loading indicator while waiting for data to load
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFA9D3E9),
            ),
          );
        }
      },
    );
  }

  Widget characterGridWidget() {
    return SingleChildScrollView(
      child: Container(
        color: ColorsProvider.myDarkGray,
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: searchController.text.isEmpty
                  ? allCharactersList.length
                  : filteredCharacters.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                return SingleCharacter(
                    character: searchController.text.isEmpty
                        ? allCharactersList[index]
                        : filteredCharacters[index]);
              },
            ),
            if (searchController.text.isNotEmpty && filteredCharacters.isEmpty)
              SizedBox(
                height: 670,
                child: Center(
                  child: Text(
                    "There is No Name Start With '${searchController.text}' In Rick Show :(",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: ColorsProvider.myWhite,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget appBarTitle() {
    return const Text('Rick Show');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsProvider.myWhite,
      appBar: AppBar(
        backgroundColor: ColorsProvider.myGray,
        title: isSearching ? searchFeild() : appBarTitle(),
        leading:
            isSearching ? const BackButton(color: Colors.black) : Container(),
        actions: appBarActions(),
      ),
      body: buildBlocBuilder(),
    );
  }
}
