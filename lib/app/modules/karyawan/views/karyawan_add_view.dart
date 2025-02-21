// import 'package:bcdx_11312136/app/modules/mahasiswa/controllers/mahasiswa_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/karyawan/controllers/karyawan_controller.dart';

class KaryawanAddView extends GetView<KaryawanController> {
  const KaryawanAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Karyawan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNo_Karyawan,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "No Karyawan"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNama_Karyawan,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller.cJabatan_Karyawan,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Jabatan"),
            ),
            SizedBox(
              height: 30,
            ),
            // TextField(
            //   controller: controller.cFakultas,
            //   textInputAction: TextInputAction.done,
            //   decoration: InputDecoration(labelText: "Fakultas"),
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cNo_Karyawan.text,
                controller.cNama_Karyawan.text,
                controller.cJabatan_Karyawan.text,
                // controller.cFakultas.text
              ),
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}

