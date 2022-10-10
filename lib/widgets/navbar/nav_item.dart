import 'package:flutter/material.dart';

class NavItem extends StatefulWidget {
  final MapEntry<String, Widget> entry;
  final bool isSelected;
  final double buttonPadding;

  const NavItem({
    super.key,
    required this.entry,
    required this.buttonPadding,
    this.isSelected = false,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  Color _textColor = Colors.white70;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      onHover: (isHovered) {
        setState(() {
          _textColor = isHovered ? Colors.white : Colors.white54;
        });
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        overlayColor: MaterialStateProperty.all(
          Colors.white.withOpacity(0.1),
        ),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.1,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.buttonPadding,
            vertical: widget.buttonPadding * 0.75,
          ),
          child: Text(
            widget.entry.key,
            style: TextStyle(
              fontSize: 12.0,
              fontFamily: 'Roboto',
              color: _textColor,
            ),
          ),
        ),
      ),
    );
  }
}
