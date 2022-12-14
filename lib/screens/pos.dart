import 'package:cosy_pos/widgets/navbar/nav_item.dart';
import 'package:cosy_pos/widgets/navbar/user.dart';
import 'package:flutter/material.dart';

class POS extends StatelessWidget {
  const POS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111315),
      body: Row(
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

  final List<String> _users = [
    'Leslie K.',
    'Cameron W.',
    'Jacob J.',
  ];

  final double padding = 25.0;
  final double buttonPadding = 15.0;
  final double headerFooterHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0, 0, 0, 0),
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: headerFooterHeight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: buttonPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.fastfood,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.5),
                      child: Text(
                        'CosyPOS',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // List of navigation items
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _users
                      .map((user) => User(name: user))
                      .expand((item) => [item, const SizedBox(height: 5)])
                      .toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: headerFooterHeight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  '?? 2022 CosyPOS App',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white38,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
