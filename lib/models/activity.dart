class Activity {
  Activity({required this.label, required this.score, required this.id});

  final String id;
  final String label;
  double score;

  void updateScore(double score) {
    if (score >= 0) {
      this.score = score;
    } else {
      score = 0;
    }
  }
}
