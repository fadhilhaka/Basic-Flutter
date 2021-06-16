# Fundamental

## Struktur Project Flutter

Setelah membuat project Flutter pertama kali, flutter akan membuatkan struktur project. Ketika membuka folder project Flutter pada berkas explorer, kita akan mendapati folder-folder seperti berikut:

![](https://d17ivq9b7rppb3.cloudfront.net/original/academy/2020061209403347ce68632ed2f31ed6b8be9f67cc0e57.jpeg)

Berikut beberapa folder yang harus Anda ketahui:

* android/
  
  Folder ini merupakan tempat Anda untuk mengatur konfigurasi untuk aplikasi android. Di dalamnya terdapat file gradle, AndroidManifest, dan lain-lain. File-file tersebut sangat umum ketika Anda membuat aplikasi android native (menggunakan bahasa pemrograman Java atau Kotlin), nanti Anda akan melakukan beberapa setting pada folder android seiring waktu.

* ios/
  
  Sama halnya dengan folder android, hanya saja ini untuk iOS. Folder ini merupakan tempat konfigurasi untuk aplikasi iOS. Ketika kita hendak membuat project flutter yang dapat berjalan pada iPhone, Anda akan berkutat dengan folder ini.

* build/
  
  Ketika Anda melakukan build project flutter, hasil build akan ada pada folder ini. Sebagai contoh, ketika Anda ingin membuat file APK untuk project flutter, maka hasil file tersebut ada dalam folder ini. Folder ini hanya akan ada ketika sudah pernah mem-build project, dan akan terhapus jika menjalankan flutter clean.

* lib/
  
  Ini merupakan folder utama ketika Anda mengerjakan project flutter. Seluruh source code flutter Anda akan berada pada folder ini.

* test/
  
  Folder ini tempat Anda menyimpan source code testing. Untuk pemula tidak akan berkutat pada folder ini.

~~~
import 'package:flutter/material.dart';
~~~

**Import** digunakan untuk memanggil fungsi-fungsi dari berkas Flutter yang lain. Pada kode di atas, kita meng-import kode-kode yang terdapat dalam library material bawaan Flutter. Library tersebut menyediakan widget yang termasuk dalam material design. Pastikan kode ini ada pada bagian atas sebelum kode lain dijalankan.

~~~
void main() => runApp(MyApp());
~~~

**main()** merupakan kode dasar dari project Flutter kita. Flutter akan menjalankan fungsi **main()** pertama kali, yang nantinya akan menjalankan **runApp()** dan memanggil **MyApp()**.

~~~
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     theme: ThemeData(
       primarySwatch: Colors.blue,
     ),
     home: Scaffold(
       appBar: AppBar(
         title: Text('Hello, world!'),
       ),
       body: Center(
         child: Text('Hello, world!'),
       ),
     ),
   );
 }
}
~~~

MyApp di sini merupakan sebuah class yang menampilkan komponen Flutter ke layar atau dikenal dengan Widgets.

Setiap komponen di dalam Flutter terdiri dari widget. Bahkan aplikasi Flutter itu sendiri merupakan sebuah widget.

Pada contoh kode di atas kelas MyApp yang merupakan sebuah widget mengembalikan atau menampilkan widget MaterialApp. MaterialApp ini adalah widget bawaan Flutter yang akan menjadi fondasi dari aplikasi Anda.

Widget ini mengatur beberapa hal, termasuk tema aplikasi, tampilan utama aplikasi, rute untuk navigasi antar halaman, dan lain-lain.

Selanjutnya Scaffold memungkinkan kita mendesain struktur layout dasar yang sesuai dengan material design. Dengan Scaffold Anda dapat mengatur App Bar, Floating Action Button, Drawer, dan lain-lain.

Ibarat rumah, MaterialApp ini adalah sebagai tanah yang umumnya digunakan hanya sekali saja, sedangkan Scaffold ini adalah sebagai tembok atau bangunannya.

Terakhir, seharusnya sudah cukup jelas kita menggunakan widget Text untuk menampilkan teks. Pada contoh diatas widget Text dibungkus dengan widget Center yang berfungsi supaya widget di dalamnya (child) tampil pada posisi tengah.

## Menggunakan Packages

Dalam pengembangan suatu aplikasi, kita tidak akan lepas dari package/library (selanjutnya akan disebut package).

Package di sini merupakan sebuah kode yang dibuat untuk menyelesaikan suatu masalah. Contohnya ketika aplikasi yang kita buat membutuhkan fitur kalender sementara fitur tersebut tidak di-support oleh Flutter. Alih-alih membuat fitur kalender dari nol, kita dapat menggunakan package yang telah dibuat oleh developer lain.

Package dependencies merupakan sekumpulan package yang dibutuhkan dalam pengembangan aplikasi. Package tersebut akan diatur oleh package manager.

Setiap bahasa pemrograman memiliki package manager-nya masing-masing, contohnya NodeJS memiliki npm atau yarn, Java dengan maven atau gradle, PHP dengan composer. Begitu pula dengan Flutter yang ditulis dengan bahasa dart memiliki package manager bernama pub.

### Dart Pub

Pub memiliki tugas untuk mengatur package apa saja yang dibutuhkan dalam pengembangan aplikasi. Pada package manager kita dapat mengatur versi package yang ingin kita gunakan.

Pengaturan versi sangat penting karena ketika versi flutter/dart yang digunakan tidak cocok dengan package yang kita butuhkan akan berpengaruh pada jalannya aplikasi yang kita buat. Oleh karena itu, kita harus memastikan versi yang kompatibel dengan versi Flutter yang terinstal.

Untuk mengatur package-package yang akan kita gunakan, cukup buka berkas **pubspec.yaml** yang ada pada folder project.

~~~
dependencies:
  flutter:
    sdk: flutter
 
  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.2
 
dev_dependencies:
  flutter_test:
    sdk: flutter
~~~

Kode di atas merupakan package-package yang digunakan pada project Flutter kita. Jika kita perhatikan, terdapat 2 jenis dependency yaitu **dependencies** dan **dev_dependencies**.

Fungsi **dev_dependencies** digunakan untuk package-package yang berkaitan ketika proses pengembangan aplikasi Flutter, contohnya seperti **flutter_test** yang digunakan untuk testing.

Package di dalam **dev_dependencies** tidak akan disertakan ketika aplikasi dirilis pada play store atau app store.

Fungsi **dependencies** digunakan untuk package-package yang langsung berkaitan dengan fitur aplikasi Flutter, contohnya seperti **cupertino_icons** yang digunakan untuk mendapatkan ikon-ikon cupertino (icon untuk iOS) dan contoh lainnya seperti **cloud_firestore** yang merupakan package untuk firebase firestore.

Untuk mendaftarkan package yang dibutuhkan kita cukup menulis seperti di bawah ini pada bagian dependencies:

~~~
nama_package: versi
~~~

Penulisan versi bisa langsung seperti contoh **0.1.2**, atau kita menambahkan simbol caret (**^**) menjadi **^0.1.2**.

Simbol caret (**^**) artinya: gunakan versi patch terbaru dari versi yang telah ditentukan. Jika versi nya **^0.1.2** artinya kita akan gunakan versi minimal **0.1.2** dan maksimal versi terbaru. Karena itu, jika versi package tersebut sekarang sudah update, maka package yang digunakan merupakan versi terbaru.

Kita juga bisa gunakan versi minimal dan maksimal seperti contoh ‘**>=0.1.2 <2.0.0**’ yang artinya kita akan menggunakan versi terbaru yang ada pada saat ini yang masih berada di dalam range tersebut yaitu lebih besar sama dengan **0.1.2** dan lebih kecil dari **2.0.0**.

Sebagai contoh kita akan menambahkan sebuah package provider yang nantinya akan kita gunakan.

~~~
dependencies:
  flutter:
    sdk: flutter
 
  cupertino_icons: ^0.1.2
  provider: ^4.0.1
~~~

Yang perlu diperhatikan dalam menulis berkas **.yaml** adalah pada **indentasi**nya. 

Indentasi atau penggunaan spasi ini sangat penting karena menunjukkan urutan dan blok kode yaml yang dibaca oleh komputer.

Sebagai contoh, ketika kita menambahkan package **provider**, maka kita harus menuliskannya sejajar dengan package lainnya dan juga lebih menjorok ke dalam jika dibandingkan dengan **dependencies**.

Ini menunjukkan bahwa package seperti **cupertino_icons** dan **provider** merupakan bagian dari **dependencies** yang akan ditambahkan.

Setiap jaraknya adalah **2 spasi**, jika **dependencies** menempel pada ujung kiri, maka **cupertino_icons** dan **provider** berjarak **2 spasi dari ujung kiri**.

Setelah menambahkan package yang dibutuhkan, kita dapat melakukan **get package** tersebut. 

Jika Anda menggunakan visual studio code cukup simpan berkas **pubspec.yaml**, maka nanti akan secara otomatis mensinkronisasi pubspec tersebut. 

Bila menggunakan Android Studio Anda cukup menekan tombol "**Pub get**"

Kita juga bisa secara manual menggunakan terminal dengan menjalankan perintah **flutter pub get** di dalam project tersebut.

Berikut website-website yang dapat Anda gunakan untuk mencari package.

* https://pub.dev
* https://flutterawesome.com

### Private Packages

Selain menggunakan package yang ada pada pub.dev Anda juga bisa menggunakan package yang tidak dipublikasikan pada pub.dev tersebut dengan cara menggunakan url git package tersebut:

~~~
dependencies:
  plugin1:
    git:
      url: git://github.com/flutter/plugin1.git
~~~

Atau path direktori package tersebut yang tersimpan secara offline di komputer Anda.

~~~
dependencies:
  plugin1:
    path: ../plugin1/
~~~