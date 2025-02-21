import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PegawaiController extends GetxController {

  late TextEditingController cNidn;
  late TextEditingController cNama;
  late TextEditingController cProdi;
  late TextEditingController cFakultas;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference pegawai = firestore.collection('pegawai');

    return pegawai.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference pegawai = firestore.collection('pegawai');
    return pegawai.snapshots();
  }

  void add(String nidn, String nama, String prodi, String fakultas) async {
    CollectionReference pegawai = firestore.collection("pegawai");

    try {
      await pegawai.add({
        "nidn": nidn,
        "nama": nama,
        "prodi": prodi,
        "fakultas": fakultas,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data pegawai",
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
        middleText: "Gagal Menambahkan pegawai.",
      );
    }
  }

Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("pegawai").doc(id);

    return docRef.get();
  }

  void Update(String nidn, String nama, String id, String prodi, String fakultas) async {
    DocumentReference pegawaiById = firestore.collection("pegawai").doc(id);

    try {
      await pegawaiById.update({
        "nidn": nidn,
        "nama": nama,
        "prodi": prodi,
        "fakultas": fakultas
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data pegawai.",
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
        middleText: "Gagal Menambahkan peegawai.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("pegawai").doc(id);

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

