// TODO: Put public facing types in this file.

import 'package:dart_init/src/dart_init_base.dart';

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
  Awesome();
}

class ClassLevelNullSafty{
  /// To indicate that a variable might have the value null, just add ? to its type declaration:
  int? aNullableInt;
  //todo: read about late
  late int aNullableInt2;
  //non nullable must be either provide value at declaration or through constructor.
  int nonNullable;
  static int nonNullable2=1;
  List<int?> listThatCouldHaveNull = [1, null, 4];
  ClassLevelNullSafty(this.nonNullable);
}
// Using null safety:
class SomeClass {
  int atDeclaration = 0;
  int initializingFormal;
  int initializationList;

  SomeClass(this.initializingFormal) : initializationList = 0;

}

/// Section skipped; https://dart.dev/null-safety/understanding-null-safety#top-and-bottom
// Currently reading Null safty at: https://dart.dev/null-safety/understanding-null-safety#never-for-unreachable-code
///Key take aways
// , if you want a parameter to be optional, you need to either make it nullable or specify a valid non-null default value.
//compiler is able to verify that the type must be List that's why you can call
// isEmpty on object type.
bool isEmptyList(Object object) {
  if (object is! List) return false;
  return object.isEmpty; // <-- Error!
}

void main() {
  // for (var i = 0; i < 5; i++) {
  //   print('hello ${i + 1}');
  //   print('hello ${i*2}');
  // }
  // // With null safety:
  // int? isEmpty(String? string) => string?.length;
  //   print(isEmpty("hello-anshul"));
  //   isEmpty(null);
  //   print('hello');
  //
  //



  /// After with null safety Dart team removing implicit downcasts entirely.
  Object maybeString = 'it is';
  //todo: check why without as String auto type downcasting not working
  requireStringNotObject(maybeString as String?);
  requireStringNotObject(maybeString as String);
  requireStringNotObject(null);
}
// Without null safety:
requireStringNotObject(String? definitelyString) {
  print(definitelyString?.length);
}

// Without null safety:
// List<int> filterEvens(List<int> ints) {
//   return ints.where((n) => n.isEven);
// }

 //todo: Read about dynamic functions.
 filterEvens(List<int> ints) => ints.where((n) => n.isEven);


// String someFunc(){
// }
String alwaysReturns(int n) {
  if (n == 0) {
    return 'zero';
  } else if (n < 0) {
    throw ArgumentError('Negative values not allowed.');
  } else {
    if (n > 1000) {
      return 'big';
    } else {
      return n.toString();
    }
  }
}
void methodWithOptional( ){

}
Never wrongType(String type, Object value) {
  throw ArgumentError('Expected $type, but was ${value.runtimeType}.');
  print("object");
}

// default default
