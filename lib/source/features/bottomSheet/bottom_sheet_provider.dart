import 'package:flutter_riverpod/flutter_riverpod.dart';

//==PROVIDER FOR TEXT===
// StateNotifier for managing text state
class TextStateNotifier extends StateNotifier<String> {
  TextStateNotifier() : super('');

  void saveText(String newText) {
    state = newText;
  }
}

// Provider for the TextStateNotifier
final textProvider = StateNotifierProvider<TextStateNotifier, String>((ref) {
  return TextStateNotifier();
});

//===PROVIDER FOR LIST====
// class ItemListStateNotifier extends StateNotifier<List> {
//   ItemListStateNotifier() : super([]);
// }
final itemListProvider = StateProvider<List<String>>((ref) => []);
// Function to add an item to the list
void _addItem(ref, String newItem) {
  ref.read(itemListProvider).state.add(newItem);
}

// Function to remove an item from the list
void _removeItem(ref, int index) {
  ref.read(itemListProvider).state.removeAt(index);
}
