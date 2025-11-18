import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// services
import 'package:currency_app/services/dio_client.dart';

// repositories
import 'package:currency_app/repositories/sea_food_repositories.dart';
import 'package:currency_app/providers/meal_provider.dart';


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
   
        Provider(create: (_) => DioClient()),

        ProxyProvider<DioClient, CategoriessRepository>(
          update: (_, dioClient, __) => CategoriessRepository(dioClient),
        ),

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
