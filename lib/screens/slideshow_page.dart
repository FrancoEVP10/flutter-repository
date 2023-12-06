import 'package:flutter/material.dart';
import 'package:flutter_repository/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[500],
      body: Center(
        child: Column(
          children: const <Widget>[
            Expanded(child: CustomSlideShow()),
            Expanded(child: CustomSlideShow()),
          ],
        ),
      ),
    );
  }
}

class CustomSlideShow extends StatelessWidget {
  const CustomSlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimarySize: 25,
      bulletSecondarySize: 12,
      bulletPrimaryColor: Theme.of(context).colorScheme.primary,
      bulletSecondaryColor: Theme.of(context).colorScheme.secondary,  
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
