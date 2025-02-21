import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/modules/dosen/views/dosen_add_view.dart';
import 'package:myapp/app/modules/dosen/views/dosen_view.dart';
import 'package:myapp/app/modules/karyawan/views/karyawan_add_view.dart';
import 'package:myapp/app/modules/karyawan/views/karyawan_view.dart';
import 'package:myapp/app/modules/mahasiswa/views/mahasiswa_add_view.dart';
import 'package:myapp/app/modules/mahasiswa/views/mahasiswa_view.dart';
import 'package:myapp/app/modules/pegawai/views/pegawai_add_view.dart';
import 'package:myapp/app/modules/pegawai/views/pegawai_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return DashboardAdmin();
  }
}

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  final cAuth = Get.find<AuthController>();
  int _index = 0;
  List<Map> _fragment = [
    {
      'title': 'Dashboard',
      'view': MahasiswaView(),
      'add': () => MahasiswaAddView(),
    },
    {
      'title': 'Data Mahasiswa',
      'view': MahasiswaView(),
      'add': () => MahasiswaAddView(),
    },
    {
      'title': 'Data Dosen',
      'view': DosenView(),
      'add': () => DosenAddView(),
    },
    {
      'title': 'Data Karyawan',
      'view': KaryawanView(),
      'add': () => KaryawanAddView(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        titleSpacing: 0,
        title: Text(_fragment[_index]['title']),
        actions: [
          IconButton(onPressed: () => Get.to(_fragment[_index]['add']), 
          icon: Icon(Icons.add_circle_outline),
          )
        ],
      ),
      body: _fragment[_index]['view'],
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Colors.white,
                ),
                Text(
                  "Keyzha Aruha Putra",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Admin',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 0);
              Get.back();
            },
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.teal,
            textColor: Colors.teal,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 1);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Mahasiswa'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.teal,
            textColor: Colors.teal,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 2);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Dosen'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.teal,
            textColor: Colors.teal,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 3);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Karyawan'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.teal,
            textColor: Colors.teal,
          ),
          ListTile(
            onTap: () {
              Get.back();
              cAuth.logout();
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.teal,
            textColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}



// code lama

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:myapp/app/controllers/auth_controller.dart';

// import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   // HomeView({super.key});

//   final cAuth = Get.find<AuthController>();

//   @override
//   Widget build(BuildContext context) {
//     return DashboardAdmin();
//   }
// }

// // Suggested code may be subject to a license. Learn more: ~LicenseLog:4079973674.
// // Suggested code may be subject to a license. Learn more: ~LicenseLog:336436661.
// class DashboardAdmin extends StatefulWidget {
//   const DashboardAdmin({super.key});

//   @override
//   State<DashboardAdmin> createState() => _DashboardAdminState();
// }

// class _DashboardAdminState extends State<DashboardAdmin> {
//   final cAuth = Get.find<AuthController>();
//   int _index = 0;
//   List<Map> _fragment = [
//     {'title': 'Dashboard', 'view': 'Dashboard'},
//     {'title': 'Data Mahasiswa', 'view': 'Mahasiswa'},
//     {'title': 'Data Dosen', 'view': 'Dosen'},
//     {'title': 'Data Pegawai', 'view': 'Pegawai'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: drawer(),
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         titleSpacing: 0,
//         title: Text(_fragment[_index]['title']),
//       ),
//     );
//   }

//   Widget drawer() {
//     return Drawer(
//       child: ListView(
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.teal,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Icon(
//                   Icons.account_circle,
//                   size: 80,
//                   color: Colors.white,
//                 ),
//                 Text(
//                   "Dca 027",
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//                 SizedBox(
//                   height: 2,
//                 ),
//                 Text(
//                   'Admin',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ListTile(
//             onTap: () {
//               setState(() => _index = 0);
//               Get.back();
//             },
//             leading: Icon(Icons.dashboard),
//             title: Text('Dashboard'),
//             trailing: Icon(Icons.navigate_next),
//             iconColor: Colors.teal,
//             textColor: Colors.teal,
//           ),
//           ListTile(
//             onTap: () {
//               setState(() => _index = 1);
//               Get.back();
//             },
//             leading: Icon(Icons.people),
//             title: Text('Data Mahasiswa'),
//             trailing: Icon(Icons.navigate_next),
//             iconColor: Colors.teal,
//             textColor: Colors.teal,
//           ),
//           ListTile(
//             onTap: () {
//               setState(() => _index = 2);
//               Get.back();
//             },
//             leading: Icon(Icons.people),
//             title: Text('Data Dosen'),
//             trailing: Icon(Icons.navigate_next),
//             iconColor: Colors.teal,
//             textColor: Colors.teal,
//           ),
//           ListTile(
//             onTap: () {
//               setState(() => _index = 3);
//               Get.back();
//             },
//             leading: Icon(Icons.people),
//             title: Text('Data Pegawai'),
//             trailing: Icon(Icons.navigate_next),
//             iconColor: Colors.teal,
//             textColor: Colors.teal,
//           ),
//           ListTile(
//             onTap: () {
//               Get.back();
//               cAuth.logout();
//             },
//             leading: Icon(Icons.logout),
//             title: Text('Logout'),
//             trailing: Icon(Icons.navigate_next),
//             iconColor: Colors.teal,
//             textColor: Colors.teal,
//           ),
//         ],
//       ),
//     );
//   }
// }

// akhir code



    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('HomeView'),
    //     centerTitle: true,
    //   ),

    //   // floatingActionButton: FloatingActionButton(
    //   //   onPressed: () {
    //   //     Get.defaultDialog(
    //   //       title: "Logout?",
    //   //       middleText: "Are you sure want to logout?",
    //   //       onConfirm: () {
    //   //         Get.back();
    //   //         // Tambahkan kode untuk logout di sini
    //   //       },
    //   //       onCancel: () {
    //   //         Get.back();
    //   //       },
    //   //     );
    //   //   },
    //   //   child: const Icon(Icons.logout),
    //   // ),

    //   body: Center(
    //     child: ElevatedButton(
    //           onPressed: () {
    //             cAuth.logout();
    //           },
    //           // child: const Text('My Button'),
    //           child: const Icon(Icons.logout),
              
    //         ),
      
    //     // child: Text(
    //     //   'HomeView is working',
    //     //   style: TextStyle(fontSize: 20),
    //     // ),
        
    //   ),
    // );
//   }
// }


// code baru