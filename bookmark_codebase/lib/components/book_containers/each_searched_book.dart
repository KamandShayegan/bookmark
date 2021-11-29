import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/book_containers/book_cover.dart';
import 'package:bookmark_codebase/components/book_preview.dart/book_preview.dart';
import 'package:flutter/material.dart';

class EachSearchedBook extends StatelessWidget {
  final Book book;

  const EachSearchedBook({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>Preview(book: book),));
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(color: Colors.red),
          ),
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          height: size.height * 0.14,
          child: Row(
            children: [
              BookCover(
                name: book.name,
                image: book.image,
              ),
              const SizedBox(width: 8,),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book.name, overflow: TextOverflow.ellipsis,),
                    Text(book.author, overflow: TextOverflow.ellipsis,),

                  ],
                ),
              ),
            ],
          )),
    );
  }
}
