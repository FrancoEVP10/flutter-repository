import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsAbove;
  final Color bulletPrimaryColor;
  final Color bulletSecondaryColor;
  final double bulletPrimarySize;
  final double bulletSecondarySize;

  const Slideshow({
    super.key,
    required this.slides,
    this.dotsAbove = false,
    this.bulletPrimaryColor = Colors.blue,
    this.bulletSecondaryColor = Colors.grey,
    this.bulletPrimarySize = 12,
    this.bulletSecondarySize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlidershowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlidershowModel>(context).bulletPrimaryColor =
                  bulletPrimaryColor;
              Provider.of<_SlidershowModel>(context).bulletSecondaryColor =
                  bulletSecondaryColor;
              Provider.of<_SlidershowModel>(context).bulletPrimarySize =
                  bulletPrimarySize;
              Provider.of<_SlidershowModel>(context).bulletSecondarySize =
                  bulletSecondarySize;

              return _CreateStructureSlideshow(
                dotsAbove: dotsAbove,
                slides: slides,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CreateStructureSlideshow extends StatelessWidget {
  const _CreateStructureSlideshow({
    required this.dotsAbove,
    required this.slides,
  });

  final bool dotsAbove;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (dotsAbove)
          _Dots(
            totalSlides: slides.length,
          ),
        Expanded(
          child: _Slides(slides: slides),
        ),
        if (!dotsAbove)
          _Dots(
            totalSlides: slides.length,
          ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots({
    required this.totalSlides,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalSlides,
          (index) => _Dot(
            index: index,
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlidershowModel>(context);
    double size = 0;
    Color color;

    if (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5) {
      size = ssModel.bulletPrimarySize;
      color = ssModel.bulletPrimaryColor;
    } else {
      size = ssModel.bulletSecondarySize;
      color = ssModel.bulletSecondaryColor;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({required this.slides});

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      // print('Current page: ${pageViewController.page}');
      Provider.of<_SlidershowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        physics: BouncingScrollPhysics(),
        // children: const <Widget>[
        //   _Slide(svg: 'assets/svgs/slide-1.svg'),
        //   _Slide(svg: 'assets/svgs/slide-2.svg'),
        //   _Slide(svg: 'assets/svgs/slide-3.svg'),
        // ],
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlidershowModel with ChangeNotifier {
  double _currentPage = 0;
  Color bulletPrimaryColor = Colors.blue;
  Color bulletSecondaryColor = Colors.grey;
  double bulletPrimarySize = 12;
  double bulletSecondarySize = 12;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}
