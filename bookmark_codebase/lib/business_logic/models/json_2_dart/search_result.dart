// To parse this JSON data, do
//
//     final searchResult = searchResultFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SearchResult searchResultFromJson(String str) => SearchResult.fromJson(json.decode(str));

String searchResultToJson(SearchResult data) => json.encode(data.toJson());

class SearchResult {
  SearchResult({
    @required this.pageProps,
    @required this.nSsp,
  });

  PageProps? pageProps;
  bool? nSsp;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
    pageProps: PageProps.fromJson(json["pageProps"]),
    nSsp: json["__N_SSP"],
  );

  Map<String, dynamic> toJson() => {
    "pageProps": pageProps!.toJson(),
    "__N_SSP": nSsp,
  };
}

class PageProps {
  PageProps({
    @required this.pageConfig,
    @required this.filters,
    @required this.term,
  });

  PageConfig? pageConfig;
  PagePropsFilters? filters;
  String? term;

  factory PageProps.fromJson(Map<String, dynamic> json) => PageProps(
    pageConfig: PageConfig.fromJson(json["pageConfig"]),
    filters: PagePropsFilters.fromJson(json["filters"]),
    term: json["term"],
  );

  Map<String, dynamic> toJson() => {
    "pageConfig": pageConfig!.toJson(),
    "filters": filters!.toJson(),
    "term": term,
  };
}

class PagePropsFilters {
  PagePropsFilters({
    @required this.list,
    @required this.term,
  });

  List<dynamic>? list;
  String? term;

  factory PagePropsFilters.fromJson(Map<String, dynamic> json) => PagePropsFilters(
    list: List<dynamic>.from(json["list"].map((x) => x)),
    term: json["term"],
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list!.map((x) => x)),
    "term": term,
  };
}

class PageConfig {
  PageConfig({
    @required this.boxes,
    @required this.title,
    @required this.hasMore,
    @required this.nextOffset,
  });

  List<Box>? boxes;
  String? title;
  bool? hasMore;
  String? nextOffset;

  factory PageConfig.fromJson(Map<String, dynamic> json) => PageConfig(
    boxes: List<Box>.from(json["boxes"].map((x) => Box.fromJson(x))),
    title: json["title"],
    hasMore: json["hasMore"],
    nextOffset: json["nextOffset"],
  );

  Map<String, dynamic> toJson() => {
    "boxes": List<dynamic>.from(boxes!.map((x) => x.toJson())),
    "title": title,
    "hasMore": hasMore,
    "nextOffset": nextOffset,
  };
}

class Box {
  Box({
    @required this.type,
    @required this.title,
    @required this.backgroundStyle,
    @required this.bookData,
    @required this.destination,
    @required this.backgroundConfig,
  });

  int? type;
  String? title;
  int? backgroundStyle;
  BookData? bookData;
  Destination? destination;
  BackgroundConfig? backgroundConfig;

  factory Box.fromJson(Map<String, dynamic> json) => Box(
    type: json["type"],
    title: json["title"],
    backgroundStyle: json["backgroundStyle"],
    bookData: BookData.fromJson(json["bookData"]),
    destination: Destination.fromJson(json["destination"]),
    backgroundConfig: BackgroundConfig.fromJson(json["backgroundConfig"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "title": title,
    "backgroundStyle": backgroundStyle,
    "bookData": bookData!.toJson(),
    "destination": destination!.toJson(),
    "backgroundConfig": backgroundConfig!.toJson(),
  };
}

class BackgroundConfig {
  BackgroundConfig({
    @required this.style,
  });

  int? style;

  factory BackgroundConfig.fromJson(Map<String, dynamic> json) => BackgroundConfig(
    style: json["style"],
  );

  Map<String, dynamic> toJson() => {
    "style": style,
  };
}

class BookData {
  BookData({
    @required this.books,
    @required this.layout,
    @required this.showPrice,
  });

  List<Book>? books;
  int? layout;
  bool? showPrice;

  factory BookData.fromJson(Map<String, dynamic> json) => BookData(
    books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
    layout: json["layout"],
    showPrice: json["showPrice"],
  );

  Map<String, dynamic> toJson() => {
    "books": List<dynamic>.from(books!.map((x) => x.toJson())),
    "layout": layout,
    "showPrice": showPrice,
  };
}

class Book {
  Book({
    @required this.id,
    @required this.title,
    @required this.sourceBookId,
    @required this.subtitle,
    @required this.publisherId,
    @required this.publisherSlug,
    @required this.price,
    @required this.numberOfPages,
    @required this.rating,
    @required this.rates,
    @required this.hasTemporaryOff,
    @required this.beforeOffPrice,
    @required this.isRtl,
    @required this.showOverlay,
    @required this.physicalPrice,
    @required this.publishDate,
    @required this.destination,
    @required this.type,
    @required this.refId,
    @required this.coverUri,
    @required this.shareUri,
    @required this.shareText,
    @required this.publisher,
    @required this.authors,
    @required this.files,
    @required this.labels,
    @required this.categories,
    @required this.subscriptionAvailable,
    @required this.newsItemCreationDate,
    @required this.state,
    @required this.encrypted,
    @required this.currencyPrice,
    @required this.currencyBeforeOffPrice,
    @required this.sticker,
  });

  int? id;
  String? title;
  int? sourceBookId;
  String? subtitle;
  int? publisherId;
  String? publisherSlug;
  int? price;
  int? numberOfPages;
  double? rating;
  List<dynamic>? rates;
  bool? hasTemporaryOff;
  int? beforeOffPrice;
  bool? isRtl;
  bool? showOverlay;
  int? physicalPrice;
  String? publishDate;
  int? destination;
  String? type;
  String? refId;
  String? coverUri;
  String? shareUri;
  String? shareText;
  String? publisher;
  List<Author>? authors;
  List<dynamic>? files;
  List<Label>? labels;
  List<dynamic>? categories;
  bool? subscriptionAvailable;
  DateTime? newsItemCreationDate;
  int? state;
  bool? encrypted;
  double? currencyPrice;
  int? currencyBeforeOffPrice;
  String? sticker;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    id: json["id"],
    title: json["title"],
    sourceBookId: json["sourceBookId"],
    subtitle: json["subtitle"] ?? json["subtitle"],
    publisherId: json["PublisherID"],
    publisherSlug: json["publisherSlug"],
    price: json["price"],
    numberOfPages: json["numberOfPages"],
    rating: json["rating"] ?? json["rating"].toDouble(),
    rates: List<dynamic>.from(json["rates"].map((x) => x)),
    hasTemporaryOff: json["hasTemporaryOff"],
    beforeOffPrice: json["beforeOffPrice"],
    isRtl: json["isRtl"],
    showOverlay: json["showOverlay"],
    physicalPrice: json["PhysicalPrice"],
    publishDate: json["publishDate"] ?? json["publishDate"],
    destination: json["destination"],
    type: json["type"],
    refId: json["refId"],
    coverUri: json["coverUri"],
    shareUri: json["shareUri"],
    shareText: json["shareText"],
    publisher: json["publisher"],
    authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
    files: List<dynamic>.from(json["files"].map((x) => x)),
    labels: List<Label>.from(json["labels"].map((x) => Label.fromJson(x))),
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    subscriptionAvailable: json["subscriptionAvailable"],
    newsItemCreationDate: DateTime.parse(json["newsItemCreationDate"]),
    state: json["state"],
    encrypted: json["encrypted"],
    currencyPrice: json["currencyPrice"].toDouble(),
    currencyBeforeOffPrice: json["currencyBeforeOffPrice"],
    sticker: json["sticker"] ?? json["sticker"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "sourceBookId": sourceBookId,
    "subtitle": subtitle ?? subtitle,
    "PublisherID": publisherId,
    "publisherSlug": publisherSlug,
    "price": price,
    "numberOfPages": numberOfPages,
    "rating": rating ?? rating,
    "rates": List<dynamic>.from(rates!.map((x) => x)),
    "hasTemporaryOff": hasTemporaryOff,
    "beforeOffPrice": beforeOffPrice,
    "isRtl": isRtl,
    "showOverlay": showOverlay,
    "PhysicalPrice": physicalPrice,
    "publishDate": publishDate ?? publishDate,
    "destination": destination,
    "type": type,
    "refId": refId,
    "coverUri": coverUri,
    "shareUri": shareUri,
    "shareText": shareText,
    "publisher": publisher,
    "authors": List<dynamic>.from(authors!.map((x) => x.toJson())),
    "files": List<dynamic>.from(files!.map((x) => x)),
    "labels": List<dynamic>.from(labels!.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categories!.map((x) => x)),
    "subscriptionAvailable": subscriptionAvailable,
    "newsItemCreationDate": newsItemCreationDate!.toIso8601String(),
    "state": state,
    "encrypted": encrypted,
    "currencyPrice": currencyPrice,
    "currencyBeforeOffPrice": currencyBeforeOffPrice,
    "sticker": sticker ?? sticker,
  };
}

class Author {
  Author({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.type,
    @required this.slug,
  });

  int? id;
  String? firstName;
  String? lastName;
  int? type;
  String? slug;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    type: json["type"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "type": type,
    "slug": slug,
  };
}

class Label {
  Label({
    @required this.tagId,
    @required this.tag,
  });

  int? tagId;
  String? tag;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
    tagId: json["tagID"],
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() => {
    "tagID": tagId,
    "tag": tag,
  };
}

class Destination {
  Destination({
    @required this.type,
    @required this.pageTitle,
    @required this.order,
    @required this.filters,
    @required this.navigationPage,
    @required this.operationType,
    @required this.bookId,
  });

  int? type;
  String? pageTitle;
  int? order;
  DestinationFilters? filters;
  int? navigationPage;
  int? operationType;
  int? bookId;

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
    type: json["type"],
    pageTitle: json["pageTitle"],
    order: json["order"],
    filters: DestinationFilters.fromJson(json["filters"]),
    navigationPage: json["navigationPage"],
    operationType: json["operationType"],
    bookId: json["bookId"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "pageTitle": pageTitle,
    "order": order,
    "filters": filters!.toJson(),
    "navigationPage": navigationPage,
    "operationType": operationType,
    "bookId": bookId,
  };
}

class DestinationFilters {
  DestinationFilters({
    @required this.list,
    @required this.slug,
    @required this.term,
    @required this.refId,
  });

  List<ListElement>? list;
  String? slug;
  String? term;
  String? refId;

  factory DestinationFilters.fromJson(Map<String, dynamic> json) => DestinationFilters(
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    slug: json["slug"],
    term: json["term"] ?? json["term"],
    refId: json["refId"],
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list!.map((x) => x.toJson())),
    "slug": slug,
    "term": term ?? term,
    "refId": refId,
  };
}

class ListElement {
  ListElement({
    @required this.type,
    @required this.value,
  });

  int? type;
  int? value;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    type: json["type"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "value": value,
  };
}
