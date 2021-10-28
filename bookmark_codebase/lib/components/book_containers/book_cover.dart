import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  final String image;
  final String name;
  const BookCover({Key? key, this.image = '', required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _makeBookCover(String name, BuildContext context) {
      var size = MediaQuery.of(context).size;
      return Center(
        child: Container(
          height: size.height * 0.1,
          width: size.width * 0.14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: MyColors.blue),
          ),
          child: Center(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .overline!
                  .apply(color: MyColors.blue),
            ),
          ),
        ),
      );
    }

    return image == ''
        ? _makeBookCover(name, context)
        : ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          );
  }
}
