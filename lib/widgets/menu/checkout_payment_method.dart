import 'package:flutter/material.dart';

class CheckoutPaymentMethod extends StatelessWidget {
  final IconData icon;
  final String caption;

  const CheckoutPaymentMethod(
      {super.key, required this.icon, required this.caption});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            child: Center(
              child: Icon(icon),
            ),
          ),
          Text(
            caption,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
