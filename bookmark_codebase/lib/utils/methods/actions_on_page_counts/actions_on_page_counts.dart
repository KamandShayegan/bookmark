class ActionsOnPageCounts {
  double calculateBookProgressFrom1(int currentPage, int pageCount) {
    return double.parse(((currentPage) / pageCount).toStringAsFixed(2));
  }
}
