import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mesa_news_app/app/data/models/news_high_light_model.dart';
import 'package:mesa_news_app/app/modules/feed/feed_Controller.dart';

import 'widgets/news_tile.dart';

class FeedPage extends GetView<FeedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Mesa News'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Destaques"),
            Container(
                constraints: BoxConstraints(minHeight: 96, maxHeight: 164),
                child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.newsHighlights.value.data.length ?? 0, //,
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
            Text("Destaques"),
          ],
        ),
      ),
    );
  }
}
