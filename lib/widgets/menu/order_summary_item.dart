import 'package:flutter/material.dart';

class OrderSummaryItem extends StatelessWidget {
  final int itemNum;
  final String itemName;
  final int quantity;
  final double price;

  const OrderSummaryItem({
    super.key,
    required this.itemNum,
    required this.itemName,
    required this.quantity,
    required this.price,
  });

  final double _padding = 12.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[850],
      ),
      child: Padding(
        padding: EdgeInsets.all(_padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: _padding),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        itemNum.toString(),
                      ),
                    ),
                  ),
                ),
                Text(
                  itemName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: _padding),
                  child: Text(
                    "x$quantity",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "\$$price",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
