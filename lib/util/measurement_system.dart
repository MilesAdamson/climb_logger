import 'package:climb_logger/models/hangboard_item_model.dart';

enum MeasurementSystem { metric, imperial }

extension MeasurementSystemExtensions on MeasurementSystem {
  String get label {
    switch (this) {
      case MeasurementSystem.metric:
        return "Metric";
      case MeasurementSystem.imperial:
        return "Imperial";
    }
  }

  List<String> get holdSizes {
    switch (this) {
      case MeasurementSystem.metric:
        return HangboardItemModel.holdSizesMetric;
      case MeasurementSystem.imperial:
        return HangboardItemModel.holdSizesImperial;
    }
  }
}
