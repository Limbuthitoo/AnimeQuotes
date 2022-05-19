import 'package:anime/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var animeCtrl = Get.find<AnimeController>();
    return Scaffold(
      body: Obx(() {
        if (animeCtrl.isLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                width: Get.size.width,
                height: 80,
                color: Colors.black,
                child: Text(
                  "Anime App",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(children: [
                  SizedBox(
                    height: 800,
                    width: Get.size.width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 300,
                                width: Get.size.width,
                                child: Image.network(
                                  "https://m.media-amazon.com/images/M/MV5BODcwNWE3OTMtMDc3MS00NDFjLWE1OTAtNDU3NjgxODMxY2UyXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.black,
                                height: 300,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 250,
                                        child: Column(
                                          children: [
                                            Text(
                                              animeCtrl.anime.value.anime,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              animeCtrl.anime.value.character,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              animeCtrl.anime.value.quote,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      SizedBox(
                                        width: Get.size.width,
                                        height: 70,
                                        child: MaterialButton(
                                          onPressed: () {
                                            animeCtrl.getAnime();
                                          },
                                          child: const Text("Next Quote"),
                                          color: Colors.blue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
          );
        }
      }),
    );
  }
}
