import 'package:books_store/core/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Count extends StatelessWidget {
  const Count({super.key, required this.count});

  final int? count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(FontAwesomeIcons.book, color: Color(0xffFFDD4F), size: 16),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            'pages',
            style: Styles.textstyle16.copyWith(fontWeight: FontWeight.w800),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text('($count)', style: Styles.textstyle14),
      ],
    );
  }
}
