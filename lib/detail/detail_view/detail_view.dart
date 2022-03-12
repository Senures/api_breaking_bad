import 'package:breaking_bad_api/detail/detail_controller/detail_controller.dart';
import 'package:breaking_bad_api/widgets/loading_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/src/GlassWidget.dart';

// ignore: must_be_immutable
class DetailView extends StatelessWidget {
  final int characterId;

  DetailView({Key? key, required this.characterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        init: DetailController(characterid: characterId),
        builder: (dc) {
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                  leading: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ).asGlass(
                      tintColor: Colors.transparent,
                    ),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent),
              body: dc.isloading
                  ? Center(
                      child: CustomCircular(color: const Color(0xffddcb93)))
                  : Container(
                      width: Get.size.width,
                      height: Get.size.height,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Hero(
                            tag: dc.characterid,
                            child: Image.network(
                              dc.character!.img!,
                              fit: BoxFit.cover,
                            ),
                          )),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                child: Container(
                                  width: Get.size.width,
                                  height: Get.size.height * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30.0, top: 15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              dc.character!.nickname.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0),
                                            ),
                                            Text(
                                              dc.character!.category.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.0),
                                            ),
                                          ],
                                        ),
                                        const Divider(
                                            endIndent: 30.0,
                                            color: Color(0xffddcb93)),
                                        const Text(
                                          "Occupation",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0),
                                        ),
                                        SizedBox(
                                          width: Get.size.width,
                                          height: 50.0,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: dc.character!
                                                  .occupation!.length,
                                              itemBuilder: (context, indeks) {
                                                var item = dc.character!
                                                    .occupation![indeks];

                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Chip(
                                                      backgroundColor:
                                                          const Color(
                                                              0xffddcb93),
                                                      label: Text(item,
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xff503829)))),
                                                );
                                              }),
                                        ),
                                        const Text(
                                          "Appearance",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0),
                                        ),
                                        SizedBox(
                                          width: Get.size.width,
                                          height: 30.0,
                                          // color: Colors.amber,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: dc.character!
                                                  .appearance!.length,
                                              itemBuilder: (context, i) {
                                                var item = dc
                                                    .character!.appearance![i];
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0),
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 30.0,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xffddcb93))),
                                                      child: Text(
                                                        item.toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                                );
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ).asGlass(
                                    frosted: false,
                                    tintColor: Colors.transparent,
                                    clipBorderRadius:
                                        BorderRadius.circular(20.0))),
                          ),
                        ],
                      ),
                    ));
        });
  }
}
