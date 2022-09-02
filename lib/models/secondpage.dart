import 'package:technical_service_report/models/lube.dart';
import 'package:technical_service_report/models/parts.dart';

class SecondPage {
  final bool misoperation;
  final bool mismaintenance;
  final bool misadjusment;
  final bool poorTorque;
  final bool badWeld;
  final bool poorWeld;
  final bool badMaterial;
  final bool dirtyFuel;
  final bool misassembly;
  final bool foreignMaterial;
  final bool poorDurability;
  final bool fatiqueMaterial;
  final String incNo;
  final String sroNo;
  final String toNo;
  final List<Part>? parts;
  final List<Lube>? lubes;
  final String remedy;
  final bool status;
  final String manhours;

  SecondPage({
    this.manhours = '',
    this.misoperation = false,
    this.mismaintenance = false,
    this.misadjusment = false,
    this.poorTorque = false,
    this.badWeld = false,
    this.poorWeld = false,
    this.badMaterial = false,
    this.dirtyFuel = false,
    this.misassembly = false,
    this.foreignMaterial = false,
    this.poorDurability = false,
    this.fatiqueMaterial = false,
    this.incNo = "",
    this.sroNo = "",
    this.toNo = "",
    this.parts,
    this.lubes,
    this.remedy = "",
    this.status = false,
  });
}
