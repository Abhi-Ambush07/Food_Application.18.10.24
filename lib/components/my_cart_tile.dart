import 'package:flutter/material.dart';
import 'package:foodapp/components/my_quantity_selector.dart';
import 'package:foodapp/models/cart_item.dart';
import 'package:foodapp/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  final Restaurant restaurant;
  const MyCartTile({
    super.key,
    required this.cartItem,
    required this.restaurant
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        children: [
          Padding(

            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    //food image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(cartItem.food.imagePath,
                      height: 100,
                      width: 100,),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartItem.food.name),
                        Text('\₹'+cartItem.food.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),),
                      ],
                    ),
                  const Spacer(),
                    QuantitySelector(
                      quantity: cartItem.quantity, 
                      food: cartItem.food, 
                      onDecrement:(){
                        restaurant.removeFromCart(cartItem);
                      }, 
                      onIncrement:(){
                        restaurant.addTocart(cartItem.food,cartItem.selectedAddons);
                      },
                      )
              ],
            ),
          ),
          //addons
          SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 60 : 0,
              child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
              children: cartItem.selectedAddons
                .map((addon) => Padding(
        
                  padding: const EdgeInsets.only(left: 8.0),
                  child: FilterChip(
                  label: Row(
                    children: [
                    //addon name
                    Text(addon.name),
                    //addon price
                    Text('(\₹$addon.price.toString()'),
                    ],
                  ),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary
                    ) 
                    ),
                                onSelected: (value) {},
                                backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                                 // Replace with your onSelected logic
                                labelStyle: TextStyle(
                  color:
                  Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 12, 
                  ),            
                              ),
                ))
            .toList(),
            ),
          )
        ],
        ),
      ),
    );
  }
}