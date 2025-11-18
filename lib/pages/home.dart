import 'package:currency_app/components/categories.dart';
import 'package:currency_app/components/dynamic_text.dart';
import 'package:currency_app/components/homebanner.dart';
import 'package:currency_app/components/search.dart';
import 'package:currency_app/providers/meal_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    /// Fetch categories automatically when home opens
    Future.microtask(() {
      Provider.of<CategoriesProvider>(context, listen: false).fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Location Section
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFF8E8E93),
                                size: 16.0,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                'Location',
                                style: TextStyle(
                                  color: Color(0xFF8E8E93),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            children: [
                              Text(
                                "Al Safa Street, Al Wasi",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF2C2C2E),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.0),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.only(left: 19.0, right: 19.0),
                  child: SizedBox(child: Search()),
                ),

                SizedBox(height: 20.0),

                // Yellow Promo Banner
                Padding(
                  padding: const EdgeInsets.only(left: 19.0, right: 19.0),
                  child: SizedBox(child: Homebanner()),
                ),

                SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 19.0,
                    right: 19.0,
                    bottom: 20.0,
                  ),
                  child: DynamicText(
                    leftText: "Categories",
                    rightText: "See All",
                  ),
                ),
                // Categories (API Render)
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: SizedBox(child: Categories(),),
                )

                // Add bottom nav if needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
