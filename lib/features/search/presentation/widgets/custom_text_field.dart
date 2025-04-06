
import 'package:books_store/core/presentation/widgets/custom_snakbar.dart';
import 'package:books_store/features/search/presentation/manager/search_cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
       onChanged: (value) {
        
        BlocProvider.of<SearchCubitCubit>(context).fetchSearchBooks(value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: 'Search Inter Name YourBook',
        suffixIcon: IconButton(
          onPressed: () {
            final query =
                _textEditingController.text; 
                // الحصول على النص من الحقل
                BlocProvider.of<SearchCubitCubit>(context).fetchSearchBooks(query);
            if (query.isNotEmpty) {
            } else {
              customsnakbar(context,'Please enter a search query',  Colors.grey);
            }
          },
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ),
    );
  }
}
