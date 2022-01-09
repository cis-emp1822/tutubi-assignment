import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutubi_assignment/cubits/screen2/screen2_cubit.dart';

class Screen2Page extends StatefulWidget {
  const Screen2Page({Key? key}) : super(key: key);

  @override
  State<Screen2Page> createState() => _Screen2PageState();
}

class _Screen2PageState extends State<Screen2Page> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1),
        () => context.read<Screen2Cubit>().fetchPhotos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<Screen2Cubit, Screen2State>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (state is Screen2Loading)
                  const Center(child: CircularProgressIndicator()),
                if (state is Screen2Error)
                  Center(child: Text(state.errorMessage!)),
                if (state is Screen2Loaded)
                  Expanded(
                    child: GridView.builder(
                        itemCount: state.strings!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Card(
                              clipBehavior: Clip.hardEdge,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            state.strings![index]),
                                        fit: BoxFit.fill)),
                              ));
                        }),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
