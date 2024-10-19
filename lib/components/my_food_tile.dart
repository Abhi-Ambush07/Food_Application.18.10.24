import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final VoidCallback onTap;

  const FoodTile({
    Key?key,
    required this.food,
    required this.onTap,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.name,
                    style: const TextStyle(
                       fontSize: 25, // Increase font size
                    fontWeight: FontWeight.bold,
                    ),),
                    Text(
                  '₹' + food.price.toString(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    // Assuming price is in rupees
                    Text(food.description),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              ClipRRect(
                borderRadius:BorderRadius.circular(18),
                child:Image.asset(food.imagePath, 
                width: 170,
                ),
              )
              //  // Replace with your image loading logic
            ],
          ),
        ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
          )
      ],
    );
  }
}
