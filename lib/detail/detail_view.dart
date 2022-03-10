import 'package:breaking_bad_api/home/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailView extends StatelessWidget {
  int? id;
  int index;
  DetailView({Key? key, required this.id, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (hc) {
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                  leading: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: const Color(0xffddcb93),
                        ),
                      ),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent),
              body: Container(
                width: Get.size.width,
                height: Get.size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(hc.homelist![index].img!))),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Container(
                          width: Get.size.width,
                          height: Get.size.height * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, top: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      hc.homelist![index].nickname!,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                    Text(
                                      hc.homelist![index].category!,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    ),
                                  ],
                                ),
                                const Divider(
                                    endIndent: 30.0, color: Color(0xffddcb93)),
                                const Text(
                                  "Occupation",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                                SizedBox(
                                  width: Get.size.width,
                                  height: 50.0,
                                  // color: Colors.amber,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: hc
                                          .homelist![index].occupation!.length,
                                      itemBuilder: (context, indeks) {
                                        var item = hc.homelist![index]
                                            .occupation![indeks];
                                        return Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Chip(
                                              backgroundColor:
                                                  const Color(0xffddcb93),
                                              label: Text(item,
                                                  style: const TextStyle(
                                                      color:
                                                          Color(0xff503829)))),
                                        );
                                      }),
                                ),
                                const Text(
                                  "Appearance",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                                SizedBox(
                                  width: Get.size.width,
                                  height: 30.0,
                                  // color: Colors.amber,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: hc
                                          .homelist![index].appearance!.length,
                                      itemBuilder: (context, i) {
                                        var item =
                                            hc.homelist![index].appearance![i];
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Container(
                                              alignment: Alignment.center,
                                              width: 30.0,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffddcb93))),
                                              child: Text(
                                                item.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              )),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
