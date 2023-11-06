abstract class Page<T> {
  late List<T> docs;
  late int total;
  late int page;
  late int pages;
  late int limit;
  late String sort;

  int get currentTotal => (page - 1) * limit + docs.length;

  int get next => page + 1;

  bool get isEnd => page >= pages || docs.isEmpty;
}
