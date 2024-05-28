// body: (_tasks == null)
//     ? Center(
//         child: Text("No tasks yet!"),
//       )
//     : ListView(
//         children: _tasks
//             .map((e) => Container(
//                   height: 70,
//                   width: width,
//                   margin: EdgeInsets.only(left: 15, right: 15, top: 10),
//                   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                   alignment: Alignment.centerLeft,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         e.task!,
//                         style: TextStyle(fontSize: 17),
//                       ),
//                       Checkbox(
//                         value: _taskDone[_tasks.indexOf(e)],
//                         onChanged: (val) {
//                           setState(() {
//                             _taskDone[_tasks.indexOf(e)] = val!;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ))
//             .toList()),

// floatingActionButton: FloatingActionButton(
//   child: Icon(
//     Icons.add,
//     color: Colors.black,
//   ),
//   onPressed: () => showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) => Container(
//       // height: 225,
//       padding: EdgeInsets.all(10.0),
//       color: Colors.white,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Add Text",
//                 style: TextStyle(color: Colors.brown),
//               ),
//               GestureDetector(
//                 onTap: () => Navigator.of(context).pop(),
//                 child: Icon(Icons.close),
//               )
//             ],
//           ),
//           Divider(),
//           SizedBox(height: 20),
//           TextField(
//             controller: _taskController,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 fillColor: Colors.transparent,
//                 filled: true,
//                 hintText: "Enter Task"),
//           ),
//           SizedBox(height: 20),
//           Container(
//             width: width,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   width: (width / 2) - 15,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10), // Rectangular shape
//                         ),
//                       ),
//                     ),
//                     onPressed: () => _taskController.text = '',
//                     child: Text("Reset"),
//                   ),
//                 ),
//                 Container(
//                   width: (width / 2) - 15,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10), // Rectangular shape
//                         ),
//                       ),
//                     ),
//                     onPressed: () {
//                       saveData();
//                     },
//                     child: Text("Add"),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     ),
//   ),
// ),