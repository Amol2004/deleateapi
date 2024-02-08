import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deleateapi/cubit/delete_cubit.dart'; // Assuming you have the correct import for DeleteCubit

class Delete extends StatefulWidget {
  const Delete({Key? key}) : super(key: key);

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  // ignore: prefer_final_fields
  TextEditingController _editingController = TextEditingController();
    late int idtodelete;
  @override
  void initState() {
    // context.read<DeleteCubit>().deleteData(id: 1);
    super.initState();
    context.read<DeleteCubit>().deleteData(id: 0);
    // context.read<HomeCubit>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deleting Data')),
      body: BlocBuilder<DeleteCubit, DeleteState>(
        builder: (context, state) {
          if (state is DeleteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DeleteLoaded) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text('Data deleted successfully!'),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back or perform other actions
                      // Navigator.pop(context);
                    },
                    child: const Text("Ok"),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      // Navigate to the next screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const PostOne(),
                      //   ),
                      // );
                    },
                    child: const Text("Click Me To Go Next.."),
                  ),
                ],
              ),
            );
          } else if (state is DeleteError) {
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _editingController,
                      decoration: const InputDecoration(
                        labelText: 'Enter Id',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String enteredId = _editingController.text;
                      if (enteredId.isNotEmpty) {
                        int? idToDelete = int.tryParse(enteredId);

                        if (idToDelete != null) {
                          context.read<DeleteCubit>().deleteData(id: idToDelete);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Invalid ID format. Please enter a valid integer.',
                              ),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter an ID before deleting.'),
                          ),
                        );
                      }
                    },
                    child: const Text("Delete"),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      // Navigate to the next screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const PostOne(),
                      //   ),
                      // );
                    },
                    child: const Text("Click Me To Go Next"),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

// import 'package:deleateapi/cubit/delete_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Delete extends StatefulWidget {
//   const Delete({Key? key}) : super(key: key);

//   @override
//   State<Delete> createState() => _DeleteState();
// }

// class _DeleteState extends State<Delete> {
//   TextEditingController _editingController = TextEditingController();

//   @override
//   void initState() {
//     context.read<DeleteCubit>().deleteData();
//     context.read<HomeCubit>().getData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Deleting Data')),
//       body: BlocBuilder<DeleteCubit, DeleteState>(
//         builder: (context, state) {
//           if (state is DeleteLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is DeleteLoaded) {
//             return Center(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 10),
//                   const Text('Data deleted successfully!'),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Navigate or perform any other action
//                     },
//                     child: const Text("Ok"),
//                   ),
//                   const SizedBox(height: 20),
//                   OutlinedButton(
//                     onPressed: () {
//                       // Navigate or perform any other action
//                     },
//                     child: const Text("Click Me To Go Next.."),
//                   ),
//                 ],
//               ),
//             );
//           } else if (state is DeleteError) {
//             return Center(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       controller: _editingController,
//                       decoration: const InputDecoration(
//                         labelText: 'Enter Id',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                         ),
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       String enteredId = _editingController.text;

//                       if (enteredId.isNotEmpty) {
//                         int? idToDelete = int.tryParse(enteredId);

//                         if (idToDelete != null) {
//                           context.read<DeleteCubit>().deleteData(id: idToDelete);
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text('Invalid ID format. Please enter a valid integer.'),
//                             ),
//                           );
//                         }
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Please enter an ID before deleting.'),
//                           ),
//                         );
//                       }
//                     },
//                     child: const Text("Delete"),
//                   ),
//                   const SizedBox(height: 10),
//                   OutlinedButton(
//                     onPressed: () {
//                       // Navigate or perform any other action
//                     },
//                     child: const Text("Click Me To Go Next"),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
