import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KaryawanController extends GetxController {

  late TextEditingController cNo_Karyawan;
  late TextEditingController cNama_Karyawan;
  late TextEditingController cJabatan_Karyawan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference karyawan = firestore.collection('karyawan_22312141');

    return karyawan.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference karyawan = firestore.collection('karyawan_22312141');
    return karyawan.snapshots();
  }

  void add(String no_karyawan, String nama_karyawan, String jabatan_karyawan) async {
    CollectionReference karyawan = firestore.collection("karyawan_22312141");

    try {
      await karyawan.add({
        "no_karyawan": no_karyawan,
        "nama_karyawan": nama_karyawan,
        "jabatan_karyawan": jabatan_karyawan,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data karyawan",
          onConfirm: () {
            cNo_Karyawan.clear();
            cNama_Karyawan.clear();
            cJabatan_Karyawan.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
    print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan karyawan.",
      );
    }
  }

Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("karyawan_22312141").doc(id);

    return docRef.get();
  }

  void Update(String no_karyawan, String nama_karyawan, String jabatan_karyawan, String id) async {
    DocumentReference KaryawanById = firestore.collection("karyawan_22312141").doc(id);

    try {
      await KaryawanById.update({
        "no_karyawan": no_karyawan,
        "nama_karyawan": nama_karyawan,
        "jabatan_karyawan": jabatan_karyawan,
              });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data karyawan.",
        onConfirm: () {
          cNo_Karyawan.clear();
          cNama_Karyawan.clear();
          cJabatan_Karyawan.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan peegawai.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("karyawan_22312141").doc(id);

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

    cNo_Karyawan = TextEditingController();
    cNama_Karyawan = TextEditingController();
    cJabatan_Karyawan = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNo_Karyawan.dispose();
    cNama_Karyawan.dispose();
    cJabatan_Karyawan.dispose();
    super.onClose();
  }

  // add(String text, String text2) {}
}

