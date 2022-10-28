
import 'package:cosy_pos/widgets/menu/checkout_payment_method.dart';
import 'package:cosy_pos/widgets/menu/menu_category.dart';
import 'package:cosy_pos/widgets/menu/order_summary_item.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                child: _SearchBar(),
              ),
              Expanded(
                flex: 3,
                child: _Categories(),
              ),
              Expanded(
                flex: 3,
                child: _Items(),
              ),
              Expanded(
                child: _OrderQueue(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: _Checkout(),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  final List<String> _categories = [
    'All',
    'Appetizers',
    'Beverages',
    'Desserts',
    'Entrees',
    'Sides',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      // TODO: Make this a ListView with a horizontal scroll
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: MenuCategory(
              backgroundColour: Colors.white,
              categoryName: _categories[index],
              itemCount: 0),
        ),
      ),
    );
  }
}

class _Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
    );
  }
}

class _OrderQueue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
    );
  }
}

class _Checkout extends StatelessWidget {
  final double _padding = 25.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        _padding,
      ),
      child: Column(
        children: [
          // Table selection
          const Expanded(
            child: _TableSelection(
              tableNum: 1,
              waiterName: "Leslie K.",
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              children: [
                _OrderSummary(),
                SizedBox(
                  height: _padding,
                ),
                _Total(
                  subtotal: 171.5,
                  tax: 17.15,
                  total: 188.65,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TableSelection extends StatelessWidget {
  final int tableNum;
  final String waiterName;

  const _TableSelection({
    required this.tableNum,
    required this.waiterName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Table $tableNum",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                waiterName,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () => {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.create_outlined,
                color: Colors.white,
                size: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _OrderSummary extends StatelessWidget {
  final List<Map<String, dynamic>> _items = [
    {
      'name': 'Roast chicken',
      'quantity': 2,
      'price': 25.50,
    },
    {
      'name': 'Red caviar',
      'quantity': 3,
      'price': 36.90,
    },
    {
      'name': 'German sausage',
      'quantity': 1,
      'price': 5.60,
    },
    {
      'name': 'Irish cream coffee',
      'quantity': 1,
      'price': 4.20,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: Fix overflow issue
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 400.0,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _items.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: OrderSummaryItem(
            itemNum: index + 1,
            itemName: _items[index]['name'],
            quantity: _items[index]['quantity'],
            price: _items[index]['price'],
          ),
        ),
      ),
    );
  }
}

class _Total extends StatelessWidget {
  final double subtotal;
  final double tax;
  final double total;

  _Total({
    required this.subtotal,
    required this.tax,
    required this.total,
  });

  final Map<String, IconData> _paymentMethods = {
    'Cash': Icons.attach_money,
    'Debit/Credit': Icons.credit_card,
  };

  final double _padding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[850],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25.0,
            horizontal: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Subtotal",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "\$${subtotal.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _padding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Tax 13%",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "\$${tax.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: _padding),
                    child: const DottedLine(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        "\$${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Payment methods
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Method",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (final entry in _paymentMethods.entries)
                        CheckoutPaymentMethod(
                          icon: entry.value,
                          caption: entry.key,
                        ),
                    ],
                  ),
                  TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                    ),
                    onPressed: () => {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            "Place Order",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
