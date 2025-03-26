import 'package:flutter/material.dart';

void errorsnakbar(BuildContext context, String errormessage) {
  String? error;

  final snackBar = SnackBar(
    elevation: 6.0,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    backgroundColor: Colors.transparent,
    content: Container(
      padding: EdgeInsets.all(16.0),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.white, size: 30),
          SizedBox(width: 16),
          Expanded(
            child: Text(
             error!,
              style: TextStyle(
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
    duration: Duration(seconds: 4),
   
  );

  // عرض SnackBar باستخدام ScaffoldMessenger
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
