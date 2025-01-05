import 'package:flutter/material.dart';

class PreviousCostsPage extends StatelessWidget {
  const PreviousCostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Δυναμικό background
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // Δυναμικό AppBar χρώμα
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Previous Costs',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Λογότυπο
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                image: const DecorationImage(
                  image: AssetImage('assets/car_logo.png'), // Βάλε την εικόνα σου
                  fit: BoxFit.cover,
                ),
              ),
              height: 100,
              width: 170,
            ),
          ),
          const SizedBox(height: 20),

          // Τίτλος "Previous Costs"
          Text(
            'Previous Costs',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),

          // Λίστα κόστους
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                buildCostItem(
                    context, 'Oil Change', 'at 124.059km', '\$30', Icons.directions_car),
                buildCostItem(context, 'Windshield Wipers', 'at 109.360km', '\$25.50',
                    Icons.directions_car),
                buildCostItem(context, 'Multipliers Change', 'at 101.728km', '\$250',
                    Icons.build),
                buildCostItem(context, 'New Tires', 'at 92.665km', '\$310', Icons.settings),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCostItem(
      BuildContext context, String title, String subtitle, String cost, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Theme.of(context).cardColor, // Δυναμικό χρώμα για το card
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).iconTheme.color, size: 30),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.attach_money, color: Theme.of(context).colorScheme.secondary),
            Text(
              cost,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
