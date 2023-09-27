class DChatError extends Error {
  final String message;

  DChatError(this.message);

  @override
  String toString() {
    return 'PromptError: $message';
  }
}

class NotImplementedError extends DChatError {
  NotImplementedError(super.message);

  @override
  String toString() {
    return 'NotImplementedError: $message';
  }
}

// internal errors shouldn't happen, they are like assert errors but
class InternalError extends DChatError {
  InternalError(super.message);

  @override
  String toString() {
    return 'DChatError: $message';
  }
}
