import 'package:dart_dsa/src/Stack/stack_linkedlist.dart';

class StringAlgos {
  static String reverseString(String input) {
    StackLinkedList<String> stack = StackLinkedList<String>();

    for (int i = 0; i < input.length; i++) {
      stack.push(input[i]);
    }
    StringBuffer reversed = StringBuffer();
    while (!stack.isEmpty()) {
      reversed.write(stack.pop());
    }
    return reversed.toString();
  }

  static String searchFirstNonRepeatingChar(String input) {
    Map<String, int> map = Map<String, int>();
    for (int i = 0; i < input.length; i++) {
      var count = map.containsKey(input[i]) ? map[input[i]] : 0;
      map[input[i]] = count + 1;
    }
    for (int i = 0; i < input.length; i++) {
      if (map[input[i]] == 1) return input[i];
    }
    return "Value not found";
  }

  static String searchFirstRepeatedChar(String str) {
    Set<String> setValues = Set<String>();

    for (int i = 0; i < str.length; i++) {
      if (setValues.contains(str[i])) return str[i];
      setValues.add(str[i]);
    }
    return 'Value not found';
  }
}
