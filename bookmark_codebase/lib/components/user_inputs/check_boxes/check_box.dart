import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/methods/actions_on_lists/option_selector.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final bool isSelected;
  final String text;

  const CustomCheckBox({Key? key, required this.isSelected, required this.text}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          widget.text,
          style: Theme.of(context).textTheme.subtitle2!.apply(
              color: _isSelected
                  ? MyColors.blueDarker
                  : MyColors.blue.withOpacity(0.9)),
          textAlign: TextAlign.end,
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(
          width: 16,
        ),
        Transform.scale(
          scale: 1.3,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.isSelected?MyColors.blueDarker:Colors.white,
                border: Border.all(color: MyColors.blue)
            ),
          ),
        ),
      ],
    );
  }
}


