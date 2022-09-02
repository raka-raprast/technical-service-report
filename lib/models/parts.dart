class Part {
  final String partName;
  final String pnRemove;
  final bool removeGenuinity;
  final String pnInstalled;
  final bool installedGenuinity;
  final int qty;
  final String repairAction;
  Part({
    required this.partName,
    required this.pnRemove,
    required this.removeGenuinity,
    required this.pnInstalled,
    required this.installedGenuinity,
    required this.qty,
    required this.repairAction,
  });
}
