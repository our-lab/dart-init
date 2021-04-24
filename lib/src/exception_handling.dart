class OutOfLlamasException {}

void main() {
  try {
    breedMoreLlamas();
  } on OutOfLlamasException {
    /// catching a specific exception, specially when you don't wanna access exception object
    buyMoreLlamas();
  } on Exception catch (e) {
    /// Catching Exception of type Exception, use on + catch if you wan to access exception object
    print('Unknown exception: $e');
  } catch (e) {
    //Catching all exceptions
    print('I was just trying to breed llamas!');

    ///use rethrow to propagate the exception.
    rethrow;
  } finally {
    // Always clean up, even if an exception is thrown.
    cleanLlamaStalls();
  }
}

void buyMoreLlamas() {
  print('Buying 10 more llamas');
  throw UnableToAquireMoreLamas();
}

class UnableToAquireMoreLamas {}

void cleanLlamaStalls() {
  print('cleaning llamas state after exceptional response');
}

void breedMoreLlamas() {
  print('from breedMoreLLamas');
  // throw 'exception thrown with class';
  throw Exception('unable to breed');
}








/// Cheetsheet learning example
typedef VoidFunction = void Function();

class ExceptionWithMessage {
  final String message;
  const ExceptionWithMessage(this.message);
}

// Call logException to log an exception, and doneLogging when finished.
abstract class Logger {
  void logException(Type t, [String? msg]);
  void doneLogging();
}

void tryFunction(VoidFunction untrustworthy, Logger logger) {
  // Invoking this method might cause an exception. Catch and handle
  // them using try-on-catch-finally.
  try {
    untrustworthy();
  } on ExceptionWithMessage catch (e) {
    logger.logException(ExceptionWithMessage, e.message);
  } on Exception {
    logger.logException(Exception);
  } finally {
    logger.doneLogging();
  }
}
