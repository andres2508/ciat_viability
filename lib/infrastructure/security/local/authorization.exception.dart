class CIATAuthorizationException implements Exception {
  String message;

  CIATAuthorizationException(this.message);

  @override
  String toString() => this.message;
}
