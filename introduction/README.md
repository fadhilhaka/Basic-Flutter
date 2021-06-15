# Flutter

Flutter adalah SDK (Software Development Kit) yang dikembangkan oleh Google untuk membuat aplikasi yang bisa berjalan pada berbagai platform. 

Flutter 2 yang merupakan versi terbaru memberikan dukungan pada Anda untuk membangun aplikasi pada sistem operasi Android, iOS, Web, Windows, Linux, dan MacOS.

Dengan ini, Anda cukup sekali coding atau dikenal dengan single codebase, selain itu Flutter bersifat open source.

Flutter berbeda dari kebanyakan SDK Cross-platform lainnya untuk membuat aplikasi mobile. 

Untuk menarik widget, Flutter bukan menggunakan WebView maupun widget OEM, melainkan mesin rendering berkinerja tinggi.

Flutter dapat digunakan bersamaan dengan aplikasi native yang sudah ada atau digunakan secara keseluruhan untuk aplikasi baru. 

Beberapa kelebihan dari Flutter, antara lain:

1. Flutter memungkinkan kita untuk membuat aplikasi yang indah (beautiful)
   
   Desainer dapat dengan bebas berkreasi tanpa adanya banyak batasan dari framework. Flutter juga dapat mengontrol setiap piksel yang ada di layar, sehingga memudahkan dalam membuat animasi. Flutter menyediakan banyak komponen material design yang dapat berjalan baik pada Android, iOS, dan web.

2. Flutter berjalan dengan sangat cepat (fast)
   
   Flutter menggunakan graphic engine bernama Skia-2D yang juga digunakan pada Chrome dan Android. Kode Flutter menggunakan bahasa Dart, yang memungkinkan untuk dikompilasi ke kode native 32-bit dan 64-bit ARM untuk iOS dan Android.

3. Flutter sangat produktif (productive)
   
   Flutter memiliki fitur hot-reload yang memungkinkan Anda untuk melihat hasil kompilasi secara real-time. Dengan hot-reload, Anda dapat dengan mudah melihat perubahan kode pada perangkat, tanpa perlu menunggu restart dan kehilangan state.

4. Flutter bersifat terbuka (open source)
   
   Flutter adalah proyek open source dengan lisensi BSD. Kode yang ada di Flutter berasal dari kontribusi ratusan developer dari seluruh dunia. Banyak plugin yang sudah dibuat oleh developer. Anda dapat ikut berkontribusi mengembangkan Flutter dengan melaporkan bug/issue atau ikut memperbaiki kode yang sudah ada. Source code dari Flutter dapat Anda temukan pada tautan https://github.com/flutter/flutter.

## Dart 

Aplikasi Flutter ditulis dengan bahasa [Dart](https://github.com/fadhilhaka/Basic-Dart).

## Menjalankan Aplikasi pada Android Device

Menjalankan aplikasi menggunakan perangkat fisik memiliki beberapa kelebihan jika dibandingkan dengan emulator, yaitu:

* Lebih cepat,
* Lebih ringan, dan
* Lebih mudah.

Dengan menggunakan peranti smartphone asli, kita dapat memastikan bahwa aplikasi kita berjalan dengan wajar ketika sudah sampai di tangan pengguna.

Mari ikuti langkah-langkah untuk menjalankan proses run atau debugging. Tampilan dari langkah berikut bisa dipastikan akan berbeda dengan peranti yang Anda pakai. Akan tetapi secara garis besar langkahnya akan sama.

1. Pastikan peranti yang akan dipakai sesuai dengan target SDK atau paling tidak mendukung versi SDK terendah yang digunakan aplikasi.
2. Buka setting dan masuk ke dalam menu About. Pada halaman menu ini, Anda perlu menemukan informasi tentang Build number.
3. Kemudian tekan Build number sebanyak 7 kali.
4. Kembali ke menu setting di awal dan akan muncul menu baru di bawah about yaitu Developer Options.
5. Masuk ke dalam menu Developer Options dan pastikan opsi USB Debugging Mode sudah dalam keadaan On.
6. Setelah menyelesaikan pengaturan pada peranti, peranti pun dapat dihubungkan dengan laptop atau komputer yang Anda pakai.

## Menjalankan Aplikasi pada Web

Dalam proses pengembangan, untuk keperluan debugging kita perlu menggunakan [Google Chrome](https://www.google.com/chrome/) sebagai browser. Flutter 2 telah mengumumkan bahwa Flutter Web sudah memasuki versi stable sehingga bisa digunakan secara langsung.

Untuk menambahkan dukungan web pada project Anda, jalankan perintah berikut melalui terminal dari lokasi project:

~~~
flutter create .
~~~

Setelah berhasil, folder web akan ditambahkan ke dalam folder project Anda. Di dalam folder ini akan berisi berkas html dan konfigurasi web lainnya. Anda bisa mencoba menjalankan aplikasi web Flutter ini dengan memilih target device chrome pada IDE yang Anda gunakan.

Anda dapat menjalankan aplikasi dengan cara yang sama seperti ketika menjalankannya pada platform mobile. Jika Anda ingin menjalankan melalui terminal, maka perintahnya adalah seperti ini:

~~~
flutter run -d chrome
~~~

Setelah proses build selesai, jendela browser akan muncul dan menampilkan aplikasi Anda.

Pada Flutter Web, perlu diperhatikan bahwa Flutter memiliki dua jenis renderer yang berbeda.

1. HTML renderer
   
   Renderer ini menggunakan kombinasi elemen HTML, CSS, Canvas, dan SVG. Jenis renderer ini memiliki ukuran unduhan yang lebih kecil.

2. CanvasKit renderer
   
   Renderer ini bekerja dengan cara yang sama dengan platform mobile atau desktop. CanvasKit renderer memiliki performa yang lebih tinggi, tetapi menambahkan ukuran hingga sekitar 2 MB.

Anda dapat menentukan renderer yang digunakan dengan menambahkan parameter pada command line, contohnya seperti berikut:

~~~
flutter run -d chrome --web-renderer html
flutter run -d chrome --web-renderer canvaskit
~~~

Jika Anda tidak mendefinisikan parameter --web-renderer, maka renderer akan menggunakan mode auto (default). Opsi ini akan menggunakan HTML renderer ketika aplikasi berjalan di browser mobile dan menggunakan CanvasKit saat aplikasi berjalan di browser desktop.

## Hot Reload

Hot reload menyebabkan semua widget yang ada dibangun kembali. Hanya kode yang terlibat dalam rebuilding widget yang dieksekusi ulang secara otomatis. Seperti contoh fungsi main dan initState tidak akan dijalankan kembali jika menggunakan hot reload.

* **Hot reload** memuat perubahan kode ke dalam VM dan menjalankan kembali metode build yang ada di dalam widget. Ini akan membangun kembali widget-widget yang ada, dan mempertahankan status terakhir aplikasi.
* **Hot restart** memuat perubahan kode ke dalam VM dan mengulang kembali aplikasi dari awal dan akan kehilangan state aplikasi (kembali ke nilai awal).
* **Full restart** mengkompilasi kode dari awal, tidak ada pintasan keyboard untuk ini, Anda harus menghentikan dan menjalankan kembali project (klik stop kemudian run kembali).