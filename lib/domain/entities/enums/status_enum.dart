enum Status {
  inProgress,
  finished,
}

extension StatusHelper on Status {
  String get value {
    switch (this) {
      case Status.inProgress:
        return 'in_progress';
      case Status.finished:
        return 'finished';
    }
  }
}