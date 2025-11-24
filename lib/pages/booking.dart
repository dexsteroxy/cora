import 'package:currency_app/pages/botton_nav.dart';
// import 'package:currency_app/pages/home.dart';
import 'package:currency_app/providers/meal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(context);

    final bookedMeals = bookingProvider.bookedMeals;

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
          automaticallyImplyLeading: false, // Remove default back arrow
  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNav()),
      );
    },
  ),
        title: const Text("My Bookings"),
        backgroundColor: const Color(0xFF1C1C1E),
      ),
      body: bookedMeals.isEmpty
          ? const Center(
              child: Text(
                "No meals booked yet",
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: bookedMeals.length,
              itemBuilder: (context, index) {
                final meal = bookedMeals[index];
                return Card(
                  color: const Color(0xFF2C2C2E),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.network(
                      meal["strMealThumb"],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      meal["strMeal"],
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      meal["strArea"] ?? "",
                      style: const TextStyle(color: Colors.white54),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        bookingProvider.removeMeal(meal["idMeal"]);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
