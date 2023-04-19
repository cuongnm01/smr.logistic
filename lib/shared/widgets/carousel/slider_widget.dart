import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../styles/text_style/text_style.dart';
import '../../widget/image_widget/network_image.dart';
import '../image_widget/fcore_image.dart';

class SliderItem {
  SliderItem({
    this.title,
    this.description,
    required this.image,
    this.onpress,
  });

  final String image;
  final String? title, description;
  Function()? onpress;
}

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    required this.items,
    Key? key,
    this.title,
    this.showLabel = false,
    this.onTapItem,
    this.leading,
    this.imageBuilder,
    this.borderRadius = 8,
    this.decoration,
    this.showIndicator = true,
    this.ratio,
    this.radius,
    this.localImage = true,
    this.width,
  }) : super(key: key);

  final String? title;
  final List<SliderItem> items;
  final Function(int index)? onTapItem;
  final Widget? leading;
  final bool showLabel;
  final Function(String? url, int index)? imageBuilder;
  final double borderRadius;
  final BoxDecoration? decoration;
  final bool showIndicator;
  final double? ratio;
  final double? radius;
  final bool localImage;
  final double? width;

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Stack(
        children: [
          if (widget.items.isNotEmpty)
            CarouselSlider(
              items: List.generate(
                widget.items.length,
                (index) {
                  return InkWell(
                    onTap: widget.items[index].onpress,
                    child: Container(
                      decoration: widget.decoration,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: widget.decoration,
                            child: widget.localImage
                                ? FCoreImage(
                                    widget.items[index].image,
                                    // height: double.infinity / widget.ratio!,
                                    fit: BoxFit.cover,
                                  )
                                : NetWorkImage(
                                    image: widget.items[index].image,
                                    width: double.infinity,
                                    height: 150,
                                    fit: BoxFit.cover,
                                    radius: widget.radius ?? 0,
                                  ),
                          ),
                          if (widget.items[index].title != null)
                            Text(
                              widget.items[index].title!,
                              style: AppTextStyle.bold(),
                            ),
                          if (widget.items[index].description != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 8),
                              child: Text(
                                widget.items[index].description!,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.regular(),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 1,
                scrollDirection: Axis.horizontal,
                enlargeCenterPage: false,
                aspectRatio: widget.ratio ?? 1.2,
                onPageChanged: (index, _) {
                  setState(() {
                    currentIndex = index.toDouble();
                  });
                },
              ),
            )
          else
            promotionsEmptyState,
          if (widget.showIndicator)
            Positioned(
              bottom: 15,
              child: Container(
                width: (widget.width ?? 32) - 32,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DotsIndicator(
                  dotsCount: widget.items.length,
                  position: currentIndex,
                  decorator: DotsDecorator(
                    color: const Color.fromRGBO(255, 255, 255, 0.6),
                    activeColor: const Color(0xffFFFFFF),
                    size: const Size.square(8),
                    activeSize: const Size.square(8),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11)),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget promotionsEmptyState = const Text('Empty');
}
