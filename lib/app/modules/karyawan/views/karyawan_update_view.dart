// import 'package:bcdx_11312136/app/modules/mahasiswa/controllers/mahasiswa_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/karyawan/controllers/karyawan_controller.dart';

class KaryawanUpdateView extends GetView<KaryawanController> {
  const KaryawanUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Karyawan'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller. GetDataById(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNo_Karyawan.text = data['no_karyawan'];
            controller.cNama_Karyawan.text = data['nama_karyawan'];
            controller.cJabatan_Karyawan.text = data['jabatan_karyawan'];
            // controller.cFakultas.text = data['fakultas'];

            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: controller.cNo_Karyawan,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "No"),
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
                  //   controller: controller.cNama,
                  //   textInputAction: TextInputAction.done,
                  //   decoration: InputDecoration(labelText: "Fakultas"),
                  // ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  ElevatedButton(
                    onPressed: () => controller.Update(
                      controller.cNo_Karyawan.text,
                      controller.cNama_Karyawan.text,
                      controller.cJabatan_Karyawan.text,
                      // controller.cFakultas.text,
                      Get.arguments,
                    ),
                    child: Text("Ubah"),
                  )
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

