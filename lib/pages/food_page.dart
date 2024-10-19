//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/components/my_button.dart';
import 'package:foodapp/models/food.dart';
import 'package:foodapp/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon,bool> selectedAddons={};
  FoodPage({
    super.key,
    required this.food,
  }) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  //method to ADD to cart
  void addTocart(Food food, Map<Addon,bool>selectedAddons){
    Navigator.pop(context);
    
    List<Addon> currentlySelectedAddons = [];

for (Addon addon in widget.food.availableAddons) {
  if (widget.selectedAddons[addon] == true) {
    currentlySelectedAddons.add(addon);
  }
}
  context.read<Restaurant>().addTocart(food, currentlySelectedAddons);
  }

  Widget build(BuildContext context) {
    return Stack(children: [
      //scaffold UI
       Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Food Image
            Image.asset(
              width: MediaQuery.of(context).size.width, // Full width of the screen
              height: 450,
              widget.food.imagePath,
              fit: BoxFit.cover,
              ),
            // Food name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food name
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  // Food price
                  Text(
                    '₹' + widget.food.price.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Food description
                  Text(widget.food.description),
                  const SizedBox(height: 10.0),
                  Divider(color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(height: 10.0),
                  Text(
                    "Add-Ons",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Addons
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        // Get individual addon
                        Addon addon = widget.food.availableAddons[index];

                        // Return checkbox UI
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text(
                            '₹' + addon.price.toString(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool?value) {
                            setState(() {
                              widget.selectedAddons[addon]=value!;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Add to Cart button
            MyButton(
              text: "Add to Cart",
              onTap: ()=>addTocart(widget.food,widget.selectedAddons),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    ),
      //back button
    SafeArea(
      child: Opacity(
        opacity: 0.6,
        child: Container(
          margin: const EdgeInsets.only(left: 25.0),
          decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          shape: BoxShape.circle
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: ()=>Navigator.pop(context),
            ),
          ),
      ),
    )
    ],
    );

    
  }
}
