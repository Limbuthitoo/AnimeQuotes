import 'package:anime/model/anime_model.dart';
import 'package:anime/services/animeservice.dart';
import 'package:get/get.dart';

class AnimeController extends GetxController {
  var anime = AnimeModel(anime: "", character: "", quote: "").obs;

  var isLoading = true.obs;

  Future getAnime() async {
    try {
      isLoading(true);
      var animeData = await AnimeService.fetchAnime();
      if (animeData != null) {
        anime.value = animeData;
      }
    } catch (error) {
      Get.snackbar("error", error.toString());
    }
    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAnime();
  }
}
