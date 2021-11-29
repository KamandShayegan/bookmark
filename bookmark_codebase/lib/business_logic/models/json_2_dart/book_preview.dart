// /*
// // To parse this JSON data, do
// //
// //     final bookPreview = bookPreviewFromJson(jsonString);
//
// import 'package:meta/meta.dart';
// import 'dart:convert';
//
// BookPreview bookPreviewFromJson(String str) =>
//     BookPreview.fromJson(json.decode(str));
//
// String bookPreviewToJson(BookPreview data) => json.encode(data.toJson());
//
// class BookPreview {
//   BookPreview({
//     @required this.pageProps,
//     @required this.nSsp,
//   });
//
//   PageProps? pageProps;
//   bool? nSsp;
//
//   factory BookPreview.fromJson(Map<String, dynamic> json) => BookPreview(
//         pageProps: PageProps.fromJson(json["pageProps"]??{}),
//         nSsp: json["__N_SSP"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "pageProps": pageProps!.toJson(),
//         "__N_SSP": nSsp,
//       };
// }
//
// class PageProps {
//   PageProps({
//     @required this.bookPage,
//     @required this.breadcrumb,
//     @required this.seoData,
//     @required this.params,
//   });
//
//   BookPage? bookPage;
//   List<Breadcrumb>? breadcrumb;
//   SeoData? seoData;
//   Params? params;
//
//   factory PageProps.fromJson(Map<String, dynamic> json) => PageProps(
//         bookPage: BookPage.fromJson(json["bookPage"]??{}),
//         breadcrumb: List<Breadcrumb>.from(
//             json["breadcrumb"].map((x) => Breadcrumb.fromJson(x))),
//         seoData: SeoData.fromJson(json["seoData"]),
//         params: Params.fromJson(json["params"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "bookPage": bookPage!.toJson(),
//         "breadcrumb": List<dynamic>.from(breadcrumb!.map((x) => x.toJson())),
//         "seoData": seoData!.toJson(),
//         "params": params!.toJson(),
//       };
// }
//
// class BookPage {
//   BookPage({
//     @required this.book,
//     @required this.comments,
//     @required this.commentsCount,
//     @required this.relatedBooks,
//     @required this.shareText,
//     @required this.quotes,
//     @required this.quotesCount,
//     @required this.hideOffCoupon,
//     @required this.pageTitle,
//   });
//
//   Book? book;
//   List<Comment>? comments;
//   int? commentsCount;
//   List<RelatedBook>? relatedBooks;
//   String? shareText;
//   List<dynamic>? quotes;
//   int? quotesCount;
//   bool? hideOffCoupon;
//   String? pageTitle;
//
//   factory BookPage.fromJson(Map<String, dynamic> json) => BookPage(
//         book: Book.fromJson(json["book"]??{}),
//         comments: [],
//         commentsCount: json["commentsCount"],
//         relatedBooks: List<RelatedBook>.from(
//             json["relatedBooks"].map((x) => RelatedBook.fromJson(x))),
//         shareText: json["shareText"],
//         quotes: List<dynamic>.from(json["quotes"].map((x) => x)),
//         quotesCount: json["quotesCount"],
//         hideOffCoupon: json["hideOffCoupon"],
//         pageTitle: json["pageTitle"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "book": book!.toJson(),
//         "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
//         "commentsCount": commentsCount,
//         "relatedBooks":
//             List<dynamic>.from(relatedBooks!.map((x) => x.toJson())),
//         "shareText": shareText,
//         "quotes": List<dynamic>.from(quotes!.map((x) => x)),
//         "quotesCount": quotesCount,
//         "hideOffCoupon": hideOffCoupon,
//         "pageTitle": pageTitle,
//       };
// }
//
// class Book {
//   Book({
//     @required this.id,
//     @required this.title,
//     @required this.sourceBookId,
//     @required this.canonicalId,
//     @required this.subtitle,
//     @required this.description,
//     @required this.htmlDescription,
//     @required this.publisherId,
//     @required this.publisherSlug,
//     @required this.price,
//     @required this.numberOfPages,
//     @required this.rating,
//     @required this.rates,
//     @required this.rateDetails,
//     @required this.sticker,
//     @required this.hasTemporaryOff,
//     @required this.beforeOffPrice,
//     @required this.offText,
//     @required this.priceColor,
//     @required this.isRtl,
//     @required this.showOverlay,
//     @required this.physicalPrice,
//     @required this.isbn,
//     @required this.publishDate,
//     @required this.destination,
//     @required this.type,
//     @required this.refId,
//     @required this.coverUri,
//     @required this.shareUri,
//     @required this.shareText,
//     @required this.publisher,
//     @required this.authors,
//     @required this.files,
//     @required this.labels,
//     @required this.categories,
//     @required this.subscriptionAvailable,
//     @required this.newsItemCreationDate,
//     @required this.state,
//     @required this.encrypted,
//     @required this.currencyPrice,
//     @required this.currencyBeforeOffPrice,
//     @required this.fileType,
//     @required this.isAudio,
//     @required this.prefix,
//     @required this.jsonDescription,
//     @required this.faqs,
//   });
//
//   int? id;
//   String? title;
//   int? sourceBookId;
//   int? canonicalId;
//   String? subtitle;
//   String? description;
//   String? htmlDescription;
//   int? publisherId;
//   PublisherSlug? publisherSlug;
//   int? price;
//   int? numberOfPages;
//   num? rating;
//   List<Rate>? rates;
//   List<RateDetail>? rateDetails;
//   String? sticker;
//   bool? hasTemporaryOff;
//   int? beforeOffPrice;
//   String? offText;
//   String? priceColor;
//   bool? isRtl;
//   bool? showOverlay;
//   int? physicalPrice;
//   String? isbn;
//   String? publishDate;
//   int? destination;
//   Type? type;
//   RefId? refId;
//   String? coverUri;
//   String? shareUri;
//   String? shareText;
//   PublisherEnum? publisher;
//   List<BookAuthor>? authors;
//   List<FileElement>? files;
//   List<Label>? labels;
//   List<Category>? categories;
//   bool? subscriptionAvailable;
//   DateTime? newsItemCreationDate;
//   int? state;
//   bool? encrypted;
//   double? currencyPrice;
//   double? currencyBeforeOffPrice;
//   String? fileType;
//   bool? isAudio;
//   String? prefix;
//   dynamic jsonDescription;
//   dynamic faqs;
//
//   factory Book.fromJson(Map<String, dynamic> json) => Book(
//         id: json["id"],
//         title: json["title"],
//         sourceBookId: json["sourceBookId"],
//         canonicalId: json["canonicalId"],
//         subtitle: json["subtitle"],
//         description: json["description"],
//         htmlDescription: json["htmlDescription"],
//         publisherId: json["PublisherID"],
//         publisherSlug: publisherSlugValues.map![json["publisherSlug"]],
//         price: json["price"],
//         numberOfPages: json["numberOfPages"],
//         rating: json["rating"],
//         rates: [],
//         rateDetails: [],
//         sticker: json["sticker"],
//         hasTemporaryOff: json["hasTemporaryOff"],
//         beforeOffPrice: json["beforeOffPrice"],
//         offText: json["offText"],
//         priceColor: json["priceColor"],
//         isRtl: json["isRtl"],
//         showOverlay: json["showOverlay"],
//         physicalPrice: json["PhysicalPrice"],
//         isbn: json["ISBN"],
//         publishDate: json["publishDate"],
//         destination: json["destination"],
//         type: typeValues.map![json["type"]],
//         refId: refIdValues.map![json["refId"]],
//         coverUri: json["coverUri"],
//         shareUri: json["shareUri"],
//         shareText: json["shareText"],
//         publisher: publisherEnumValues.map![json["publisher"]],
//         authors: [],
//         files: [],
//         labels: [],
//         categories: [],
//         subscriptionAvailable: json["subscriptionAvailable"],
//         newsItemCreationDate: DateTime.now(),
//         state: json["state"],
//         encrypted: json["encrypted"],
//         currencyPrice: json["currencyPrice"],
//         currencyBeforeOffPrice: json["currencyBeforeOffPrice"],
//         fileType: json["fileType"],
//         isAudio: json["isAudio"],
//         prefix: json["prefix"],
//         jsonDescription: json["jsonDescription"],
//         faqs: json["faqs"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "sourceBookId": sourceBookId,
//         "canonicalId": canonicalId,
//         "subtitle": subtitle,
//         "description": description,
//         "htmlDescription": htmlDescription,
//         "PublisherID": publisherId,
//         "publisherSlug": publisherSlugValues.reverse[publisherSlug],
//         "price": price,
//         "numberOfPages": numberOfPages,
//         "rating": rating,
//         "rates": List<dynamic>.from(rates!.map((x) => x.toJson())),
//         "rateDetails": List<dynamic>.from(rateDetails!.map((x) => x.toJson())),
//         "sticker": sticker,
//         "hasTemporaryOff": hasTemporaryOff,
//         "beforeOffPrice": beforeOffPrice,
//         "offText": offText,
//         "priceColor": priceColor,
//         "isRtl": isRtl,
//         "showOverlay": showOverlay,
//         "PhysicalPrice": physicalPrice,
//         "ISBN": isbn,
//         "publishDate": publishDate,
//         "destination": destination,
//         "type": typeValues.reverse[type],
//         "refId": refIdValues.reverse[refId],
//         "coverUri": coverUri,
//         "shareUri": shareUri,
//         "shareText": shareText,
//         "publisher": publisherEnumValues.reverse[publisher],
//         "authors": List<dynamic>.from(authors!.map((x) => x.toJson())),
//         "files": List<dynamic>.from(files!.map((x) => x.toJson())),
//         "labels": List<dynamic>.from(labels!.map((x) => x.toJson())),
//         "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
//         "subscriptionAvailable": subscriptionAvailable,
//         "newsItemCreationDate": newsItemCreationDate!.toIso8601String(),
//         "state": state,
//         "encrypted": encrypted,
//         "currencyPrice": currencyPrice,
//         "currencyBeforeOffPrice": currencyBeforeOffPrice,
//         "fileType": fileType,
//         "isAudio": isAudio,
//         "prefix": prefix,
//         "jsonDescription": jsonDescription,
//         "faqs": faqs,
//       };
// }
//
// class BookAuthor {
//   BookAuthor({
//     @required this.id,
//     @required this.firstName,
//     @required this.lastName,
//     @required this.type,
//     @required this.slug,
//   });
//
//   int? id;
//   String? firstName;
//   String? lastName;
//   int? type;
//   String? slug;
//
//   factory BookAuthor.fromJson(Map<String, dynamic> json) => BookAuthor(
//         id: json["id"],
//         firstName: json["firstName"],
//         lastName: json["lastName"],
//         type: json["type"],
//         slug: json["slug"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "firstName": firstName,
//         "lastName": lastName,
//         "type": type,
//         "slug": slug,
//       };
// }
//
// class Category {
//   Category({
//     @required this.id,
//     @required this.parent,
//     @required this.title,
//     @required this.slug,
//   });
//
//   int? id;
//   int? parent;
//   String? title;
//   String? slug;
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         parent: json["parent"],
//         title: json["title"],
//         slug: json["slug"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "parent": parent,
//         "title": title,
//         "slug": slug,
//       };
// }
//
// class FileElement {
//   FileElement({
//     @required this.id,
//     @required this.size,
//     @required this.type,
//     @required this.bookId,
//     @required this.sequenceNo,
//   });
//
//   int? id;
//   int? size;
//   int? type;
//   int? bookId;
//   int? sequenceNo;
//
//   factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
//         id: json["id"],
//         size: json["size"],
//         type: json["type"],
//         bookId: json["bookId"],
//         sequenceNo: json["sequenceNo"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "size": size,
//         "type": type,
//         "bookId": bookId,
//         "sequenceNo": sequenceNo,
//       };
// }
//
// class Label {
//   Label({
//     @required this.tagId,
//     @required this.tag,
//   });
//
//   int? tagId;
//   String? tag;
//
//   factory Label.fromJson(Map<String, dynamic> json) => Label(
//         tagId: json["tagID"],
//         tag: json["tag"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "tagID": tagId,
//         "tag": tag,
//       };
// }
//
// enum PublisherEnum { EMPTY }
//
// final publisherEnumValues = EnumValues({"نشر ماهی": PublisherEnum.EMPTY});
//
// enum PublisherSlug { EMPTY }
//
// final publisherSlugValues = EnumValues({"نشر-ماهی": PublisherSlug.EMPTY});
//
// class RateDetail {
//   RateDetail({
//     @required this.id,
//     @required this.title,
//     @required this.point,
//   });
//
//   int? id;
//   Title? title;
//   double? point;
//
//   factory RateDetail.fromJson(Map<String, dynamic> json) => RateDetail(
//         id: json["id"],
//         title: titleValues.map![json["title"]],
//         point: json["point"].toDouble(),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": titleValues.reverse[title],
//         "point": point,
//       };
// }
//
// enum Title { EMPTY, TITLE, PURPLE, FLUFFY, TENTACLED, STICKY }
//
// final titleValues = EnumValues({
//   "متن روان": Title.EMPTY,
//   "مستند بودن": Title.FLUFFY,
//   "ترجمه": Title.PURPLE,
//   "پیوستگی مطالب": Title.STICKY,
//   "داستان پردازی": Title.TENTACLED,
//   "جذابیت": Title.TITLE
// });
//
// class Rate {
//   Rate({
//     @required this.value,
//     @required this.count,
//   });
//
//   int? value;
//   int? count;
//
//   factory Rate.fromJson(Map<String, dynamic> json) => Rate(
//         value: json["value"],
//         count: json["count"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "value": value,
//         "count": count,
//       };
// }
//
// enum RefId { EMPTY, RELATED_BOOK_PUBLISHER_1055291 }
//
// final refIdValues = EnumValues({
//   "": RefId.EMPTY,
//   "related-book-publisher-105529.1": RefId.RELATED_BOOK_PUBLISHER_1055291
// });
//
// enum Type { TEXT }
//
// final typeValues = EnumValues({"Text": Type.TEXT});
//
// class Comment {
//   Comment({
//     @required this.id,
//     @required this.accountId,
//     @required this.verifiedAccount,
//     @required this.nickname,
//     @required this.profileImageUri,
//     @required this.bookId,
//     @required this.bookCoverUri,
//     @required this.bookType,
//     @required this.bookName,
//     @required this.creationDate,
//     @required this.rate,
//     @required this.latestReplies,
//     @required this.repliesCount,
//     @required this.likeCount,
//     @required this.dislikeCount,
//     @required this.comment,
//     @required this.isLiked,
//     @required this.isDisliked,
//     @required this.rateDetails,
//     @required this.recommendation,
//   });
//
//   int? id;
//   int? accountId;
//   bool? verifiedAccount;
//   String? nickname;
//   String? profileImageUri;
//   int? bookId;
//   String? bookCoverUri;
//   Type? bookType;
//   String? bookName;
//   String? creationDate;
//   int? rate;
//   List<Comment>? latestReplies;
//   int? repliesCount;
//   int? likeCount;
//   int? dislikeCount;
//   String? comment;
//   bool? isLiked;
//   bool? isDisliked;
//   List<RateDetail>? rateDetails;
//   int? recommendation;
//
//   factory Comment.fromJson(Map<String, dynamic> json) => Comment(
//         id: json["id"],
//         accountId: json["accountId"],
//         verifiedAccount: json["verifiedAccount"],
//         nickname: json["nickname"],
//         profileImageUri: json["profileImageUri"],
//         bookId: json["bookId"],
//         bookCoverUri: json["bookCoverUri"],
//         bookType:
//             json["bookType"] == null ? null : typeValues.map![json["bookType"]],
//         bookName: json["bookName"],
//         creationDate: json["creationDate"],
//         rate: json["rate"],
//         latestReplies: json["latestReplies"] == null
//             ? null
//             : List<Comment>.from(
//                 json["latestReplies"].map((x) => Comment.fromJson(x))),
//         repliesCount: json["repliesCount"],
//         likeCount: json["likeCount"],
//         dislikeCount: json["dislikeCount"],
//         comment: json["comment"],
//         isLiked: json["isLiked"],
//         isDisliked: json["isDisliked"],
//         rateDetails: List<RateDetail>.from(
//             json["rateDetails"].map((x) => RateDetail.fromJson(x))),
//         recommendation: json["recommendation"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "accountId": accountId,
//         "verifiedAccount": verifiedAccount,
//         "nickname": nickname,
//         "profileImageUri": profileImageUri,
//         "bookId": bookId,
//         "bookCoverUri": bookCoverUri,
//         "bookType": bookType == null ? null : typeValues.reverse[bookType],
//         "bookName": bookName,
//         "creationDate": creationDate,
//         "rate": rate,
//         "latestReplies": latestReplies == null
//             ? null
//             : List<dynamic>.from(latestReplies!.map((x) => x.toJson())),
//         "repliesCount": repliesCount,
//         "likeCount": likeCount,
//         "dislikeCount": dislikeCount,
//         "comment": comment,
//         "isLiked": isLiked,
//         "isDisliked": isDisliked,
//         "rateDetails": List<dynamic>.from(rateDetails!.map((x) => x.toJson())),
//         "recommendation": recommendation,
//       };
// }
//
// class RelatedBook {
//   RelatedBook({
//     @required this.type,
//     @required this.title,
//     @required this.backgroundStyle,
//     @required this.bookData,
//     @required this.destination,
//     @required this.backgroundConfig,
//   });
//
//   int? type;
//   String? title;
//   int? backgroundStyle;
//   BookData? bookData;
//   RelatedBookDestination? destination;
//   BackgroundConfig? backgroundConfig;
//
//   factory RelatedBook.fromJson(Map<String, dynamic> json) => RelatedBook(
//         type: json["type"],
//         title: json["title"],
//         backgroundStyle: json["backgroundStyle"],
//         bookData: BookData.fromJson(json["bookData"]),
//         destination: RelatedBookDestination.fromJson(json["destination"]),
//         backgroundConfig: BackgroundConfig.fromJson(json["backgroundConfig"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "type": type,
//         "title": title,
//         "backgroundStyle": backgroundStyle,
//         "bookData": bookData!.toJson(),
//         "destination": destination!.toJson(),
//         "backgroundConfig": backgroundConfig!.toJson(),
//       };
// }
//
// class BackgroundConfig {
//   BackgroundConfig({
//     @required this.style,
//   });
//
//   int? style;
//
//   factory BackgroundConfig.fromJson(Map<String, dynamic> json) =>
//       BackgroundConfig(
//         style: json["style"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "style": style,
//       };
// }
//
// class BookData {
//   BookData({
//     @required this.books,
//     @required this.layout,
//     @required this.showPrice,
//   });
//
//   List<Book>? books;
//   int? layout;
//   bool? showPrice;
//
//   factory BookData.fromJson(Map<String, dynamic> json) => BookData(
//         books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
//         layout: json["layout"],
//         showPrice: json["showPrice"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "books": List<dynamic>.from(books!.map((x) => x.toJson())),
//         "layout": layout,
//         "showPrice": showPrice,
//       };
// }
//
// class RelatedBookDestination {
//   RelatedBookDestination({
//     @required this.type,
//     @required this.pageTitle,
//     @required this.order,
//     @required this.filters,
//     @required this.navigationPage,
//     @required this.operationType,
//     @required this.bookId,
//   });
//
//   int? type;
//   PublisherEnum? pageTitle;
//   int? order;
//   PurpleFilters? filters;
//   int? navigationPage;
//   int? operationType;
//   int? bookId;
//
//   factory RelatedBookDestination.fromJson(Map<String, dynamic> json) =>
//       RelatedBookDestination(
//         type: json["type"],
//         pageTitle: publisherEnumValues.map![json["pageTitle"]],
//         order: json["order"],
//         filters: PurpleFilters.fromJson(json["filters"]),
//         navigationPage: json["navigationPage"],
//         operationType: json["operationType"],
//         bookId: json["bookId"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "type": type,
//         "pageTitle": publisherEnumValues.reverse[pageTitle],
//         "order": order,
//         "filters": filters!.toJson(),
//         "navigationPage": navigationPage,
//         "operationType": operationType,
//         "bookId": bookId,
//       };
// }
//
// class PurpleFilters {
//   PurpleFilters({
//     @required this.list,
//     @required this.refId,
//   });
//
//   List<ListElement>? list;
//   RefId? refId;
//
//   factory PurpleFilters.fromJson(Map<String, dynamic> json) => PurpleFilters(
//         list: List<ListElement>.from(
//             json["list"].map((x) => ListElement.fromJson(x))),
//         refId: refIdValues.map![json["refId"]],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list!.map((x) => x.toJson())),
//         "refId": refIdValues.reverse[refId],
//       };
// }
//
// class ListElement {
//   ListElement({
//     @required this.type,
//     @required this.value,
//   });
//
//   int? type;
//   int? value;
//
//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         type: json["type"],
//         value: json["value"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "type": type,
//         "value": value,
//       };
// }
//
// class Breadcrumb {
//   Breadcrumb({
//     @required this.label,
//     @required this.destination,
//   });
//
//   String? label;
//   BreadcrumbDestination? destination;
//
//   factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
//         label: json["label"],
//         destination: BreadcrumbDestination.fromJson(json["destination"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "label": label,
//         "destination": destination!.toJson(),
//       };
// }
//
// class BreadcrumbDestination {
//   BreadcrumbDestination({
//     @required this.type,
//     @required this.filters,
//     @required this.book,
//   });
//
//   int? type;
//   FluffyFilters? filters;
//   Book? book;
//
//   factory BreadcrumbDestination.fromJson(Map<String, dynamic> json) =>
//       BreadcrumbDestination(
//         type: json["type"],
//         filters: json["filters"] == null
//             ? null
//             : FluffyFilters.fromJson(json["filters"]),
//         book: json["book"] == null ? null : Book.fromJson(json["book"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "type": type,
//         "filters": filters == null ? null : filters!.toJson(),
//         "book": book == null ? null : book!.toJson(),
//       };
// }
//
// class FluffyFilters {
//   FluffyFilters({
//     @required this.slug,
//     @required this.list,
//   });
//
//   String? slug;
//   List<ListElement>? list;
//
//   factory FluffyFilters.fromJson(Map<String, dynamic> json) => FluffyFilters(
//         slug: json["slug"],
//         list: List<ListElement>.from(
//             json["list"].map((x) => ListElement.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "slug": slug,
//         "list": List<dynamic>.from(list!.map((x) => x.toJson())),
//       };
// }
//
// class Params {
//   Params({
//     @required this.id,
//     @required this.name,
//   });
//
//   String? id;
//   String? name;
//
//   factory Params.fromJson(Map<String, dynamic> json) => Params(
//         id: json["id"],
//         name: json["name"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//       };
// }
//
// class SeoData {
//   SeoData({
//     @required this.title,
//     @required this.desc,
//     @required this.bookJsonLd,
//     @required this.productJsonLd,
//     @required this.listItemJsonLd,
//     @required this.faqJsonLd,
//     @required this.canonical,
//     @required this.lcp,
//     @required this.alternate,
//   });
//
//   String? title;
//   String? desc;
//   BookJsonLd? bookJsonLd;
//   ProductJsonLd? productJsonLd;
//   ListItemJsonLd? listItemJsonLd;
//   FaqJsonLd? faqJsonLd;
//   String? canonical;
//   String? lcp;
//   String? alternate;
//
//   factory SeoData.fromJson(Map<String, dynamic> json) => SeoData(
//         title: json["title"],
//         desc: json["desc"],
//         bookJsonLd: BookJsonLd.fromJson(json["bookJsonLd"]),
//         productJsonLd: ProductJsonLd.fromJson(json["productJsonLd"]),
//         listItemJsonLd: ListItemJsonLd.fromJson(json["listItemJsonLd"]),
//         faqJsonLd: FaqJsonLd.fromJson(json["faqJsonLd"]),
//         canonical: json["canonical"],
//         lcp: json["LCP"],
//         alternate: json["alternate"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "desc": desc,
//         "bookJsonLd": bookJsonLd!.toJson(),
//         "productJsonLd": productJsonLd!.toJson(),
//         "listItemJsonLd": listItemJsonLd!.toJson(),
//         "faqJsonLd": faqJsonLd!.toJson(),
//         "canonical": canonical,
//         "LCP": lcp,
//         "alternate": alternate,
//       };
// }
//
// class BookJsonLd {
//   BookJsonLd({
//     @required this.context,
//     @required this.bookFormat,
//     @required this.numberOfPages,
//     @required this.name,
//     @required this.type,
//     @required this.id,
//     @required this.url,
//     @required this.description,
//     @required this.author,
//     @required this.translator,
//     @required this.workExample,
//     @required this.genre,
//     @required this.publisher,
//     @required this.aggregateRating,
//     @required this.review,
//   });
//
//   String? context;
//   String? bookFormat;
//   int? numberOfPages;
//   String? name;
//   String? type;
//   String? id;
//   String? url;
//   String? description;
//   List<BookJsonLdAuthor>? author;
//   List<PublisherElement>? translator;
//   WorkExample? workExample;
//   String? genre;
//   PublisherElement? publisher;
//   AggregateRating? aggregateRating;
//   List<BookJsonLdReview>? review;
//
//   factory BookJsonLd.fromJson(Map<String, dynamic> json) => BookJsonLd(
//         context: json["@context"],
//         bookFormat: json["bookFormat"],
//         numberOfPages: json["numberOfPages"],
//         name: json["name"],
//         type: json["@type"],
//         id: json["@id"],
//         url: json["url"],
//         description: json["description"],
//         author: List<BookJsonLdAuthor>.from(
//             json["author"].map((x) => BookJsonLdAuthor.fromJson(x))),
//         translator: List<PublisherElement>.from(
//             json["translator"].map((x) => PublisherElement.fromJson(x))),
//         workExample: WorkExample.fromJson(json["workExample"]),
//         genre: json["genre"],
//         publisher: PublisherElement.fromJson(json["publisher"]),
//         aggregateRating: AggregateRating.fromJson(json["aggregateRating"]),
//         review: List<BookJsonLdReview>.from(
//             json["review"].map((x) => BookJsonLdReview.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@context": context,
//         "bookFormat": bookFormat,
//         "numberOfPages": numberOfPages,
//         "name": name,
//         "@type": type,
//         "@id": id,
//         "url": url,
//         "description": description,
//         "author": List<dynamic>.from(author!.map((x) => x.toJson())),
//         "translator": List<dynamic>.from(translator!.map((x) => x.toJson())),
//         "workExample": workExample!.toJson(),
//         "genre": genre,
//         "publisher": publisher!.toJson(),
//         "aggregateRating": aggregateRating!.toJson(),
//         "review": List<dynamic>.from(review!.map((x) => x.toJson())),
//       };
// }
//
// class AggregateRating {
//   AggregateRating({
//     @required this.type,
//     @required this.ratingValue,
//     @required this.ratingCount,
//     @required this.bestRating,
//     @required this.worstRating,
//   });
//
//   String? type;
//   String? ratingValue;
//   String? ratingCount;
//   String? bestRating;
//   String? worstRating;
//
//   factory AggregateRating.fromJson(Map<String, dynamic> json) =>
//       AggregateRating(
//         type: json["@type"],
//         ratingValue: json["ratingValue"],
//         ratingCount: json["ratingCount"],
//         bestRating: json["bestRating"],
//         worstRating: json["worstRating"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": type,
//         "ratingValue": ratingValue,
//         "ratingCount": ratingCount,
//         "bestRating": bestRating,
//         "worstRating": worstRating,
//       };
// }
//
// class BookJsonLdAuthor {
//   BookJsonLdAuthor({
//     @required this.type,
//     @required this.name,
//     @required this.id,
//   });
//
//   TypeEnum? type;
//   String? name;
//   String? id;
//
//   factory BookJsonLdAuthor.fromJson(Map<String, dynamic> json) =>
//       BookJsonLdAuthor(
//         type: typeEnumValues.map![json["@type"]],
//         name: json["name"],
//         id: json["@id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": typeEnumValues.reverse[type],
//         "name": name,
//         "@id": id,
//       };
// }
//
// enum TypeEnum { ORGANIZATION, PERSON }
//
// final typeEnumValues = EnumValues(
//     {"Organization": TypeEnum.ORGANIZATION, "Person": TypeEnum.PERSON});
//
// class PublisherElement {
//   PublisherElement({
//     @required this.type,
//     @required this.name,
//     @required this.url,
//   });
//
//   TypeEnum? type;
//   String? name;
//   String? url;
//
//   factory PublisherElement.fromJson(Map<String, dynamic> json) =>
//       PublisherElement(
//         type: typeEnumValues.map![json["@type"]],
//         name: json["name"],
//         url: json["url"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": typeEnumValues.reverse[type],
//         "name": name,
//         "url": url,
//       };
// }
//
// class BookJsonLdReview {
//   BookJsonLdReview({
//     @required this.type,
//     @required this.author,
//     @required this.datePublished,
//     @required this.reviewRating,
//   });
//
//   String? type;
//   String? author;
//   String? datePublished;
//   PurpleReviewRating? reviewRating;
//
//   factory BookJsonLdReview.fromJson(Map<String, dynamic> json) =>
//       BookJsonLdReview(
//         type: json["@type"],
//         author: json["author"],
//         datePublished: json["datePublished"],
//         reviewRating: PurpleReviewRating.fromJson(json["reviewRating"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": type,
//         "author": author,
//         "datePublished": datePublished,
//         "reviewRating": reviewRating!.toJson(),
//       };
// }
//
// class PurpleReviewRating {
//   PurpleReviewRating({
//     @required this.type,
//     @required this.ratingValue,
//   });
//
//   String? type;
//   int? ratingValue;
//
//   factory PurpleReviewRating.fromJson(Map<String, dynamic> json) =>
//       PurpleReviewRating(
//         type: json["@type"],
//         ratingValue: json["ratingValue"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": type,
//         "ratingValue": ratingValue,
//       };
// }
//
// class WorkExample {
//   WorkExample({
//     @required this.type,
//     @required this.id,
//     @required this.image,
//     @required this.inLanguage,
//     @required this.isbn,
//     @required this.potentialAction,
//   });
//
//   String? type;
//   String? id;
//   String? image;
//   String? inLanguage;
//   String? isbn;
//   PotentialAction? potentialAction;
//
//   factory WorkExample.fromJson(Map<String, dynamic> json) => WorkExample(
//         type: json["@type"],
//         id: json["@id"],
//         image: json["image"],
//         inLanguage: json["inLanguage"],
//         isbn: json["isbn"],
//         potentialAction: PotentialAction.fromJson(json["potentialAction"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": type,
//         "@id": id,
//         "image": image,
//         "inLanguage": inLanguage,
//         "isbn": isbn,
//         "potentialAction": potentialAction!.toJson(),
//       };
// }
//
// class PotentialAction {
//   PotentialAction({
//     @required this.type,
//     @required this.expectsAcceptanceOf,
//     @required this.target,
//   });
//
//   String? type;
//   ExpectsAcceptanceOf? expectsAcceptanceOf;
//   Target? target;
//
//   factory PotentialAction.fromJson(Map<String, dynamic> json) =>
//       PotentialAction(
//         type: json["@type"],
//         expectsAcceptanceOf:
//             ExpectsAcceptanceOf.fromJson(json["expectsAcceptanceOf"]),
//         target: Target.fromJson(json["target"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": type,
//         "expectsAcceptanceOf": expectsAcceptanceOf!.toJson(),
//         "target": target!.toJson(),
//       };
// }
//
// class ExpectsAcceptanceOf {
//   ExpectsAcceptanceOf({
//     @required this.type,
//     @required this.category,
//     @required this.availability,
//     @required this.eligibleRegion,
//     @required this.price,
//     @required this.priceCurrency,
//   });
//
//   String? type;
//   String? category;
//   String? availability;
//   EligibleRegion? eligibleRegion;
//   int? price;
//   String? priceCurrency;
//
//   factory ExpectsAcceptanceOf.fromJson(Map<String, dynamic> json) =>
//       ExpectsAcceptanceOf(
//         type: json["@type"],
//         category: json["category"],
//         availability: json["availability"],
//         eligibleRegion: EligibleRegion.fromJson(json["eligibleRegion"]),
//         price: json["price"],
//         priceCurrency: json["priceCurrency"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": type,
//         "category": category,
//         "availability": availability,
//         "eligibleRegion": eligibleRegion!.toJson(),
//         "price": price,
//         "priceCurrency": priceCurrency,
//       };
// }
//
// class EligibleRegion {
//   EligibleRegion({
//     @required this.type,
//     @required this.name,
//   });
//
//   String? type;
//   String? name;
//
//   factory EligibleRegion.fromJson(Map<String, dynamic> json) => EligibleRegion(
//         type: json["@type"],
//         name: json["name"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": type,
//         "name": name,
//       };
// }
//
// class Target {
//   Target({
//     @required this.type,
//     @required this.actionPlatform,
//     @required this.urlTemplate,
//   });
//
//   String? type;
//   List<String>? actionPlatform;
//   String? urlTemplate;
//
//   factory Target.fromJson(Map<String, dynamic> json) => Target(
//         type: json["@type"],
//         actionPlatform: List<String>.from(json["actionPlatform"].map((x) => x)),
//         urlTemplate: json["urlTemplate"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": type,
//         "actionPlatform": List<dynamic>.from(actionPlatform!.map((x) => x)),
//         "urlTemplate": urlTemplate,
//       };
// }
//
// class FaqJsonLd {
//   FaqJsonLd();
//
//   factory FaqJsonLd.fromJson(Map<String, dynamic> json) => FaqJsonLd();
//
//   Map<String, dynamic> toJson() => {};
// }
//
// class ListItemJsonLd {
//   ListItemJsonLd({
//     @required this.context,
//     @required this.type,
//     @required this.numberOfItems,
//     @required this.itemListElement,
//   });
//
//   String? context;
//   String? type;
//   int? numberOfItems;
//   List<ItemListElement>? itemListElement;
//
//   factory ListItemJsonLd.fromJson(Map<String, dynamic> json) => ListItemJsonLd(
//         context: json["@context"],
//         type: json["@type"],
//         numberOfItems: json["numberOfItems"],
//         itemListElement: List<ItemListElement>.from(
//             json["itemListElement"].map((x) => ItemListElement.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@context": context,
//         "@type": type,
//         "numberOfItems": numberOfItems,
//         "itemListElement":
//             List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
//       };
// }
//
// class ItemListElement {
//   ItemListElement({
//     @required this.type,
//     @required this.name,
//     @required this.image,
//     @required this.url,
//     @required this.position,
//     @required this.author,
//   });
//
//   String? type;
//   String? name;
//   String? image;
//   String? url;
//   int? position;
//   List<PublisherElement>? author;
//
//   factory ItemListElement.fromJson(Map<String, dynamic> json) =>
//       ItemListElement(
//         type: json["@type"],
//         name: json["name"],
//         image: json["image"],
//         url: json["url"],
//         position: json["position"],
//         author: List<PublisherElement>.from(
//             json["author"].map((x) => PublisherElement.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": type,
//         "name": name,
//         "image": image,
//         "url": url,
//         "position": position,
//         "author": List<dynamic>.from(author!.map((x) => x.toJson())),
//       };
// }
//
// class ProductJsonLd {
//   ProductJsonLd({
//     @required this.context,
//     @required this.type,
//     @required this.additionalType,
//     @required this.name,
//     @required this.description,
//     @required this.image,
//     @required this.sku,
//     @required this.gtin13,
//     @required this.offers,
//     @required this.brand,
//     @required this.aggregateRating,
//     @required this.review,
//   });
//
//   String? context;
//   String? type;
//   String? additionalType;
//   String? name;
//   String? description;
//   String? image;
//   int? sku;
//   String? gtin13;
//   Offers? offers;
//   PublisherElement? brand;
//   AggregateRating? aggregateRating;
//   List<ProductJsonLdReview>? review;
//
//   factory ProductJsonLd.fromJson(Map<String, dynamic> json) => ProductJsonLd(
//         context: json["@context"],
//         type: json["@type"],
//         additionalType: json["additionalType"],
//         name: json["name"],
//         description: json["description"],
//         image: json["image"],
//         sku: json["sku"],
//         gtin13: json["gtin13"],
//         offers: Offers.fromJson(json["offers"]),
//         brand: PublisherElement.fromJson(json["brand"]),
//         aggregateRating: AggregateRating.fromJson(json["aggregateRating"]),
//         review: List<ProductJsonLdReview>.from(
//             json["review"].map((x) => ProductJsonLdReview.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@context": context,
//         "@type": type,
//         "additionalType": additionalType,
//         "name": name,
//         "description": description,
//         "image": image,
//         "sku": sku,
//         "gtin13": gtin13,
//         "offers": offers!.toJson(),
//         "brand": brand!.toJson(),
//         "aggregateRating": aggregateRating!.toJson(),
//         "review": List<dynamic>.from(review!.map((x) => x.toJson())),
//       };
// }
//
// class Offers {
//   Offers({
//     @required this.type,
//     @required this.availability,
//     @required this.price,
//     @required this.priceCurrency,
//     @required this.url,
//     @required this.priceValidUntil,
//   });
//
//   String? type;
//   String? availability;
//   int? price;
//   String? priceCurrency;
//   String? url;
//   DateTime? priceValidUntil;
//
//   factory Offers.fromJson(Map<String, dynamic> json) => Offers(
//         type: json["@type"],
//         availability: json["availability"],
//         price: json["price"],
//         priceCurrency: json["priceCurrency"],
//         url: json["url"],
//         priceValidUntil: DateTime.parse(json["priceValidUntil"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": type,
//         "availability": availability,
//         "price": price,
//         "priceCurrency": priceCurrency,
//         "url": url,
//         "priceValidUntil":
//             "${priceValidUntil!.year.toString().padLeft(4, '0')}-${priceValidUntil!.month.toString().padLeft(2, '0')}-${priceValidUntil!.day.toString().padLeft(2, '0')}",
//       };
// }
//
// class ProductJsonLdReview {
//   ProductJsonLdReview({
//     @required this.type,
//     @required this.author,
//     @required this.datePublished,
//     @required this.reviewRating,
//   });
//
//   String? type;
//   String? author;
//   String? datePublished;
//   FluffyReviewRating? reviewRating;
//
//   factory ProductJsonLdReview.fromJson(Map<String, dynamic> json) =>
//       ProductJsonLdReview(
//         type: json["@type"],
//         author: json["author"],
//         datePublished: json["datePublished"],
//         reviewRating: FluffyReviewRating.fromJson(json["reviewRating"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": type,
//         "author": author,
//         "datePublished": datePublished,
//         "reviewRating": reviewRating!.toJson(),
//       };
// }
//
// class FluffyReviewRating {
//   FluffyReviewRating({
//     @required this.type,
//     @required this.bestRating,
//     @required this.ratingValue,
//     @required this.worstRating,
//   });
//
//   String? type;
//   String? bestRating;
//   int? ratingValue;
//   String? worstRating;
//
//   factory FluffyReviewRating.fromJson(Map<String, dynamic> json) =>
//       FluffyReviewRating(
//         type: json["@type"],
//         bestRating: json["bestRating"],
//         ratingValue: json["ratingValue"],
//         worstRating: json["worstRating"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "@type": type,
//         "bestRating": bestRating,
//         "ratingValue": ratingValue,
//         "worstRating": worstRating,
//       };
// }
//
// class EnumValues<T> {
//   Map<String, T>? map;
//   Map<T, String>? reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap;
//     return reverseMap!;
//   }
// }
// */
