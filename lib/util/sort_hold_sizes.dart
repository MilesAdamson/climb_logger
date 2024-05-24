import 'package:climb_logger/models/hangboard_item_model.dart';

List<String> sortHoldSizes(List<String> sizes) {
  final allSizes = [
    ...HangboardItemModel.holdSizesMetric,
    ...HangboardItemModel.holdSizesImperial,
  ];

  assert(sizes.every((s) => allSizes.contains(s)));

  final sorted = sizes
      .map(
        (size) => _SortableSize(
          size,
          allSizes.indexOf(size),
        ),
      )
      .toList()
    ..sort();

  return sorted.map((e) => e.size).toList();
}

class _SortableSize implements Comparable {
  final String size;
  final int sortValue;

  _SortableSize(this.size, this.sortValue);

  @override
  int compareTo(other) {
    if (other is _SortableSize) return sortValue.compareTo(other.sortValue);

    return 0;
  }
}
