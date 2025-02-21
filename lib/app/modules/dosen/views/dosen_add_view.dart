// import 'package:bcdx_11312136/app/modules/mahasiswa/controllers/mahasiswa_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/dosen/controllers/dosen_controller.dart';

class DosenAddView extends GetView<DosenController> {
  const DosenAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Dosen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNidn,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Nidn"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNama,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller.cProdi,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Prodi"),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller.cFakultas,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Fakultas"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cNidn.text,
                controller.cNama.text,
                controller.cProdi.text,
                controller.cFakultas.text
              ),
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}


// akhir code

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// class MahasiswaAddView extends GetView {
//   const MahasiswaAddView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MahasiswaAddView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'MahasiswaAddView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }


// end code

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// class DosenAddView extends GetView {
//   const DosenAddView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('DosenAddView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'DosenAddView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
