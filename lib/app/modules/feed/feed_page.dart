import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mesa_news_app/app/data/models/news_high_light_model.dart';
import 'package:mesa_news_app/app/data/models/news_model.dart';
import 'package:mesa_news_app/app/modules/feed/feed_Controller.dart';
import 'package:mesa_news_app/app/services/providers/no_connection.dart';

import 'widgets/news_card_widget.dart';
import 'widgets/news_tile.dart';

class FeedPage extends GetView<FeedController> {
  @override
  Widget build(BuildContext context) {
    NConnection.checkConnection();
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Mesa News'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Destaques",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
            Container(
                constraints: BoxConstraints(minHeight: 96, maxHeight: 164),
                child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller?.newsHighlights?.value?.data?.length ?? 0, //,
                    itemBuilder: (_, mainIndex) {
                      if (mainIndex == 0) {
                        return SizedBox(width: 20);
                      } else {
                        final index = mainIndex - 1;

                        final NewsHighLight newsByIndex = controller.newsHighlights.value.data[index];
                        return NewsTileWidget(
                          urlImage: newsByIndex.imageUrl,
                          title: newsByIndex.title,
                          publishedAt: newsByIndex.publishedAt.toString().split(' ').first,
                          url: newsByIndex.url,
                        );
                      }
                    }))),
            SizedBox(height: 24),
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Últimas notícias",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
            Container(
                child: Obx(() => controller.news.value.data == null
                    ? SizedBox()
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: controller?.news?.value?.data?.length ?? 0,
                        itemBuilder: (_, index) {
                          final NewsData newsByIndex = controller.news.value.data[index];
                          return Container(
                              constraints: BoxConstraints(minHeight: 96, maxHeight: Get.height * .45),
                              child: NewsCardWidget(
                                urlImage: newsByIndex.imageUrl,
                                title: newsByIndex.title,
                                publishedAt: newsByIndex.publishedAt.toString().split(' ').first,
                                description: newsByIndex.title,
                                url: newsByIndex.url,
                              ));
                        },
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, separatorIndex) => Divider(),
                      ))),
          ],
        ),
      ),
    );
  }
}
