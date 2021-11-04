import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/user_inputs/text_form_fields/searching/search_book.dart';
import 'package:bookmark_codebase/utils/constants/size_constants.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  Page2({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RTLDirection(
      child: Scaffold(
        // backgroundColor: Colors.grey,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: Sizes.fromBottom + 48),
                SearchBookTextFormField(controller: _controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
