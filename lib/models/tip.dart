class Tip {
  final int id;
  final String text;
  final String author;
  final List<int> upvotes;
  final List<int> downvotes;

  Tip({
    required this.id,
    required this.text,
    required this.author,
    required this.upvotes,
    required this.downvotes,
  });
}
