import 'package:flutter/material.dart';
import 'package:tutubi_assignment/helpers/button.dart';

class MyLaunchPage extends StatelessWidget {
  const MyLaunchPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Container()),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buttonA('Screen 1',
                      () => Navigator.pushNamed(context, 'screen1')),
                  buttonA('Screen 2',
                      () => Navigator.pushNamed(context, 'screen2')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
