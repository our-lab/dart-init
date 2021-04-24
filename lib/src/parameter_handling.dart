///A function can’t have both optional positional and optional named parameters.
///




String joinWithCommas(int a, [int? b, int? c, int? d, int? e]) {
  var total = '$a';
  total = (b ?? total)==total ? total : '$total,${b?.toString()}';
  total = (c ?? total)==total ? total : '$total,${c?.toString()}';
  total = (d ?? total)==total ? total :'$total,${d?.toString()}';
  total = (e ?? total)==total ? total :'$total,${e?.toString()}';
  print(total);
  return total;
}
String joinWithCommasDartSolution(int a, [int? b, int? c, int? d, int? e]) {
  var total = '$a';
  if (b != null) total = '$total,$b';
  if (c != null) total = '$total,$c';
  if (d != null) total = '$total,$d';
  if (e != null) total = '$total,$e';
  return total;
}

void optionalNamedParameters(String firstName, String lastName, {String? suffix}) {
  print('$firstName $lastName ${suffix ?? ''}');
}
void optionalNamedParametersWithDefaultValue(String firstName, String lastName, {String suffix = ''}) {
  print('$firstName $lastName $suffix');
}
//optional parameter either provide default value or mark it nullable.
int optionalPositionalParameters(int a, [int b = 2, int? c, int d = 4, int e = 5]) {
  // ···
  return 0;
}


class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt = 1,
    this.aString = 'Old!',
    this.aDouble = 2.0,
  });

  //Method expects nullable parameters
  MyDataObject newCopyFromNullableParameters(int? newInt, String? newString, double? newDouble){
    return MyDataObject(
        anInt: newInt ?? this.anInt,
        aString: newString ?? this.aString,
        aDouble: newDouble ?? this.aDouble);
  }
  //Method expects named + nullable parameters
  MyDataObject newCopyFromNamedNullableParameters({int? newInt, String? newString, double? newDouble}) {
    return MyDataObject(
      anInt: newInt ?? this.anInt,
      aString: newString ?? this.aString,
      aDouble: newDouble ?? this.aDouble,
    );
  }

}


void main(){
  optionalNamedParameters('anshul', 'mohil');
  //There is no other way to provide optional named parameters.
  optionalNamedParameters('firstName', 'lastName', suffix: 'singh');
  optionalNamedParametersWithDefaultValue('firstName', 'lastName');
  print(optionalPositionalParameters(1)); // <-- prints 15

  MyDataObject().newCopyFromNamedNullableParameters(newInt: 10, newDouble: 10.2, newString: "anshul");

  MyDataObject().newCopyFromNullableParameters(2, null, null);

}


