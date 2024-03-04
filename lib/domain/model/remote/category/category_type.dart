enum CategoryType {
  transport,
  entertainment,
  security,
  unknown;

  static CategoryType getType(String type) {
    if (type.isEmpty) {
      return CategoryType.unknown;
    }
    return CategoryType.values.where((element) => type == element.name).first;
  }
}
