import 'package:logger/logger.dart';

abstract class Log {
  static final Logger _logger = Logger();

  static debug(String message) {
    _logger.d(message);
  }

  static error(message) {
    _logger.e(message);
  }

  static information(message) {
    _logger.i(message);
  }

  static warning(message) {
    _logger.w(message);
  }
}
