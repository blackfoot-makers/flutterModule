/// Extension for int to get rank based on point
extension IntExtension on int {
  /// Get rank based on point
  int toRank() {
    switch (this) {
      case final int point when point > 100 && point <= 500:
        return 2;
      case final int point when point > 500 && point <= 1000:
        return 3;
      case final int point when point > 1000 && point <= 5000:
        return 4;
      case final int point when point > 5000:
        return 5;
      default:
        return 1;
    }
  }
}
