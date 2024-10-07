import 'export.dart';

class LoggerUtil {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(), // You can customize the printer as needed
  );

  static void logInfo(String message) {
    _logger.i(message);
  }

  static void logWarning(String message) {
    _logger.w(message);
  }

  static void logError(String message) {
    _logger.e(message);
  }
}
