import 'package:bookmark_codebase/components/book_containers/each_book_status_card.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/ui/profile/profiles_top_card.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RTLDirection(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ProfilesTopCard(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                ),
                const SizedBox(
                  height: 16,
                ),
                const EachBookStatusCard(
                    numberOfBooks: 10, readingStatus: ReadingStatus.isReading),
                const EachBookStatusCard(
                    numberOfBooks: 10,
                    readingStatus: ReadingStatus.goingToRead),
                const EachBookStatusCard(
                    numberOfBooks: 10, readingStatus: ReadingStatus.readBefore),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
