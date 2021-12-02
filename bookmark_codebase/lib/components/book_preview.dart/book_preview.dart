import 'package:bookmark_codebase/business_logic/models/json_2_dart/book_preview.dart'
    as bp;
import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/business_logic/services/http_services/requests.dart';
import 'package:bookmark_codebase/components/book_containers/book_cover.dart';
import 'package:bookmark_codebase/components/buttons/small_button.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/floating_action_buttons/book_preview_floating_action_button.dart';
import 'package:bookmark_codebase/components/rating/read_only_rating_bar.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/constants/size_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Preview extends StatefulWidget {
  final Book book;

  const Preview({Key? key, required this.book}) : super(key: key);

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  String description = '';

  _fetchPreview() async {
    String id = widget.book.id;
    String book = 'book/';
    String bookName1 = widget.book.name.replaceAll('&', '');
    String bookName = bookName1.replaceAll(' ', '-');
    String customTrim = bookName.replaceAll('--', '-');
    String jsonConcatenated = '$customTrim.json?';
    String temp = 'id=$id&name=$bookName';
    String url = '$book$id/$jsonConcatenated$temp';
    print(url);
    Response response = await HttpRequests().getRequest(url);
    print(response.data);

    description = response.data['pageProps']['bookPage']['book']['description'];
    setState(() {});
    // bp.BookPreview bookPreview = bp.BookPreview.fromJson(response.data);
    // print("description: ${bookPreview.pageProps!.bookPage!.book!.description!}");
  }

  @override
  void initState() {
    _fetchPreview();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('id for this book is: ${widget.book.id}');
    var size = MediaQuery.of(context).size;
    return RTLDirection(
      child: Scaffold(
        // backgroundColor: MyColors.bone,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: MyColors.blue),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(left: 16, top: 8, bottom: 8),
              child: Button(
                title: Text(
                  'شروع این کتاب',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .apply(color: Colors.white),
                ),
                onTap: () {},
                tappedColor: MyColors.blue.withOpacity(0.3),
                defaultColor: MyColors.blue.withOpacity(0.7),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: Sizes.fromBottom),
              Center(
                child: SizedBox(
                  height: size.height * 0.25,
                  width: size.width * 0.3,
                  child: BookCover(
                    name: widget.book.name,
                    image: widget.book.image,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.book.name,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .apply(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(widget.book.author),
              const SizedBox(
                height: 8,
              ),
              ReadOnlyRatingBar(
                rating: widget.book.rate,
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'خلاصه',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .apply(fontWeightDelta: 4, fontSizeDelta: 1),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(description),
                    const SizedBox(
                      height: 56,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: const BookPreviewFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
