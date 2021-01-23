import 'package:get/state_manager.dart';
import 'package:mesa_news_app/app/services/repositories/news_repository.dart';

class FeedController extends GetxController {
  final NewsRepository _repository;

  FeedController(this._repository);
}
