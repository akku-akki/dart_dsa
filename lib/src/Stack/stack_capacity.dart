
class StackCapacity<T> {
  List<T> _stack;

  StackCapacity(int capacity) {
    _stack = List<T>(capacity);
  }

  int _count = 0;

/// Adding element from stack
  void push(T item) {
    if (_count == _stack.length) throw StackOverflowError();
    _stack[_count] = item;
    _count++;
  }

/// Removing element from stack
/// throws exception if stack is empty
  T pop() {
    if (_count == 0) throw Exception("Out of Range");
    print(_count);
    _count--;
    _stack[_count] = null;
    return _stack[_count];
  }
/// Returns total element present at current
 int size() {
    return _count;
  }

/// Returns element at top of stack 
  T peek() {
    return _stack[_count - 1];
  }

  @override
  String toString() {
    return _stack.toString();
  }
}
