class Edge {
  int from;
  int to;
  int weight;

  Edge({required this.from, required this.to, required this.weight});

  @override
  String toString() {
    return "$from / $to";
  }
}
