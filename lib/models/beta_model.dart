import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'beta_model.freezed.dart';
part 'beta_model.g.dart';

@freezed
class BetaModel with _$BetaModel {
  BetaModel._();

  factory BetaModel(
    String beta,
    String uniqueId,
  ) = _BetaModel;

  factory BetaModel.newItem(String beta) {
    return BetaModel(beta, const Uuid().v4());
  }

  BetaModel copyWithNewUniqueId() {
    return BetaModel(beta, const Uuid().v4());
  }

  factory BetaModel.fromJson(json) => _$BetaModelFromJson(json);

  @override
  String toString() => beta;
}
