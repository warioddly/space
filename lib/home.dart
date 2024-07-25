import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space/baffle_text.dart';
import 'package:space/mini_planet_slider.dart';
import 'package:space/planet_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final controller = PlanetController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Space'),
          centerTitle: true,
        ),
        body: ChangeNotifierProvider(
          create: (context) => controller,
          child: Column(
            children: [

              const SizedBox(height: 30),

              Expanded(
                child: Stack(
                  children: [

                    Align(
                      alignment: Alignment.topCenter,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: ListenableBuilder(
                            listenable: controller,
                            builder: (context, child) {
                              return BaffleText(
                                text: controller.planet.name.toUpperCase(),
                              );
                            }
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 150,
                      left: MediaQuery.of(context).size.width / 2 - 100,
                      child: ListenableBuilder(
                        listenable: controller,
                        builder: (context, value) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 1100),
                            width: 190,
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: controller.planet.color.withOpacity(0.6),
                                  blurRadius: 25,
                                  spreadRadius: 5,
                                  offset: const Offset(0, 0),
                                )
                              ],
                              image: DecorationImage(
                                image: AssetImage(controller.planet.image),
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/man_in_an_astronaut.png',
                      )
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 250,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                          ),
                        )
                      )
                    ),

                    const Flexible(
                      child: MiniPlanetSlider(),
                    ),

                  ],
                ),


              ),

            ],
          ),
        ),
      ),
    );
  }
}
