import 'package:flutter/material.dart';

class AvatarCircle extends StatelessWidget {
  final String path;
  final double? height;
  const AvatarCircle({Key? key, required this.path, this.height = 45}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(path), fit: BoxFit.fitHeight),
      ),
      //child: Image.network(path),
    );
  }
}
