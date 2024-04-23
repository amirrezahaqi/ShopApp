import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopnew/res/dimens.dart';

final List<String> imgList = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdypS76wCfLyYOqyX0lh76GwRxbWzWqOhChrLtMzx_BQ&s",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_EHjt_TD3w1rzRkbHgCqy-zsMpVBAILfv82AjilDdwIbkhUBy25E3uMyRVWQT4KO9B8s&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv_AExjjaebjjyWlfi0cQuT-NNK7JzhpQ4vjIeqUuCV3lcnO8yIGFbQqCQEYggN2bOZFc&usqp=CAU"
];

class AppSlider extends StatelessWidget {
  AppSlider({
    super.key,
  });
  final CarouselController _controller = CarouselController();
  final List<Widget> items = imgList
      .map((e) => Padding(
            padding: const EdgeInsets.all(AppDimens.medium),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.medium),
              child: Image.network(
                e,
                fit: BoxFit.cover,
              ),
            ),
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: CarouselSlider(
          items: items,
          options: CarouselOptions(
              autoPlay: true, onPageChanged: (index, reason) {})),
    );
  }
}
