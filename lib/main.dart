import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// services
import 'services/dio_client.dart';

// repositories
import 'repositories/sea_food_repositories.dart';

// providers
import 'providers/meal_provider.dart';
 // <-- Add this

// pages
import 'pages/botton_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => DioClient()),

        ProxyProvider<DioClient, CategoriessRepository>(
          update: (_, dioClient, __) => CategoriessRepository(dioClient),
        ),

        ChangeNotifierProvider<CategoriesProvider>(
          create: (context) => CategoriesProvider(
            Provider.of<CategoriessRepository>(context, listen: false),
          ),
        ),

        ChangeNotifierProvider<BookingProvider>(
          create: (_) => BookingProvider(), // <-- Add this provider
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meal App',
        theme: ThemeData.dark(),
        home: const BottomNav(),
      ),
    );
  }
}
