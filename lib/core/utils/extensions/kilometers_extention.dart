import 'package:werewolf_cars/common/enums/max_kilometers.dart';
import 'package:werewolf_cars/common/enums/min_kilometers.dart';

extension KilometersValueExtension on Enum {
  String get value {
    if (this is MinKilometers) {
      return (this as MinKilometers).value;
    } else if (this is MaxKilometers) {
      return (this as MaxKilometers).value;
    }
    throw Exception('Unknown enum type');
  }
}
