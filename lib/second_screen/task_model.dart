class TaskModel {
  TaskModel(this.text) : _done = false;

  final String text;
  bool _done;

  bool get done => _done;

  void toogle() {
    _done = !_done;
  }
}
