// import 'package:currency_app/components/meals_by_category.dart';
import 'package:currency_app/providers/meal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// update your path

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Consumer<CategoriesProvider>(
        builder: (context, provider, _) {
          /// Loading State
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          /// Error State
          if (provider.errorMessage != null) {
            return Center(
              child: Text(
                provider.errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          /// Empty Category List
          if (provider.categories.isEmpty) {
            return Center(
              child: Text(
                "No categories found",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          /// Success State → Show Categories
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: provider.categories.length,
            separatorBuilder: (_, __) => SizedBox(width: 14),
            itemBuilder: (context, index) {
              final category = provider.categories[index];
              // return _categoryItem(category.name, category.thumbnail);
              return GestureDetector(
                onTap: () {},
                child: _categoryItem(category.name, category.thumbnail),
              );
            },
          );
        },
      ),
    );
  }

  /// --- UI stays EXACTLY the same as yours ---
  Widget _categoryItem(String title, String imagePath) {
    return Container(
      padding: EdgeInsets.only(right: 25.0),
      decoration: BoxDecoration(
        color: Color(0xFF2E2E2E),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 2,
              ),
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: 12),

          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
