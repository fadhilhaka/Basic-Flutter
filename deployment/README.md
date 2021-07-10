# Deployment

## Build APK

Project Flutter yang telah dibuat dapat kita build menjadi berkas .apk yang dapat berjalan di Android.

### AndroidManifest.xml

Sebelum mem-build APK, kita akan mengatur berkas **android/app/src/main/AndroidManifest.xml**.

**AndroidManifest.xml** merupakan sebuah berkas yang berisikan informasi mengenai aplikasi Android yang akan di-build. Informasi-informasi tersebut berupa nama aplikasi, ikon, permission, screen orientation, dan lain-lain.

~~~
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="id.eudeka.samples">
    <application
        android:name="io.flutter.app.FlutterApplication"
        android:label="samples"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <meta-data
              android:name="io.flutter.embedding.android.SplashScreenDrawable"
              android:resource="@drawable/launch_background"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
</manifest>
~~~

### Setting Nama Aplikasi

Untuk mengatur nama aplikasi, kita cukup mengubah properti **android:label** yang ada pada file **AndroidManifest.xml**.

Isikan **android:label** dengan nama aplikasi yang diinginkan. Atau Anda bisa gunakan [library](https://pub.dev/packages/flutter_launcher_name) untuk menghasilkan nama aplikasi dari **pubspec.yaml**.

~~~
<application
        android:name="io.flutter.app.FlutterApplication"
        android:label="Nama Aplikasi"
        android:icon="@mipmap/ic_launcher">
~~~

### Setting Ikon Aplikasi

Secara default ikon aplikasi Flutter kita adalah ikon Flutter. Untuk mengubah icon aplikasi dengan mudah, kita akan mengganti gambar **ic_launcher.png** yang berada pada folder **android/app/src/main/res/** yang terbagi menjadi berbagai mipmap (ukuran resolusi ikon).

Hal yang pertama kita lakukan adalah membuat ikon aplikasi dengan [Android Asset Studio](https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html).

Dengan Android Asset Studio, kita dapat membuat ikon aplikasi dengan mudah dan nantinya akan terbuat dalam berbagai resolusi (mipmap).

Anda bisa gunakan [library](https://pub.dev/packages/flutter_launcher_icons) untuk menghasilkan icon launcher dari **pubspec.yaml**.

### Setting Perizinan Aplikasi

Ketika aplikasi dalam mode debug atau profil, perizinan internet akan secara otomatis ditambahkan.

Namun ketika Anda ingin menjalankan atau membuatnya dalam mode rilis, Anda perlu menambahkan semua perizinan yang dibutuhkan pada **AndroidManifest**.

Untuk menambahkan perizinan pada aplikasi Android, Anda bisa menambahkan tag **uses-permission** pada **AndroidManifest**, di dalam tag **manifest** dan sejajar tag **application**.

~~~
<uses-permission android:name="android.permission.INTERNET"/>
~~~

### Melakukan Build APK

Terdapat tiga (3) jenis mode aplikasi yang perlu diketahui, yaitu debug, profile, dan release.

APK **debug** umumnya digunakan untuk pengujian dan penggunaan aplikasi secara internal. Mode **debug** digunakan secara default ketika menjalankan aplikasi menggunakan perintah **flutter run**.

Untuk bisa dirilis melalui Google Play Store, Anda perlu membuat APK **release**.

Mode **profile** sama hal nya dengan **release** hanya saja tetap dapat di-debug menggunakan tools seperti DevTools dan tidak dapat dijalankan di emulator atau simulator.

Membuat APK debug dapat dilakukan dengan menjalakan perintah melalui terminal.

~~~
flutter build apk --debug
~~~

Tunggu hingga proses build berhasil. Setelah berhasil, hasil build yang berupa berkas **apk-debug.apk** akan terletak di folder **build/app/outputs/apk/debug/** atau akan muncul direktori tempat tersimpannya berkas ketika proses build selesai pada Terminal.

Untuk bisa mem-build apk **release** dan mengunggahnya melalui Google Play Store, Anda memerlukan **signing key**. 

Secara default Flutter menggunakan **debug key** sebagai **signing key**.

Ada dua format build Android yang bisa dibuat, yaitu **.apk** dan **.aab**. Untuk melakukan build jalankan perintah berikut:

~~~
flutter build apk        // Untuk format apk
flutter build appbundle  // Untuk format aab
~~~

[Cara untuk membuat signing key dan membuat apk release](https://flutter.dev/docs/deployment/android).

## Build IPA

Build **.ipa** hanya bisa dijalankan dengan mendaftar akun [Apple Developer Program](https://developer.apple.com/programs/).

### Setting Nama Aplikasi

Untuk mengatur nama aplikasi buka berkas **Info.plist** pada direktori **/ios/Runner/**. Konfigurasi untuk nama aplikasi dapat Anda temukan dan ubah pada key **Bundle Name**.

~~~
<key>CFBundleName</key>
<string>builder</string>
~~~

Anda bisa gunakan [library](https://pub.dev/packages/flutter_launcher_name) untuk men-generate nama aplikasi melalui **pubspec.yaml**.

### Setting Ikon Aplikasi

Untuk membuat berbagai ukuran ikon untuk iOS, Anda dapat memanfaatkan website seperti https://appicon.co/. 

Perlu Anda perhatikan bahwa untuk icon pada iOS Anda tidak dapat membuatnya transparant.

Ketika Anda klik Generate, browser akan mengunduh berkas yang Anda butuhkan. Ikon untuk aplikasi iOS bisa Anda dapatkan pada folder **Assets.xcassets**.

Selanjutnya Anda dapat mengganti folder **Assets.xcassets** yang ada pada direktori **/ios/Runner/** dengan hasil ikon yang sudah Anda generate. 

Anda bisa menggunakan [library](https://pub.dev/packages/flutter_launcher_icons) untuk men-generate ikon aplikasi melalui **pubspec.yaml**.

### Melakukan build IPA

File IPA juga terbagi menjadi **debug**, **profile**, dan **release**. Namun untuk melakukan build aplikasi Flutter menjadi IPA hanya bisa dilakukan pada device macOS.

Untuk melakukan build aplikasi menjadi **.ipa** Anda cukup membuka terminal pada editor atau IDE Anda lalu menjalankan perintah berikut:

~~~
flutter build ios
~~~

Secara default perintah di atas akan menghasilkan ipa **release**, sedangkan jika Anda ingin membuat versi **debug** atau **profile**, gunakan perintah:

~~~
flutter build ios --debug
~~~

Namun, bagi Anda yang tidak mempunyai perangkat Apple jangan khawatir, Anda tetap dapat men-deploy project Anda ke iOS menggunakan CI/CD seperti [Codemagic](https://blog.codemagic.io/getting-started-with-codemagic/) dan [Bitrise](https://devcenter.bitrise.io/getting-started/getting-started-with-flutter-apps/).

## Web Deployment

### Setting Nama Aplikasi

Untuk mengatur nama aplikasi, kita bisa membuka berkas **manifest.json**. Konfigurasi untuk nama aplikasi dapat Anda temukan dan ubah pada key **name** dan **short_name**.

~~~
{
    "name": "wisata_bandung",
    "short_name": "wisata_bandung"
}
~~~

### Setting Ikon Aplikasi

Platform web juga membutuhkan icon dalam berbagai ukuran. Icon untuk web dapat Anda taruh pada folder **/web/icons**. Kemudian, Anda perlu mendaftarkannya pada berkas **manifest.json**.

~~~
{
    ...
    "icons": [
        {
            "src": "icons/Icon-192.png",
            "sizes": "192x192",
            "type": "image/png"
        },
        {
            "src": "icons/Icon-512.png",
            "sizes": "512x512",
            "type": "image/png"
        }
    ]
}
~~~

### Melakukan build web

Sama seperti build aplikasi android dan ios, untuk mem-build aplikasi Flutter web kita menjalankan perintah flutter web.

~~~
flutter build web
~~~

Sama seperti ketika menjalankan flutter web, ketika melakukan build, kita juga bisa menentukan renderer yang ingin digunakan. Untuk menentukan renderer yang digunakan, tambahkan parameter **--web-renderer** pada perintah flutter build. Jika tidak mendefinisikan parameter **--web-renderer** maka mode **auto** yang akan digunakan.

Hasil build akan Anda temukan pada folder **/build/web**. Folder inilah yang nantinya bisa Anda deploy ke sebuah web hosting atau web server.

Beberapa opsi hosting yang bisa Anda gunakan, antara lain:

* [Firebase Hosting](https://firebase.google.com/docs/hosting)
* [GitHub Pages](https://pages.github.com/)
* [Google Cloud Hosting](https://cloud.google.com/solutions/smb/web-hosting/)