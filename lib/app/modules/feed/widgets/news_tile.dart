import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_elapsed/time_elapsed.dart';

class NewsTileWidget extends StatelessWidget {
  final String urlImage;
  final String url;
  final String title;
  final String description;
  final String content;
  final String author;
  final String publishedAt;
  final String highlight;

  const NewsTileWidget({
    Key key,
    @required this.urlImage,
    this.title,
    this.description,
    this.content,
    this.author,
    this.publishedAt,
    this.highlight,
    this.url,
  }) : super(key: key);

  String get getElapsedTime => TimeElapsed().fromDateStr(publishedAt).contains('w')
      ? TimeElapsed().fromDateStr(publishedAt).replaceAll('w', '') + ' semanas atrás'
      : TimeElapsed().fromDateStr(publishedAt).contains('d')
          ? TimeElapsed().fromDateStr(publishedAt).replaceAll('d', '') + ' dias atrás'
          : TimeElapsed().fromDateStr(publishedAt).contains('h')
              ? TimeElapsed().fromDateStr(publishedAt).replaceAll('h', '') + ' horas atrás'
              : TimeElapsed().fromDateStr(publishedAt).replaceAll('m', '') + ' minutos atrás';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .9,
      child: Row(
        children: [
          Container(
              width: Get.width * .4,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(urlImage),
                  fit: BoxFit.cover,
                ),
              )),
          Flexible(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                child: Text(
              title ?? '',
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
            Row(
              children: [
                Icon(Icons.bookmark_border_outlined),
                Text(
                  getElapsedTime ?? '123',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ]))
        ],
      ),
    );
  }
}
