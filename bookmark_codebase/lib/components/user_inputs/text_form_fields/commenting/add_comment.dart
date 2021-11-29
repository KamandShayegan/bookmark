import 'package:bookmark_codebase/components/buttons/small_button.dart';
import 'package:flutter/material.dart';

class CommentsTextFormField extends StatelessWidget {
  const CommentsTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          cursorColor: Colors.grey,
          maxLines: 4,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
          ),
        ),
        // const SizedBox(height: 24,),
        const Spacer(),
        SmallButton(
          title: Text(
            'ارسال',
            style:
                Theme.of(context).textTheme.caption!.apply(color: Colors.white),
          ),
          onTap: () {},
        )
      ],
    );
  }
}
