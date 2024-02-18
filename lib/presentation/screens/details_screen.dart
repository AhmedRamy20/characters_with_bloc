import 'package:flutter/material.dart';
import 'package:understand_api/constants/colors.dart';
import 'package:understand_api/data/model/all_characters.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({super.key, required this.character});

  final AllCharacters character;

  Widget buildDiv(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: ColorsProvider.darkblue,
      thickness: 2,
    );
  }

  Widget charactersInformation(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.fade,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: ColorsProvider.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: ColorsProvider.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsProvider.myDarkGray,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 600,
            pinned: true,
            stretch: true,
            backgroundColor: ColorsProvider.myGray,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "${character.name}",
                style: const TextStyle(
                  color: ColorsProvider.myDarkGray,
                ),
              ),
              background: Hero(
                tag: "${character.name}",
                child: Image.network(
                  character.image ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          ////////

          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    charactersInformation(
                        "Species : ", character.species ?? ""),
                    buildDiv(280),
                    charactersInformation(
                        "Character type : ", character.type ?? ""),
                    buildDiv(206),
                    charactersInformation("Sex : ", character.gender ?? ""),
                    buildDiv(320),
                    charactersInformation(
                        "Dead or Alive : ", character.status ?? ""),
                    buildDiv(236),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 500),
            ]),
          ),
        ],
      ),
    );
  }
}
