enum LubeUsed {
  engineOil,
  swingReduction,
  gearOil,
  finalDrive,
  hydraulicOil,
  steering,
  grease,
  brakeOil,
}

class Lube {
  final LubeUsed lubeUsed;
  final String make;
  final String type;
  final String sae;
  final String cl;

  Lube({
    required this.lubeUsed,
    required this.make,
    required this.type,
    required this.sae,
    required this.cl,
  });
}
