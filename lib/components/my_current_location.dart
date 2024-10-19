import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLoationSearchBox(BuildContext context){
  showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text("Your location"),
    content: const TextField(
      decoration: InputDecoration(hintText: "Search address...")
    ),
    actions:[
      MaterialButton(
        onPressed: ()=>
        Navigator.pop(context),
        child: const Text('Cancel'),
        ),
        MaterialButton(
        onPressed: ()=>
        Navigator.pop(context),
        child: const Text('Save'),
        )
    ],
  ),
);
}

   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 

        children: [
          Text(
            "Deliver now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: ()=>openLoationSearchBox(context),
          child: Row(
            children: [
              // address
              Text(
                "6901 Hollywood Blvd",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // drop down menu
              Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
          )
        ],
      ),
    );
  }
}