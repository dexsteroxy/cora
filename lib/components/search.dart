import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final Function(String) onSearch;

  const Search({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFF2E2E2E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Color(0xFFB3B3B3), size: 24),
          SizedBox(width: 10),

          // SEARCH TEXTFIELD
          Expanded(
            child: TextField(
              onChanged: onSearch,   // <-- MAGIC 🔥
              style: TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Color(0xFFB3B3B3),
                  fontSize: 18,
                ),
              ),
            ),
          ),

          SizedBox(width: 10),
          Text(
            "Filter",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 10),

          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(Icons.tune, size: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
