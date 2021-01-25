import 'package:get/get.dart';
import 'package:mesa_news_app/app/data/models/news_high_light_model.dart';
import 'package:mesa_news_app/app/modules/login/login_controller.dart';
import 'package:mesa_news_app/app/services/repositories/news_repository.dart';

class FeedController extends GetxController {
  LoginController loginController = Get.find();

  FeedController(this._repository);
  @override
  void onInit() async {
    await getNewsHighLight();
    super.onInit();
  }

  final NewsRepository _repository;

  final newsHighlights = NewsHighLightModel().obs;
  Future<void> getNewsHighLight() async {
    final result = await _repository.getNewsHighlights(loginController.userToken.value);
    newsHighlights.value = result;
    print('news highlights oks');
  }
}
