import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_elapsed/time_elapsed.dart';

class NewsCardWidget extends StatelessWidget {
  final String urlImage;
  final String url;
  final String title;
  final String description;
  final String publishedAt;

  final String content;
  final String author;
  final String highlight;

  const NewsCardWidget(
      {Key key,
      this.urlImage,
      this.url,
      this.title,
      this.description,
      this.content,
      this.author,
      this.publishedAt,
      this.highlight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: Get.height * .2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: NetworkImage(urlImage ?? ""),
                onError: (obj, stk) => Center(child: Icon(Icons.error)),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(8),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Icon(Icons.bookmark_border_outlined),
                Text(getElapsedTime ?? '', style: TextStyle(fontStyle: FontStyle.italic)),
              ])),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(description ?? '',
                  textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
          SizedBox(
            height: 10,
          ),
          Flexible(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(description ?? '',
                      textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.normal)))),
        ],
      ),
    );
  }

  String get getElapsedTime => TimeElapsed().fromDateStr(publishedAt).contains('w')
      ? TimeElapsed().fromDateStr(publishedAt).replaceAll('w', '') + ' semanas atrás'
      : TimeElapsed().fromDateStr(publishedAt).contains('d')
          ? TimeElapsed().fromDateStr(publishedAt).replaceAll('d', '') + ' dias atrás'
          : TimeElapsed().fromDateStr(publishedAt).contains('h')
              ? TimeElapsed().fromDateStr(publishedAt).replaceAll('h', '') + ' horas atrás'
              : TimeElapsed().fromDateStr(publishedAt).replaceAll('m', '') + ' minutos atrás';
}
