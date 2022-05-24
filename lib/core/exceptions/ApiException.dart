class ApiException implements Exception {
  String tag;
  String errorMessageFromApp;
  String apiUrl;
  String responseReceived;
  int? statusCode;

  ApiException({
    required this.tag,
    required this.errorMessageFromApp,
    required this.apiUrl,
    required this.responseReceived,
    this.statusCode,
  });

  @override
  String toString() => 'ApiException{'
      'originFileName: $tag,\n '
      'errorMessageFromApp: $errorMessageFromApp,\n '
      'apiUrl: $apiUrl,\n '
      'responseReceived: $responseReceived,\n '
      'statusCode: $statusCode'
      '}';
}
