
import 'package:dart_dsa/src/linked_list/linked_list.dart';

class _Entry<K, V> {
  K _k;
  V _v;

  _Entry(K key, V value) {
    this._k = key;
    this._v = value;
  }
}

class HashTable<K, V> {
  List<LinkedList<_Entry>> _entries;

  HashTable(int capacity) {
    _entries = List<LinkedList<_Entry>>(capacity);
  }

/// Add a new key value pair
  void put(K key, V value) {
    var index = _hash(key);
    if (_entries[index] == null) {
      _entries[index] = LinkedList<_Entry>();
    }
    var currentNode = _entries[index].first;
    while (currentNode != null) {
      if (currentNode.value._k == key) {
        currentNode.value._v = value;
        return;
      }
      currentNode = currentNode.next;
    }
    _entries[index].addFirst(_Entry(key, value));
  }

/// Returns value for provided key
  V getValue(K key) {
    int index = _hash(key);
    var bucket = _entries[index];
    if (bucket != null) {
      var current = _entries[index].first;
      while (current != null) {
        if (current.value._k == key) {
          return current.value._v;
        }
        current = current.next;
      }
    }
    return null;
  }

/// Removes key, value for given key
  void remove(K key) {
    var index = _hash(key);
    var bucket = _entries[index];
    if (bucket == null) throw Exception('Value not found');
    var current = _entries[index].first;
    while (current != null) {
      if (current.value._k == key) {
        bucket.remove(current);
        return;
      }
      current = current.next;
    }
  }

  int _hash(K key) {
    int hashcode = key.hashCode;
    int index = hashcode % _entries.length;
    return index;
  }
}
