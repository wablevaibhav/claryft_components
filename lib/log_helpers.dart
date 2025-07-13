import 'package:logger/logger.dart';

class Log {
  static final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      levelEmojis: {
        Level.trace: '🔍',
        Level.debug: '🐛',
        Level.info: 'ℹ️',
        Level.warning: '⚠️',
        Level.error: '❗',
        Level.fatal: '💥',
      },
    ),
  );

  static void verbose(String message, {dynamic error, StackTrace? stackTrace}) {
    logger.t(message, error: error, stackTrace: stackTrace);
  }

  static void debug(String message, {dynamic error, StackTrace? stackTrace}) {
    logger.d(message, error: error, stackTrace: stackTrace);
  }

  static void info(String message) {
    logger.i(message);
  }

  static void warning(String message, {dynamic error, StackTrace? stackTrace}) {
    logger.w(message, error: error, stackTrace: stackTrace);
  }

  static void error(String message, {dynamic error, StackTrace? stackTrace}) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  static void failure(String message, {dynamic error, StackTrace? stackTrace}) {
    logger.f(message, error: error, stackTrace: stackTrace);
  }
}
