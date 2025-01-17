import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,
  });
  List<Tab> _buildcategoryTabs(){
    return FoodCategory.values.map((Category){
        return Tab(
          text: Category.toString().split('.').last,
        );
    }).toList();
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildcategoryTabs(),
      ),
    );
  }
}