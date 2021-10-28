import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class BookPreview extends StatelessWidget {
  final String bookId;
  const BookPreview({Key? key, required this.bookId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RTLDirection(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: MyColors.blue),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Stack(
            children: [
              // CurvedPage(),
            ],
          )),
    );
  }
}
