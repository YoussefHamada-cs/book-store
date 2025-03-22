import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController
        .dispose(); // تأكد من التخلص من controller عند إنهاء الحالة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      onSubmitted: (value) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {
            final query =
                _textEditingController.text; // الحصول على النص من الحقل
            if (query.isNotEmpty) {
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter a search query')),
              );
            }
          },
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ),
    );
  }
}
