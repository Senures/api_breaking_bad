import 'package:breaking_bad_api/detail/detail_view/detail_view.dart';
import 'package:breaking_bad_api/home/home_controller/home_controller.dart';
import 'package:breaking_bad_api/widgets/loading_widgets.dart';
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
                  ? Center(child: CustomCircular(color: Colors.white))
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
                      : buildBodyList());
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

buildBodyList() {
  var hc = Get.put(HomeController());
  return ParallaxArea(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: Get.size.width,
                      height: 200.0,
                      child: Stack(
                        children: [
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                item.name!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ))
                        ],
                      )),
                ),
                overflowWidthFactor: 1,
                background: Image.network(item.img!, fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomCircular(
                          color: Colors.white,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            loadingProgress.expectedTotalBytes != null
                                ? ((loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress
                                                .expectedTotalBytes!) *
                                        100)
                                    .toStringAsFixed(0)
                                : "",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ));
        }),
  );
}
