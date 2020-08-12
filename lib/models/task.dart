class Task {
  Task(String text) {
    _text = text;
    _isDone = false;
  }

  String _text;
  bool _isDone;

  String get text => _text;
  bool get isDone => _isDone;

  void toggle() {
    _isDone = !_isDone;
  }
}
