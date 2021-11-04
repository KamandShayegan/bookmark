import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/book_containers/book_cover.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class GoingToReadContainer extends StatelessWidget {
  final VoidCallback onTap;
  final Book book;
  const GoingToReadContainer(
      {Key? key, required this.onTap, required this.book})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RTLDirection(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(bottom: 16),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.blue, width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BookCover(
              name: book.name,
              image: book.image,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onTap,
                  icon: const Icon(Icons.add, color: MyColors.blue),
                ),
                const Text(
                  'شروع',
                  style: TextStyle(color: MyColors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
