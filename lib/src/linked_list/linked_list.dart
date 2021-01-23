class _Node<T> {
  T value;
  _Node<T> next;

  _Node(this.value, {this.next});
}

class LinkedList<T> {
  _Node<T> first;
  _Node<T> last;
  int _size = 0;

  LinkedList({this.first, this.last});

  /// Add elements as last node of the Linked List

  void addLast(T item) {
    _Node<T> node = _Node(item);
    if (_isEmpty()) {
      first = last = node;
    } else {
      last?.next = node;
      last = node;
    }
    _size++;
  }

  /// Add elements as first node of the Linked List

  void addFirst(T item) {
    _Node<T> node = _Node(item);
    if (_isEmpty()) {
      first = last = node;
    } else {
      node.next = first;
      first = node;
    }
    _size++;
  }

  /// Returns index of item
  /// if not present returns -1

  int indexOf(T item) {
    int index = 0;
    var current = first;
    while (current != null) {
      if (current.value == item) return index;
      current = current.next;
      index++;
    }
    return -1;
  }

  /// Returns TRUE is item is found in Linked List

  bool contains(T item) {
    return indexOf(item) != -1;
  }

  /// Removes first node from Linked List
  void removeFirst() {
    if (_isEmpty()) {
      throw Exception("This Linked List is Empty");
    }
    if (last == first)
      first = last = null;
    else {
      var second = first.next;
      first.next = null;
      first = second;
    }
    _size--;
  }

  /// Removes Last element from list
  void removeLast() {
    if (_isEmpty()) throw Exception("This Linked List is Empty");
    if (first == last)
      first = last = null;
    else {
      var previous = _getPreviousNode(last);
      last = previous;
      last.next = null;
    }
    _size--;
  }

  /// Removes node if present
  void remove(_Node node) {
    if (_isEmpty()) throw Exception('Linked List is Empty');
    if (node == first) {
      removeFirst();
      return;
    }
    if (node == last) {
      removeLast();
      return;
    }
    var previousNode = _getPreviousNode(node);
    if (previousNode == null) throw Exception("Element not present");
    var currentNode = node.next;
    previousNode.next = currentNode;
    currentNode.next = null;
    _size--;
    return;
  }

  _Node _getPreviousNode(_Node node) {
    var current = first;
    while (current != null) {
      if (current.next == node) return current;
      current = current.next;
    }
    return null;
  }

  ///  Returns current size
  int size() {
    return _size;
  }

  /// Returns current Linked List as List[]
  List<T> toArray() {
    List<T> array = List<T>(_size);
    var current = first;
    int index = 0;
    while (current != null) {
      array[index] = current.value;
      current = current.next;
      index++;
    }
    return array;
  }

// Reverse current Linked List
  void reverse() {
    if (_isEmpty()) return;
    var previous = first;
    var current = first.next;
    while (current != null) {
      var next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }
    last = first;
    last.next = null;
    first = previous;
  }

// Returns n-th element from end
  T getKthFromTheEnd(int k) {
    if (_isEmpty()) {
      throw Exception("ERROR : The List is empty");
    }

    var a = first;
    var b = first;
    for (int i = 0; i < k - 1; i++) {
      b = b.next;
      if (b == null) throw Exception("ERROR : Out of range ");
    }
    while (b != last) {
      a = a.next;
      b = b.next;
    }
    return a.value;
  }

  bool _isEmpty() {
    return first == null;
  }
}
