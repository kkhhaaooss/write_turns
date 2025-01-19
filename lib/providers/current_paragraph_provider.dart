import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentParagraphProvider = StateProvider<String>((ref) {
  return 'This is the current paragraph.';
});
