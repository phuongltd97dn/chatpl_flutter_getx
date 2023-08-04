import 'package:intl/intl.dart';

final _dateFormatD4MYHHmm = DateFormat("dd MMMM yyyy - HH:mm");

extension Dilly on DateTime? {
  String get formatDMYformatDMYHHmm {
    return (this != null) ? _dateFormatD4MYHHmm.format(this!) : "";
  }
}
