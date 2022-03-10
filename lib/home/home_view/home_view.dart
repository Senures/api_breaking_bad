import 'package:breaking_bad_api/detail/detail_view.dart';
import 'package:breaking_bad_api/home/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: const Color(0xffddcb93),
              centerTitle: true,
              title: TextFormField(
                style: const TextStyle(color: Colors.white, fontSize: 17.0),
                cursorColor: Colors.white,
                controller: hc.controller,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
                    hintText: "Search characters",
                    hintStyle:
                        const TextStyle(color: Colors.white, fontSize: 17.0),
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                        onPressed: () {
                          hc.searchApiGet();
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))),
              ),
            ),

            body: hc.isloading == true
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : hc.homelist!.isEmpty
                    ? const Center(
                        child: Text(
                          "There were no results",
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
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
                                      id: item.charId, index: index));
                                },
                                child: ParallaxWidget(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: Get.size.width,
                                      height: Get.size.height * 0.2,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 2.0,
                                                spreadRadius: 2.0,
                                                color: Color(0xff503829))
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                item.img.toString(),
                                              ))),
                                      child: Stack(
                                        children: [
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
