import 'package:flutter/material.dart';
import 'package:foodapp/components/my_cart_tile.dart';
//import 'package:foodapp/models/cart_item.dart';
import 'package:foodapp/models/restaurant.dart';
import 'package:foodapp/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart; // Access the user's cart from the Restaurant provider

        // Scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: const Text('Your Cart'), // Add a title to the AppBar
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure you want to clear the cart?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            // Clear cart logic here
                            restaurant.clearCart(); // Clear the cart
                            Navigator.pop(context);
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete), // Replace with your desired icon
              ),
            ],
          ),
          body: userCart.isEmpty
              ? Center(
                  child: Text('Your cart is empty!'), // Display a message if cart is empty
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          // Get individual cart item
                          final cartItem = userCart[index];

                          // Return cart tile UI
                          return MyCartTile(
                            cartItem: cartItem,
                            restaurant: restaurant, // Pass restaurant to MyCartTile
                          );
                        },
                      ),
                    ),
                    // Add total price and quantity here
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text('Total: ₹${restaurant.getTotalPrice().toStringAsFixed(2)}'), // Replace with your total price logic
                          const SizedBox(height: 25),
                          ElevatedButton(
                            onPressed: () =>{
                              Navigator.push(context,
                               MaterialPageRoute(
                                builder:(context)=>const Payment(),
                                )
                              ),
                              // Implement checkout logic here
                            },
                            child: const Text('Go To Checkout'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
