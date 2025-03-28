
import 'package:flutter/material.dart';


void customsnakbar(BuildContext context, String errorMessage, Color color) {
  // إنشاء SnackBar
  final snackBar = SnackBar(
    
    elevation: 6.0,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    backgroundColor: Colors.transparent,
    content: Container(
      padding: const EdgeInsets.only(left: 16.0),
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.white, size: 30),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              errorMessage, // استخدام الرسالة المرسلة مباشرة
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    ),
    duration: const Duration(seconds: 4),
  );

  // عرض SnackBar باستخدام ScaffoldMessenger
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}