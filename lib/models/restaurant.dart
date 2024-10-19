//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart' hide double, String;
import 'package:flutter/foundation.dart';
import 'package:foodapp/models/cart_item.dart';
import 'package:intl/intl.dart';
import 'food.dart';
import 'package:collection/collection.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // burgers
    Food(
      name: "Classic cheeseburger",
      description: "A juicy burger with melted cheddar cheese, crispy bacon, and tangy pickles on a toasted bun.",
      imagePath: "lib/images/burger/CHEESEBURGERS.jpg",
      price: 120,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Bacon", price: 50),
        Addon(name: "Avocado", price: 35),
      ],
    ),
    Food(
      name: "Beacon burger",
      description: "A juicy burger with melted cheddar cheese, crispy bacon, and tangy pickles on a toasted bun.",
      imagePath: "lib/images/burger/beaconburger.jpg",
      price: 170,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Bacon", price: 50),
        Addon(name: "Avocado", price: 35),
      ],
    ),
    Food(
      name: "Chicken cheeseburger",
      description: "A juicy burger with melted cheddar cheese and crispy chicken on a toasted bun.",
      imagePath: "lib/images/burger/chicken-burgers.jpg",
      price: 120,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Bacon", price: 50),
        Addon(name: "Avocado", price: 35),
      ],
    ),
    Food(
      name: "Lamb Burger",
      description: "A juicy burger with melted cheddar cheese, crispy lamb, and tangy pickles on a toasted bun.",
      imagePath: "lib/images/burger/lambBurger.jpg",
      price: 120,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Bacon", price: 50),
        Addon(name: "Avocado", price: 35),
      ],
    ),
    Food(
      name: "Veg cheeseburger",
      description: "A juicy burger with melted cheddar cheese and tangy pickles on a toasted bun.",
      imagePath: "lib/images/burger/Veggie-Burgers.jpg",
      price: 120,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Bacon", price: 50),
        Addon(name: "Avocado", price: 35),
      ],
    ),
    //salads
    Food(
      name: "Vegetable salad",
      description: "A colorful mix of fresh vegetables with a tangy vinaigrette dressing.",
      imagePath: "lib/images/salads/salad1.jpg",
      price: 50,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Spring Onion", price: 30),
        Addon(name: "Cheese", price: 50),
      ],
    ),
     Food(
      name: "Chicken salad",
      description: "Tender grilled chicken pieces tossed with mixed greens, vegetables, and a creamy dressing.",
      imagePath: "lib/images/salads/chickensalad.png",
      price: 50,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Spring Onion", price: 30),
        Addon(name: "Cheese", price: 50),
      ],
    ),
    Food(
      name: "Fish salad",
      description: "Fleshy grilled fish pieces tossed with mixed greens, vegetables, and a creamy dressing.",
      imagePath: "lib/images/salads/fishsalad.png",
      price: 50,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Spring Onion", price: 30),
        Addon(name: "Cheese", price: 50),
      ],
    ),
    Food(
      name: "Greek salad",
      description: "A classic salad featuring tomatoes, cucumbers, feta cheese, red onion, olives, and a tangy Greek dressing.",
      imagePath: "lib/images/salads/greek-salad.jpg",
      price: 50,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Spring Onion", price: 30),
        Addon(name: "Cheese", price: 50),
      ],
    ),
    // desserts
    Food(
      name: "Cake Slice",
      description: "A moist chocolate cake slice with rich frosting and a sprinkle of chocolate chips.",
      imagePath: "lib/images/desserts/cakeslice.jpg",
      price: 50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "White chocochip", price: 30),
        Addon(name: "Dark Chocolate", price: 50),
      ],
    ),
    Food(
      name: "Custard",
      description: "A creamy custard slice with a buttery base and a sweet, caramelized top.",
      imagePath: "lib/images/desserts/Custard.jpg",
      price: 60,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "White chocochip", price: 30),
        Addon(name: "Dark Chocolate", price: 50),
      ],
    ),
    Food(
      name: "Kheer",
      description: "A creamy rice pudding slice with nuts and raisins.",
      imagePath: "lib/images/desserts/kheer.jpg",
      price: 80,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Rasmalai", price: 10),
        Addon(name: "Sweets", price: 20),
      ],
    ),
    Food(
      name: "Muffins",
      description: "A fluffy muffin slice with a sweet glaze, perfect for a quick snack.",
      imagePath: "lib/images/desserts/muffins.jpg",
      price: 90,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "White chocochip", price: 30),
        Addon(name: "Dark Chocolate", price: 50),
      ],
    ),
    Food(
      name: "Pudding",
      description: "A creamy dessert with rich chocolate flavor, topped with whipped cream.",
      imagePath: "lib/images/desserts/puddings.jpg",
      price: 60,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Rasmalai", price: 10),
        Addon(name: "Sweets", price: 20),
      ],
    ),
    // drinks
    Food(
      name: "Blue Lagoon",
      description: "A refreshing cocktail made with vodka, blue curaçao, and lemonade.",
      imagePath: "lib/images/drinks/bluelagoon.jpg",
      price: 110,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Sugar cubes", price: 10),
      ],
    ),
    Food(
      name: "Coke",
      description: "A refreshing soft drink.",
      imagePath: "lib/images/drinks/coke.jpg",
      price: 50,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice cubes", price: 10),
      ],
    ),
    Food(
      name: "Fresh Lime Soda",
      description: "A refreshing, tangy drink made with fresh lime juice, soda water, and a touch of sweetness.",
      imagePath: "lib/images/drinks/freshlimesoda.jpg",
      price: 110,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Sugar cubes", price: 10),
      ],
    ),
    Food(
      name: "Masala Soda",
      description: "A refreshing, tangy drink made with fresh lime juice, soda water, and a touch of sweetness.",
      imagePath: "lib/images/drinks/masalasoda.jpg",
      price: 110,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Sugar cubes", price: 10),
      ],
    ),
    Food(
      name: "Pepsi",
      description: "A refreshing soft drink.",
      imagePath: "lib/images/drinks/pepsi.jpg", // Correct the image path as needed
      price: 50,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice cubes", price: 10),
      ],
    ),
    Food(
      name: "Sprite",
      description: "A refreshing soft drink.",
      imagePath: "lib/images/drinks/sprite.jpeg",
      price: 110,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice cubes", price: 10),
      ],
    ),
  ];

  /*
    G E T T E R S
  */
  List<Food> get menu => _menu;
  List<CartItem> get cart=> _cart;

  /*
    O P E R A T I O N S
  */
  //user cart
  final List<CartItem> _cart=[];
  // add to cart
  void addTocart(Food food, List<Addon>selectedAddons){
    CartItem? cartItem=_cart.firstWhereOrNull((item){
      bool isSameFood=item.food==food;
      bool isSameAddons=
      ListEquality().equals(item.selectedAddons,selectedAddons);
    return isSameFood && isSameAddons;
    });
    if(cartItem!=null){
      cartItem.quantity++;
    }
    else{
      _cart.add(
        CartItem(
        food: food,
        selectedAddons: selectedAddons
        ),
      );
    }
    notifyListeners();
  }
  // remove from cart
  void removeFromCart(CartItem cartItem){
    int cartIndex=_cart.indexOf(cartItem);

    if(cartItem!=-1){
      if(_cart[cartIndex].quantity>1){
        _cart[cartIndex].quantity--;
      }else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }
  // get total price
  double getTotalPrice(){
    double total=0.0;
    for(CartItem cartItem in _cart){
      double itemTotal=cartItem.food.price;

      for(Addon addon in cartItem.selectedAddons){
        itemTotal+=addon.price;
      }
      total+=itemTotal*cartItem.quantity;
    }
    return total;
  }
  // get total number of items in cart
int getTotalItemCount() {
  int totalItemCount = 0;

  for (CartItem cartItem in _cart) {
    totalItemCount += cartItem.quantity;
  }

  return totalItemCount;
}

// clear cart
void clearCart() {
  _cart.clear();
  notifyListeners();
}

  /*
    H E L P E R S
  */
  //generate a receipt
  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();
    String formatedDate=
    DateFormat('yyyy-MM-dd HH:mm::ss').format(DateTime.now());
    receipt.writeln(formatedDate);
    receipt.writeln();
    receipt.writeln("--------------");
    for(final CartItem in _cart){
      receipt.writeln(
        "${CartItem.quantity}x${CartItem.food.name}-${_formatPrice(CartItem.food.price)}"
        );
        if(CartItem.selectedAddons.isNotEmpty){
          receipt
          .writeln(" Add-ons:${formatAddons(CartItem.selectedAddons)}");
    }
    receipt.writeln();
  }
   receipt.writeln("----------------------------------");
  receipt.writeln("Total Items: ${getTotalItemCount()}");
  receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
  receipt.writeln("----------------------------------");

  return receipt.toString();
  }
  //format double value into money
  String _formatPrice(double price){
    return "\₹${price.toStringAsFixed(2)}";
  }
  //format list of addons
  String formatAddons(List<Addon> addons) {
  return addons
      .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
      .join(", ");
}
}