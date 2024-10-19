import 'package:flutter/material.dart';
import 'package:foodapp/components/my_current_location.dart';
import 'package:foodapp/components/my_description_box.dart';
import 'package:foodapp/components/my_drawer.dart';
import 'package:foodapp/components/my_food_tile.dart';
import 'package:foodapp/components/my_silver_app_bar.dart';
import 'package:foodapp/components/my_tab_bar.dart';
import 'package:foodapp/models/food.dart';
import 'package:foodapp/models/restaurant.dart';
import 'package:foodapp/pages/food_page.dart';
import 'package:provider/provider.dart';
//import 'package:foodapp/themes/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin{
  
  //tab Controller
  late TabController _tabController;
  @override

  void initState(){
    super.initState();
    _tabController=TabController(length:FoodCategory.values.length, vsync: this);
  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  //sort out and return a list of food items belonging to a category
  List<Food> filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
  return fullMenu.where((food) => food.category == category).toList();
}

List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
  return FoodCategory.values.map((category) {
    //category menu
    List<Food> categoryMenu = filterMenuByCategory(category, fullMenu);
    
    // Wrap ListView.builder inside SingleChildScrollView and Column
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          categoryMenu.length,
          (index) {
            final food = categoryMenu[index];
            return FoodTile(
              food: food,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodPage(food: food),
                ),
              ),
            );
          },
        ),
      ),
    );
  }).toList();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          // Return a list of slivers
          MySliverAppBar(
            title:MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                  // My Current Location
                  const MyCurrentLocation(),
                  //Description Box
                  const MyDescriptionBox(),
            ],
            ),
          ), 
        ],
        body: Consumer<Restaurant>(
          builder:(context,restaurant,child)=>TabBarView(
          controller: _tabController,
          children: getFoodInThisCategory(restaurant.menu),
          )
          ),
      ),
    );
  }
}