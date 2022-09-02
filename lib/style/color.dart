import 'dart:ui';

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

Color blueish() {
  return fromHex("426572");
}

Color skyBlue() {
  return fromHex("1E9FA7");
}

Color lightBlue() {
  return fromHex("699BF7");
}
