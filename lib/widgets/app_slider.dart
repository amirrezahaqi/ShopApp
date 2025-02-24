import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopnew/data/model/slide.dart';
import 'package:shopnew/res/dimens.dart';

class AppSlider extends StatefulWidget {
  const AppSlider({
    super.key,
    required this.imgList,
  });

  final List<Slide> imgList;
// [
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdypS76wCfLyYOqyX0lh76GwRxbWzWqOhChrLtMzx_BQ&s",
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_EHjt_TD3w1rzRkbHgCqy-zsMpVBAILfv82AjilDdwIbkhUBy25E3uMyRVWQT4KO9B8s&usqp=CAU",
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv_AExjjaebjjyWlfi0cQuT-NNK7JzhpQ4vjIeqUuCV3lcnO8yIGFbQqCQEYggN2bOZFc&usqp=CAU"
// ];
  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  final CarouselSliderController _controller = CarouselSliderController();

  int _curent = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        width: double.infinity,
        child: Column(
          children: [
            CarouselSlider(
                carouselController: _controller,
                items: widget.imgList
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(AppDimens.medium),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppDimens.medium),
                            child: Image.network(
                              e.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _curent = index;
                      });
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imgList
                  .asMap()
                  .entries
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(AppDimens.small / 2),
                      child: GestureDetector(
                        onTap: () => _controller.animateToPage(e.key),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _curent == e.key
                                  ? Colors.black
                                  : Colors.grey),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ));
  }
}
