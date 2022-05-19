import 'package:anime/model/anime_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AnimeService {
  static var client = http.Client();

  static Future<AnimeModel?> fetchAnime() async {
    try {
      final response = await client
          .get(Uri.parse("https://animechan.vercel.app/api/random"));
      if (response.statusCode == 200) {
        final fetchData = response.body;
        return animeModelFromJson(fetchData);
      } else {
        return null;
      }
    } catch (error) {
      Get.snackbar("error", error.toString());
    }

    return null;
  }
}
