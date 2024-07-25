import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space/planet_controller.dart';
import 'package:space/planets.dart';


class MiniPlanetSlider extends StatefulWidget {
  const MiniPlanetSlider({super.key});

  @override
  State<MiniPlanetSlider> createState() => _MiniPlanetSliderState();
}

class _MiniPlanetSliderState extends State<MiniPlanetSlider> {


  late PageController controller;
  late PlanetController planetController;


  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: 0,
      keepPage: false,
      viewportFraction: 0.3,
    );
  }


  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    planetController = context.read<PlanetController>();
    return Stack(
      children: [

        Positioned(
          bottom: -220,
          left: 0,
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: CustomPaint(
            painter: _CircleLinePainter(),
            child: const SizedBox(
              width: double.infinity,
            ),
          ),
        ),

        PageView.builder(
          controller: controller,
          itemCount: Planets.list.length,
          onPageChanged: (value) {
            planetController.currentPage = value;
          },
          itemBuilder: builder,
        )

      ],
    );
  }


  Widget builder(BuildContext context, int index) {
    final planet = Planets.list[index];
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {

        double value = 1.0;

        if (controller.position.haveDimensions) {
          value = controller.page! - index;
          value = (1 - (value.abs() * .6)).clamp(0.0, 1.0);
        }

        return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: Curves.easeOut.transform(value) * 215,
            width: Curves.easeOut.transform(value) * 90,
            child: Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: planet.color.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: const Offset(0, 0),
                    )
                  ],
                ),
                child: Image.asset(
                  planet.image,
                ),
              ),
            )
          ),
        );
      },
    );
  }

}

class _CircleLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 1.8;

    canvas.drawCircle(center, radius, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



