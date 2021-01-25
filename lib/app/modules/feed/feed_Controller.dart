import 'package:get/get.dart';
import 'package:mesa_news_app/app/data/models/news_high_light_model.dart';
import 'package:mesa_news_app/app/data/models/news_model.dart';
import 'package:mesa_news_app/app/modules/login/login_controller.dart';
import 'package:mesa_news_app/app/services/providers/no_connection.dart';
import 'package:mesa_news_app/app/services/repositories/news_repository.dart';

class FeedController extends GetxController {
  LoginController loginController = Get.find();

  FeedController(this._repository);
  @override
  void onInit() async {
    await getNewsHighLight();
    await getNews();
    super.onInit();
  }

  final NewsRepository _repository;

  final newsHighlights = NewsHighLightModel().obs;
  Future<void> getNewsHighLight() async {
    final result = await _repository.getNewsHighlights();
    newsHighlights.value = result;
    print('news highlights oks');
  }

  final news = NewsModel().obs;
  Future<void> getNews() async {
    final result = await _repository.getNews();
    news.value = result;
    print('news oks');
  }
}
