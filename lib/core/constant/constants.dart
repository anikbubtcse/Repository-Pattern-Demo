class Constants {
  static const String baseUrl = 'http://numbersapi.com';

  static String getConcreteNumberBaseUrl(String number) {
    return '$baseUrl/$number';
  }

  static String getRandomNumberBaseUrl() {
    return '$baseUrl/random/trivia';
  }
}
