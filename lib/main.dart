import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// services
import 'package:currency_app/services/dio_client.dart';

// repositories
import 'package:currency_app/repositories/sea_food_repositories.dart';
import 'package:currency_app/providers/meal_provider.dart';

// providers
// import 'package:currency_app/providers/meal_provider.dart';

// pages
import 'package:currency_app/pages/botton_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provide Dio client globally
        Provider(create: (_) => DioClient()),

        // Meal repository
        // ProxyProvider<DioClient, MealRepository>(
        //   update: (_, dioClient, __) => MealRepository(dioClient),
        // ),

        // Categories repository
        ProxyProvider<DioClient, CategoriessRepository>(
          update: (_, dioClient, __) => CategoriessRepository(dioClient),
        ),

        // MealProvider (state management for meals list)
        // ChangeNotifierProvider<MealProvider>(
        //   create: (context) => MealProvider(
        //     Provider.of<MealRepository>(context, listen: false),
        //   ),
        // ), 

        // MealDetailsProvider (state management for single meal details)
        // ChangeNotifierProvider<MealDetailsProvider>(
        //   create: (context) => MealDetailsProvider(
        //     Provider.of<MealRepository>(context, listen: false),
        //   ),
        // ),

        // CategoriesProvider (state management for categories)
        ChangeNotifierProvider<CategoriesProvider>(
          create: (context) => CategoriesProvider(
            Provider.of<CategoriessRepository>(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Currency App',
        theme: ThemeData.dark(),
        home: const BottomNav(),
      ),
    );
  }
}
