// To parse required this JSON data, do
//
//     final animeModel = animeModelFromJson(jsonString);

import 'dart:convert';

AnimeModel animeModelFromJson(String str) => AnimeModel.fromJson(json.decode(str));

String animeModelToJson(AnimeModel data) => json.encode(data.toJson());

class AnimeModel {
    AnimeModel({
        required this.anime,
        required this.character,
        required this.quote,
    });

    String anime;
    String character;
    String quote;

    factory AnimeModel.fromJson(Map<String, dynamic> json) => AnimeModel(
        anime: json["anime"],
        character: json["character"],
        quote: json["quote"],
    );

    Map<String, dynamic> toJson() => {
        "anime": anime,
        "character": character,
        "quote": quote,
    };
}
