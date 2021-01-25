import 'package:get/get.dart';
import 'package:mesa_news_app/app/data/models/news_high_light_model.dart';
import 'package:mesa_news_app/app/data/models/news_model.dart';
import 'package:mesa_news_app/app/modules/login/login_controller.dart';
import 'package:mesa_news_app/app/services/providers/no_connection.dart';
import 'package:mesa_news_app/app/services/repositories/news_repository.dart';

import 'widgets/pagination.dart';

class FeedController extends GetxController {
  LoginController loginController = Get.find();

  FeedController(this._repository);
  @override
  void onInit() async {
    await getNewsHighLight();
    ever(_paginationFilter, (_) => getNews());
    _changePaginationFilter(1, 20);
    super.onInit();
  }

  final NewsRepository _repository;

  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  bool get lastPage => _lastPage.value;
  int get _page => _paginationFilter.value.page;
  int get limit => _paginationFilter.value.limit;

  // final lastPage = false.obs;
  // final pagesLength = 0.obs;
  // final pageCurrent = 1.obs;

  final newsHighlights = NewsHighLightModel().obs;
  Future<void> getNewsHighLight() async {
    final result = await _repository.getNewsHighlights();
    newsHighlights.value = result;
    print('news highlights oks');
  }

  final news = NewsModel().obs;
  final newData = <NewsData>[].obs;
  Future<void> getNews() async {
    final result = await _repository.getNews(page: _paginationFilter.value.page);
    news.value = result;
    if (result.pagination.totalPages == _page) {
      _lastPage.value = true;
    }
    newData.addAll(result.data);

    print('news oks');
  }

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);

  void _changePaginationFilter(int page, int limit) {
    print('chegou no final');
    _paginationFilter.update((val) {
      val.page = page;
      val.limit = limit;
    });
  }
}
