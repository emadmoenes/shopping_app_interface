import 'package:flutter/material.dart';

//this is the product card component
class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // using GestureDetector to add a snackbar message when the card is tapped
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Item added to the cart')),
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/productImg.png',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text('Shower Curtain', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Item added to the cart'),
                      backgroundColor: Colors.green),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
