// import 'package:bookmark_codebase/utils/constants/color_constants.dart';
// import 'package:bookmark_codebase/utils/enums/button_size.dart';
// import 'package:flutter/material.dart';
//
// class Button extends StatelessWidget {
//   final bool _isPrimary;
//   final bool _isOn;
//   final VoidCallback _onTap;
//   final Widget _title;
//   final ButtonSize _buttonSize;
//
//   Button(
//       {bool isOn = true,
//       bool isPrimary = true,
//       required ButtonSize buttonSize,
//       required Widget title,
//       required VoidCallback onTap})
//       : _onTap = onTap,
//         _isOn = isOn,
//         _buttonSize = buttonSize,
//         _isPrimary = isPrimary,
//         _title = title;
//
//   setOverlayColor(Set<MaterialState> states, bool isPrimary, bool isOn) {
//     if (!isOn && states.contains(MaterialState.pressed)) {
//       return null;
//     } else if (states.contains(MaterialState.pressed)) {
//       return isPrimary ? MyColors.bone.withOpacity(0.3) : MyColors.bone;
//     }
//   }
//
//   double setButtonSize(ButtonSize buttonSize) {
//     if (buttonSize == ButtonSize.none) {
//       return 0;
//     }
//     if (buttonSize == ButtonSize.big) {
//       return 176;
//     }
//     return 160;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double buttonSize = setButtonSize(_buttonSize);
//     return OutlinedButton(
//       style: ButtonStyle(
//         fixedSize: buttonSize == 0
//             ? null
//             : MaterialStateProperty.all<Size>(
//                 Size(buttonSize, 48),
//               ),
//         side: MaterialStateProperty.all<BorderSide>(
//           BorderSide(
//               color: _isOn ? MyColors.bone : MyColors.bone.withOpacity(0.2),
//               width: _isPrimary ? 1 : 3),
//         ),
//         backgroundColor: _isOn
//             ? MaterialStateProperty.all<Color>(
//                 _isPrimary ? MyColors.bone : Colors.white)
//             : MaterialStateProperty.all<Color?>(Colors.grey.withOpacity(0.2)),
//         overlayColor: MaterialStateProperty.resolveWith(
//           (states) => setOverlayColor(states, _isPrimary, _isOn),
//         ),
//       ),
//       onPressed: _isOn
//           ? _onTap
//           : () {
//               print('button is off');
//             },
//       child: _title,
//       // Text(
//       //   _title ?? '',
//       //   textAlign: TextAlign.center,
//       //   style: Theme.of(context).textTheme.button!.apply(
//       //       color: _isOn
//       //           ? (_isPrimary ? Colors.white : MyColors.bone)
//       //           : Colors.grey.withOpacity(0.2)),
//       // ),
//     );
//   }
// }
