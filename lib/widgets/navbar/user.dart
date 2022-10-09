import 'package:flutter/material.dart';

class User extends StatelessWidget {
  final String name;

  const User({super.key, required this.name});

  final double _avatarSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(
              color: Colors.white70,
              width: 0.5,
            ),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        overlayColor: MaterialStateProperty.all(
          Colors.white.withOpacity(0.1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5.0,
          top: 5.0,
          bottom: 5.0,
          right: 15.0,
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Container(
              width: _avatarSize,
              height: _avatarSize,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  name[0],
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 12.0,
              fontFamily: 'Roboto',
              color: Colors.white,
            ),
          )
        ]),
      ),
    );
  }
}
