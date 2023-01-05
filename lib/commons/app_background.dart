import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppBackground extends StatelessWidget {
  final Widget body;
  const AppBackground({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 50,
              right: 10,
              child: _ball(sizeMax: true),
            ),
            Positioned(
              top: 200,
              left: -100,
              child: _ball(),
            ),
            body
          ],
        ),
      ),
    );
  }

  Widget _ball({bool sizeMax = false}){
    double sizeBall = 0;
    sizeBall =  sizeMax ? 250: 200;
    return Container(
      height: sizeBall,
      width: sizeBall,
      decoration:   BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            colors: [
              Colors.white,
              AppColors.primary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.3],
            tileMode: TileMode.clamp),
      ),
    );
  }
}
