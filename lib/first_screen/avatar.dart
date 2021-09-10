import 'package:flutter/material.dart';

const List<String> kAssets = ['koala.jpg', 'koala2.png'];

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool _clickState = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage(
        'assets/images/${kAssets[_clickState ? 1 : 0]}',
      ),
      backgroundColor: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            _clickState = !_clickState;
          });
        },
      ),
    );
  }
}
