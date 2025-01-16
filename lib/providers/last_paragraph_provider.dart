import 'package:flutter_riverpod/flutter_riverpod.dart';

final lastParagraphProvider = StateProvider<String>((ref) {
  return 'This is the last paragraph.';
});
