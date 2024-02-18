import 'package:flutter/material.dart';
import 'package:understand_api/Router/routes.dart';
import 'package:understand_api/constants/colors.dart';
import 'package:understand_api/data/model/all_characters.dart';

class SingleCharacter extends StatelessWidget {
  const SingleCharacter({super.key, required this.character});

  final AllCharacters character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: ColorsProvider.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(Routes.charactersDetailsScreen, arguments: character);
        },
        child: GridTile(
          child: Hero(
            tag: "${character.name}",
            child: Container(
              color: ColorsProvider.myWhite,
              child: character.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      image: character.image.toString())
                  : Image.asset('assets/images/palestine.jpg'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.name.toString(),
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: ColorsProvider.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
