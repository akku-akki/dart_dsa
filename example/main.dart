import 'package:dart_dsa/dart_dsa.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new DSA(),
    );
  }
}

class DSA extends StatefulWidget {
  @override
  _DSAState createState() => _DSAState();
}

class _DSAState extends State<DSA> {
  void runDSA() {
    LinkedList<int> ll = LinkedList<int>();
    ll.addFirst(1);
    ll.addFirst(1);
    ll.addFirst(1);
    ll.toArray();
    ll.removeFirst();
    ll.reverse();

    HashTable<int, String> hashTable = HashTable(10);
    hashTable.put(1, "One");
    print(hashTable.getValue(1));
    hashTable.remove(1);

    StackLinkedList<int> stackLinkedList = StackLinkedList<int>();
    stackLinkedList.push(1);
    print(stackLinkedList.isEmpty());
    print(stackLinkedList.peek());
    print(stackLinkedList.size());
    print(stackLinkedList.pop());

    var value = StringAlgos.reverseString("fly with flutter");
    print(value);
    var value2 = StringAlgos.searchFirstNonRepeatingChar("fly with flutter");
    print(value2);
    var value3 = StringAlgos.searchFirstRepeatedChar("fly with flutter");
    print(value3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DSA in dart"),
      ),
      body: Center(
        child: FlatButton(onPressed: null, child: Text("Run DSA")),
      ),
    );
  }
}
