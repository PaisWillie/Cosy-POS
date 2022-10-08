import 'package:cosy_pos/widgets/navbar/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/maki_icons.dart';

class POS extends StatelessWidget {
  const POS({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF111315),
      child: Row(
        children: [
          _Navbar(),
        ],
      ),
    );
  }
}

class _Navbar extends StatelessWidget {
  final Map<String, Widget> _navbarItems = {
    'Reservation': Container(),
    'Table services': Container(),
    'Menu': Container(),
    'Delivery': Container(),
    'Accounting': Container(),
  };

  final double padding = 25.0;
  final double buttonPadding = 15.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0, 0, 0, 0),
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: padding, left: buttonPadding),
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood,
                  color: Colors.white,
                ),
                Text('CosyPOS', style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
          // List of navigation items
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _navbarItems.entries
                .map((entry) => NavItem(
                      entry: entry,
                      buttonPadding: buttonPadding,
                    ))
                .expand((item) => [item, const SizedBox(height: 5)])
                .toList(),
          ),
        ],
      ),
    );
  }
}
