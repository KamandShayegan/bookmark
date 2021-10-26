import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/user_inputs/text_form_fields/comment_text_form_field.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/constants/string_constants.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddComment extends StatelessWidget {
  const AddComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return RTLDirection(
      child: AlertDialog(

        title: const AddCommentTitle(),
        content: Container(
            height: size.height * 0.27,
          width: size.width * 0.7,

          child: CommentsTextFormField(),

        ),
      ),
    );
  }
}

class AddCommentTitle extends StatelessWidget {
  const AddCommentTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SvgPicture.asset(
          SvgPaths.comment,
          color: MyColors.bone,
          height: size.height * 0.045,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(StringConstants.addComment),
      ],
    );
  }
}
