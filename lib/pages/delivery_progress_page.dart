import 'package:flutter/material.dart';
import 'package:foodapp/pages/my_receipt.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery in Progress.."),
        backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            MyReceipt(),
          ],
        ),
    );
  }
    //Custom Botton Nav bar/ Call delivery driver
    Widget _buildBottomNavbar(BuildContext context){
      return Container(
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )
           ),
           padding: const EdgeInsets.all(25),
           child: Row(
            children: [
              //profile pic of driver
              Container(decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    
                  },
                  icon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(width: 10),
                //driver details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mitch Koko",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    Text(
                      "Mitch Koko",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    //message button
                    Container(decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    
                  },
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                  ],
                ),
                const SizedBox(width: 10),
                //call button
                Container(decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    
                  },
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                  ),
                ),
            ],
            ),
      );
    }
  
}