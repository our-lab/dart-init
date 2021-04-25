/// Key take away.
/// within an async function body, all synchronous code before the first await keyword executes immediately.

Future<String> createOrderMessage() async{
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() => Future.delayed(Duration(seconds: 2), () => 'Large Latte',);


Future<void> fetchUserOrderThrowError() {
// Imagine that this function is fetching user info but encounters a bug
  return Future.delayed(Duration(seconds: 2), () => throw Exception('Logout failed: user ID is invalid'));
}

Future<void> main() async{

  print(await createOrderMessage());
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


// Future main() async {
//   await for (var request in requestServer) {
//     handleRequest(request);
//   }
// }
// Future<void> someAsyncMethod() async {
//   var mustBeSomeStream = [1,2,3];
//   await for (var i in mustBeSomeStream) {
// // Executes each time the stream emits mustBeSomeStream value.
//   }
// }
