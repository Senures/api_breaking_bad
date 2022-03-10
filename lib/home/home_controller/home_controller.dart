import 'package:breaking_bad_api/entity/api_model.dart';
import 'package:breaking_bad_api/home/home_service/home_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var controller = TextEditingController();
  bool isloading = true;
  List<Model>? homelist = [];

  @override
  void onInit() {
    homeApiGet();
    super.onInit();
  }

  setIsLoading(bool b) {
    isloading = b;
    update();
  }

  homeApiGet() async {
    setIsLoading(true);
    homelist = await HomeService().fetchHomeApi();
    setIsLoading(false);
  }

  searchApiGet() async {
    setIsLoading(true);
    homelist = await HomeService().fetchSearch(controller.text);
    setIsLoading(false);
  }
}
