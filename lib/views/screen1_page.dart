import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutubi_assignment/cubits/screen1/screen1_cubit.dart';
import 'package:tutubi_assignment/helpers/button.dart';

import '../models/covered_space.dart';

class Screen1Page extends StatefulWidget {
  const Screen1Page({
    Key? key,
  }) : super(key: key);

  @override
  State<Screen1Page> createState() => _Screen1PageState();
}

class _Screen1PageState extends State<Screen1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<Screen1Cubit, Screen1State>(
          builder: (context, state) {
            return Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buttonB(
                          Icons.circle_outlined,
                          () => context.read<Screen1Cubit>().acquireSpace(
                              maxX: MediaQuery.of(context).size.width,
                              maxY: MediaQuery.of(context).size.height,
                              circle: true)),
                      buttonB(
                          Icons.crop_square_outlined,
                          () => context.read<Screen1Cubit>().acquireSpace(
                              maxX: MediaQuery.of(context).size.width,
                              maxY: MediaQuery.of(context).size.height,
                              square: true)),
                      buttonB(
                          Icons.undo_outlined,
                          () => context.read<Screen1Cubit>().acquireSpace(
                                maxX: MediaQuery.of(context).size.width,
                                maxY: MediaQuery.of(context).size.height,
                              )),
                    ],
                  ),
                )),
                if (state is Screen1ShapePosition)
                  Positioned.fill(
                      child: Stack(
                          children: state.shapeList!
                              .map(
                                (e) => Positioned(
                                    top: e.yPoint1,
                                    left: e.xPoint1,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          shape: e.shape == Shape.circle
                                              ? BoxShape.circle
                                              : BoxShape.rectangle,
                                          border: Border.all(
                                              color: Colors.black, width: 5)),
                                    )),
                              )
                              .toList()))
              ],
            );
          },
        ),
      ),
    );
  }
}
