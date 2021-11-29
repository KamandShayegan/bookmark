import 'package:bookmark_codebase/components/buttons/small_button.dart';
import 'package:flutter/material.dart';

class BookPreviewFloatingActionButton extends StatelessWidget {
  const BookPreviewFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.white,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: SmallButton(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'میخوام بعدا بخونم',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .apply(color: Colors.white),
                  ),
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ],
              ),
              tappedColor: Colors.black.withOpacity(0.3),
              onTap: () {},
              defaultColor: Colors.black,
            ),
          ),
          Flexible(
            flex: 1,
            child: SmallButton(
              title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'قبلا خوندم',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .apply(color: Colors.black),
                ),
              ),
              onTap: () {},
              defaultColor: Colors.white,
              tappedColor: Colors.black.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}