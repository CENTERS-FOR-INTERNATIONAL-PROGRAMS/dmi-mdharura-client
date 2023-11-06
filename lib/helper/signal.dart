import 'package:m_dharura/constant/signal.dart';
import 'package:m_dharura/model/signal.dart';

String describeSignal(String code) {
  if (code.startsWith('h')) {
    return hebsSignals
        .firstWhere((element) => element.code == code,
            orElse: () => Signal(code: code, description: code))
        .description;
  }
  if (code.startsWith('v')) {
    return vebsSignals
        .firstWhere((element) => element.code == code,
            orElse: () => Signal(code: code, description: code))
        .description;
  } else if (code.startsWith('l') ||
      code.startsWith('p') ||
      code.startsWith('m')) {
    return lebsSignals
        .firstWhere((element) => element.code == code,
            orElse: () => Signal(code: code, description: code))
        .description;
  } else {
    return cebsSignals
        .firstWhere((element) => element.code == code,
            orElse: () => Signal(code: code, description: code))
        .description;
  }
}

List<Signal> listSignals(String type) {
  if (type == 'hebs') return hebsSignals;
  if (type == 'vebs') {
    return vebsSignals;
  } else if (type == 'lebs') {
    return lebsSignals;
  } else {
    return cebsSignals;
  }
}

String signalPrefix(String type) {
  if (type == 'hebs') return 'h';
  if (type == 'vebs') {
    return 'v';
  } else if (type == 'lebs') {
    return 'l';
  } else {
    return 'c';
  }
}
