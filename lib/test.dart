// import 'package:flutter/material.dart';

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   List<String> _selectedItems = [];

//   void _handleItemSelection(String item) {
//     setState(() {
//       if (_selectedItems.contains(item)) {
//         _selectedItems.remove(item);
//       } else {
//         _selectedItems.add(item);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Multi-Select Input Field'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CheckboxSelectionList(
//               items: const [
//                 'Item 1',
//                 'Item 2',
//                 'Item 3',
//                 'Item 4',
//                 'Item 5',
//                 'Item 6',
//                 'Item 7',
//                 'Item 8',
//                 'Item 9',
//                 'Item 10',
//               ],
//               onItemSelectionChanged: _handleItemSelection,
//               selectedItems: _selectedItems,
//             ),
//             const SizedBox(height: 20),
//             Text('Selected Items: ${_selectedItems.join(', ')}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<String> selectedItems = [];

// const CheckboxSelectionList({Key? key, required this.items})
  //  super(key: key);
  Widget CheckboxSelectionList(List<String> items) {
    return ListView(
      children: items.map((item) {
        return CheckboxListTile(
          title: Text(item),
          value: selectedItems.contains(item),
          onChanged: (bool? value) {
            setState(() {
              if (value == true) {
                selectedItems.add(item);
              } else {
                selectedItems.remove(item);
              }
            });
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CheckboxSelectionList(
          const [
            'Item 1',
            'Item 2',
            'Item 3',
            'Item 4',
            'Item 5',
            'Item 6',
            'Item 7',
            'Item 8',
            'Item 9',
          ],
        ),
      ],
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: MyStatefulWidget(),
//   ));
// }
// import 'package:flutter/material.dart';

// class CheckboxSelectionList extends StatelessWidget {
//   final List<String> items;

//   const CheckboxSelectionList({Key? key, required this.items})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return CheckboxListTile(
//           title: Text(items[index]),
          
//           value: true, // Set the initial value of the checkbox
//           onChanged: (value) {
//             print(value);
//             // Handle checkbox value change
//           },
//         );
//       },
//     );
//   }
// }

// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CheckboxSelectionList(
//             items: const [
//               'Item 1',
//               'Item 2',
//               'Item 3',
//               'Item 4',
//               'Item 5',
//               'Item 6',
//               'Item 7',
//               'Item 8',
//               'Item 9',
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
