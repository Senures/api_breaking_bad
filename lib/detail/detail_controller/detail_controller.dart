import 'package:breaking_bad_api/detail/detail_service/detail_service.dart';
import 'package:breaking_bad_api/entity/api_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final int characterid;
  bool isloading = true;
  List<Model>? characterlist = [];
  Model? character;
  DetailController({required this.characterid});

  @override
  void onInit() {
    getCharacterDetail();
    super.onInit();
  }

  setIsLoading(bool b) {
    isloading = b;
    update();
  }

  getCharacterDetail() async {
    setIsLoading(true);
    characterlist = await DetailService().getCharacterDetail(characterid);
    character = characterlist![0];
    setIsLoading(false);
  }
}
