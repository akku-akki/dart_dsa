class _Node<T> {
  T value;
  _Node<T> next;

  _Node(this.value, {this.next});
}

class StackLinkedList<T> {
  _Node<T> first;
  int _items = 0;


/// Returns true is Stack is empty
  bool isEmpty() {
    return first == null;
  }
/// Returns currenty elements count
  int size() {
    return _items;
  }
/// Adding element to Stack
  void push(T item) {
    _Node oldFirst = first;
    first = _Node(item, next: oldFirst);
    _items++;
  }
/// Removing element from Stack
  T pop() {
    T value = first.value;
    first = first.next;
    _items--;
    return value;
  }
/// Returns Top element of Stack
  T peek() {
    return first.value;
  }
}
