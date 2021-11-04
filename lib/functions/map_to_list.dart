List<String> mapToList(Map<String, dynamic> map) {
  List<String> list = List.empty(growable: true);
  map.forEach((key, value) {
    value.isNotEmpty ? value.forEach((element) { list.add("$element $key"); }) : list.add(key);
  });
  return list;
}