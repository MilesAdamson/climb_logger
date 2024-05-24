import 'package:cloud_firestore/cloud_firestore.dart';

extension MapExtensions<K, V> on Map<K, DocumentSnapshot<V>> {
  Map<K, DocumentSnapshot<V>> whereHasData() {
    final map = Map.of(this);

    for (final key in keys) {
      final data = this[key]?.data();
      if (data != null) {
        map[key] = this[key]!;
      }
    }

    return map;
  }

  List<DocumentSnapshot<V>> documentsWithData() =>
      whereHasData().values.toList();

  List<V> mapToData() => values.map((e) => e.data()).whereType<V>().toList();
}
