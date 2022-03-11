import 'package:breaking_bad_api/detail/detail_view.dart';
import 'package:breaking_bad_api/home/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:parallax_animation/parallax_animation.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (hc) {
          return Scaffold(
            backgroundColor: const Color(0xffddcb93),
            //Color(0xff070808),
            appBar: buildApbbar(),

            body: hc.isloading == true
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : hc.homelist!.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: Get.size.width * 0.8,
                                height: Get.size.height * 0.3,
                                //color: Colors.red,
                                child:
                                    Lottie.asset("assets/search_error.json")),
                            const Text(
                              "No results were found for your search.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.0),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffddcb93),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Back to home",
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      )
                    : ParallaxArea(
                        child: ListView.builder(
                            itemCount: hc.homelist!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              var item = hc.homelist![index];
                              return InkWell(
                                onTap: () {
                                  Get.to(() => DetailView(
                                        characterId: item.charId!,
                                      ));
                                },
                                child: ParallaxWidget(
                                  /*   child: Text("a"),
                                  overflowWidthFactor: 1,
                                  background: Image.network(
                                    item.img!,
                                    fit: BoxFit.contain,
                                  ), */

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: Get.size.width,
                                      height: Get.size.height * 0.2,
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                              child: Hero(
                                            tag: item.charId!,
                                            child: Image.network(
                                              item.img.toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                          Positioned(
                                            bottom: 10.0,
                                            left: 30.0,
                                            right: 30.0,
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: Get.size.width,
                                              height: Get.size.height * 0.08,
                                              child: Text(
                                                item.name.toString(),
                                                style: const TextStyle(
                                                    fontSize: 25.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
          );
        });
  }
}

buildApbbar() {
  var hc = Get.put(HomeController());
  return AppBar(
    elevation: 0.0,
    backgroundColor: const Color(0xffddcb93),
    centerTitle: true,
    title: TextFormField(
      style: const TextStyle(color: Colors.white, fontSize: 17.0),
      cursorColor: Colors.white,
      controller: hc.controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
        hintText: "Search characters",
        hintStyle: const TextStyle(color: Colors.white, fontSize: 17.0),
        border: InputBorder.none,
        suffixIcon: IconButton(
            onPressed: () {
              hc.searchApiGet();
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            )),
      ),
    ),
  );
}
