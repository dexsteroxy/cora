import 'package:flutter/material.dart';

class DynamicText extends StatelessWidget {
  final String leftText;
  final String rightText;

  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;

  const DynamicText({
    super.key,
    required this.leftText,
    required this.rightText,
    this.onLeftTap,
    this.onRightTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        
        GestureDetector(
          onTap: onLeftTap,
          child: Text(
            leftText,
            style: const TextStyle(
              // color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none, 
            ),
          ),
        ),

     
        GestureDetector(
          onTap: onRightTap,
          child: Text(
            rightText,
            style: const TextStyle(
                  // link-style color
                  color: Color(0xFF8E8E93),
              fontSize: 18,
              fontWeight: FontWeight.w500,
              
            ),
          ),
        ),
      ],
    );
  }
}
