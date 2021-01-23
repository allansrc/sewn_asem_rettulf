import 'package:get/get.dart';
import 'package:mesa_news_app/app/modules/feed/feed_Controller.dart';
import 'package:mesa_news_app/app/services/providers/auth_provider.dart';
import 'package:mesa_news_app/app/services/repositories/news_repository.dart';

class FeedDI implements Bindings {
  @override
  void dependencies() {
    //  Get.lazyPut<HomeController>(() =>
    Get.put(FeedController(
      NewsRepository(HttpProvider(Get.find())),
    ));
  }
}
