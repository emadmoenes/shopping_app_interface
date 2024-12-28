import 'package:flutter/material.dart';

// this is the hot offer card component
class HotOfferCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 170,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Expanded(
                child: Image.asset(
                  'assets/images/hotOffer.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // using Expanded to make the card height dynamic
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hot Offer',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Get 20% off ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
