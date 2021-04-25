import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// Key take away.
/// within an async function body, all synchronous code before the first await
/// keyword executes immediately.
//Todo:
/// Streams can also deliver error events like it delivers data events. Most
/// streams will stop after the first error, but it is possible to have streams
/// that deliver more than one error, and streams that deliver more data after
/// an error event. In this document we only discuss streams that deliver at
/// most one error.



/// async gives you a Future
/// async* gives you a Stream.
/// sync* returns Iterable





Future<String> createOrderMessage() async{
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() => Future.delayed(Duration(seconds: 2), () => 'Large Latte',);


Future<void> fetchUserOrderThrowError() {
// Imagine that this function is fetching user info but encounters a bug
  return Future.delayed(Duration(seconds: 2), () => throw Exception('Logout failed: user ID is invalid'));
}




/// In this case main calls createOrderMessage and exist immideately because
/// calling method would return Future instance immediately.
// void main(){
//   print( createOrderMessage());
// }

// Awaiting user order
//your order is large lette





/// within an async function body, all synchronous code before the first await keyword executes immediately.
/// Example:

Future<void> printOrderMessage() async {
  var order = await fetchUserOrder();
  print('Awaiting user order...');
  print('Your order is: $order');
}

Future<String> fetchUserOrder2() {
  // Imagine that this function is more complex and slow.
  return Future.delayed(Duration(seconds: 4), () => 'Large Latte');
}

Future<void> main2() async {
  countSeconds(4);
  await printOrderMessage();
}

// You can ignore this function - it's here to visualize delay time in this example.
void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}




/// To implement a synchronous generator function, mark the function
/// body as sync*, and use yield statements to deliver values:
/// Synchronus generator
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}

// async generator

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i == 4) {
      throw new Exception('Intentional exception');
    } else {
      yield i;
    }
  }
}



Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  try {
    await for (var value in stream) {
      sum += value;
    }
  } catch (e) {
    return -1;
  }
  return sum;
}



Stream<S> mapLogErrors<S, T>(Stream<T> stream, S Function(T event) convert,) async* {
  var streamWithoutErrors = stream.handleError((e) => print(e));
  await for (var event in streamWithoutErrors) {
    yield convert(event);
  }
}

Future<void> listPrinter(List<String> args) async {
  var file = File(args[0]);
  var lines = utf8.decoder
      .bind(file.openRead())
      .transform(LineSplitter());
  await for (var line in lines) {
    if (!line.startsWith('#')) print(line);
  }
}


Future<void> main() async{

  print(await createOrderMessage());
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum); // 55




}



















































#

