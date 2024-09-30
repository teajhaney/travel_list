import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListItem {
  String text;
  bool isChecked;

  ListItem({
    required this.text,
    this.isChecked = false,
  });
}

//==PROVIDER FOR TEXT===
// Provider for managing list of texts
final textProvider =
    StateNotifierProvider<TextListStateNotifier, List<String>>((ref) {
  return TextListStateNotifier();
});

// StateNotifier for managing list of texts
class TextListStateNotifier extends StateNotifier<List<String>> {
  TextListStateNotifier() : super([]);

  void addItem(String text) {
    state = [...state, text];
  }

  void saveCurrentText(int index, String newText) {
    if (index < state.length) {
      state[index] = newText;
    } else {
      throw ArgumentError('Index out of range');
    }
  }

  void editItem(int index, String newText) {
    if (index + 1 < state.length) {
      // Add the edited text after the next item's content
      state = [
        ...state.sublist(0, index + 1),
        newText,
        ...state.sublist(index + 2)
      ];
    } else {
      throw ArgumentError('Index out of range');
    }
  }

  void saveEditedItems() {
    // Save edited items to the current item text controller
    final updatedState = state.map((text) => 'Updated: $text').toList();
    state = updatedState;
  }
}

// Provider for managing list of items
final itemProvider =
    StateNotifierProvider<ItemListStateNotifier, List<ListItem>>((ref) {
  return ItemListStateNotifier();
});

// StateNotifier for managing list of items
class ItemListStateNotifier extends StateNotifier<List<ListItem>> {
  ItemListStateNotifier() : super([]);

  void addItem(String text, bool isChecked) {
    state = [...state, ListItem(text: text, isChecked: isChecked)];
  }

  void saveCurrentText(int index, String newText) {
    if (index < state.length) {
      state[index].text = newText;
    } else {
      throw ArgumentError('Index out of range');
    }
  }

  void editItem(int index, String newText) {
    if (index + 1 < state.length) {
      // Add the edited text after the next item's content
      final updatedState = [
        ...state.sublist(0, index + 1),
        ListItem(text: newText, isChecked: false),
        ...state.sublist(index + 2)
      ];
      state = updatedState;
    } else {
      throw ArgumentError('Index out of range');
    }
  }

  void saveEditedItems() {
    // Save edited items to the current item text controller
    final updatedState = state
        .map(
            (item) => ListItem(text: 'Updated: ${item.text}', isChecked: false))
        .toList();
    state = updatedState;
  }
}


/*
//==PROVIDER FOR TEXT===
// Provider for the TextStateNotifier

final textProvider = StateNotifierProvider<TextStateNotifier, String>((ref) {
  return TextStateNotifier();
});

// StateNotifier for managing text state
class TextStateNotifier extends StateNotifier<String> {
  TextStateNotifier() : super('');

  void saveText(String newText) {
    state = newText;
  }
}



//===PROVIDER FOR LIST====

// Provider for managing list of items
final itemProvider = StateNotifierProvider<ItemListStateNotifier, List<ListItem>>((ref) {
  return ItemListStateNotifier();
});

// StateNotifier for managing list of items
class ItemListStateNotifier extends StateNotifier<List<ListItem>> {
  ItemListStateNotifier() : super([]);

  void addItem(String text) {
    state = [...state, ListItem(text: text)];
  }


  


}
*/
/* 
I want to create a model for my list which contains list of strings in form of text and a checkbox, I want to add the model to my
 riverpod provider.
 when the user first open the screen they should see a check box and a text field to add a list<string> when thet click textinput action, I want the itemcontrollertext.text to be added
to the list and update the UI to automticlly have the Item frommthe list and a new textfield below for the user to add another text.
 */
