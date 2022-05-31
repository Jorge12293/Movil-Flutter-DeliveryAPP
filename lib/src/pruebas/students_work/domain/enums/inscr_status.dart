import 'package:appdelivery/src/pruebas/students_work/domain/repositories/enum_values.dart';

enum InscrStatus { UNREGISTERED, REGISTERED, ACCEPTED,DISABLED }
final inscrStatusValues = EnumValues({
    "ACCEPTED": InscrStatus.ACCEPTED,
    "REGISTERED": InscrStatus.REGISTERED,
    "UNREGISTERED": InscrStatus.UNREGISTERED,
    "DISABLED": InscrStatus.DISABLED
});
