import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DosenController extends GetxController {
  //TODO: Implement dosen Controller
  late TextEditingController cNidn;
  late TextEditingController cNama;
  late TextEditingController cProdi;
  late TextEditingController cFakultas;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference dosen = firestore.collection('dosen');

    return dosen.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference dosen = firestore.collection('dosen');
    return dosen.snapshots();
  }

  void add(String nidn, String nama, String prodi, String fakultas) async {
    CollectionReference dosen = firestore.collection("dosen");

    try {
      await dosen.add({
        "nidn": nidn,
        "nama": nama,
        "prodi": prodi,
        "fakultas": fakultas,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data dosen",
          onConfirm: () {
            cNidn.clear();
            cNama.clear();
            cProdi.clear();
            cFakultas.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
    print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan dosen.",
      );
    }
  }

Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("dosen").doc(id);

    return docRef.get();
  }

  void Update(String nidn, String nama, String id, String prodi, String fakultas) async {
    DocumentReference dosenById = firestore.collection("dosen").doc(id);

    try {
      await dosenById.update({
        "nidn": nidn,
        "nama": nama,
        "prodi": prodi,
        "fakultas": fakultas
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data dosen.",
        onConfirm: () {
          cNidn.clear();
          cNama.clear();
          cProdi.clear();
          cFakultas.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan dosen.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("dosen").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    cNidn = TextEditingController();
    cNama = TextEditingController();
    cProdi = TextEditingController();
    cFakultas = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNidn.dispose();
    cNama.dispose();
    cProdi.dispose();
    cFakultas.dispose();
    super.onClose();
  }

  // add(String text, String text2) {}
}


// end code

// import 'package:get/get.dart';

// class DosenController extends GetxController {
//   //TODO: Implement DosenController

//   final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }

//   void increment() => count.value++;
// }
