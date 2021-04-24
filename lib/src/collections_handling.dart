var iterable = ['Salad', 'Popcorn', 'Toasts'];
var intIterable = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

void main() {
  iterable
      .getRange(0, iterable.length)
      .forEach((e) => print(e + ' bad for health'));

  for (var element in iterable) {
    print(element);
  }

  var firstElementsGreaterThanFive =
      intIterable.firstWhere((element) => element > 5);
  print(firstElementsGreaterThanFive);

  print('printing=============');
  intIterable.where((element) => element.isEven).forEach((element) {print(element);});
  print('printing=============');

  /// Example of Passing 2 functions to first Where
  var element4 = iterable.firstWhere(
    (element) => element.length > 10,
    orElse: () => 'None!',
  );

  ///bad State error: Note: If no element satisfies the test predicate and the
  ///orElse parameter isn’t provided, then firstWhere() throws a StateError
  // var element5 = iterable.firstWhere((element) => element.length > 100);


  /// Test some condition is satisfied by everyElementHasFiveOrMoreChar element
  var everyElementHasFiveOrMoreChar = iterable.getRange(0, iterable.length).every((element) => element.length>=5);
  print(everyElementHasFiveOrMoreChar);

  var any = iterable.getRange(0, iterable.length).any((element) => element.length>6);
  print(any);
}
