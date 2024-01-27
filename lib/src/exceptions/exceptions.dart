// ignore_for_file: public_member_api_docs

class TelegramWebAppException implements Exception {
  TelegramWebAppException(this.message);

  final String message;
}

class InvalidUrlException extends TelegramWebAppException {
  InvalidUrlException(this.url) : super('Invalid URL: $url');

  InvalidUrlException.telegram(this.url)
      : super(
          'Invalid Telegram Link: $url'
          '\nOnly URLs are allowed with origin equal to '
          '"https://t.me" or "http://t.me"'
          '\nExample:'
          '\n - https://t.me/telegram'
          '\n - http://t.me/telegram',
        );

  final String url;

  @override
  String toString() => 'InvalidUrlException(url: $url)';
}
