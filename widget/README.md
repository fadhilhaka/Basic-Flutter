# Widget

## World of Components

Konsep Widget pada Flutter itu terinspirasi oleh salah framework JavaScript yang digunakan untuk membangun sebuah website yaitu ReactJS. ReactJS memiliki konsep Component.

Component dalam programming adalah sekumpulan block-block code yang digunakan untuk membangun sebuah aplikasi.

Widget sama halnya dengan component yang merupakan kumpulan block code untuk membangun aplikasi Flutter.

## Cara Menulis Widget

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

Pada kode di atas kita telah membuat sebuah Widget MyApp dan telah menggunakan widget-widget bawaan Flutter di antaranya **MaterialApp**, **Scaffold**, **Center**, dan **Text**.

Ketika menggunakan widget, kita tinggal panggil nama widget dan bila ada properti atau parameter pada widget tersebut tinggal kita isikan properti atau parameternya.

Perlu diketahui bahwa sebagian besar widget bawaan memiliki pola **parent-child**, seperti halnya **Center** yang memiliki **child** yang artinya di dalam **child** bisa terdapat **widget** lagi. 

~~~
Center( // parent dari Button
  child: Button( // child dari Center dan parent dari Text
    child: Text(), // child dari Button
  ),
)
~~~

Pada contoh di atas widget **Center** dan **Button** hanya dapat memiliki satu anak atau bisa disebut child.

Ada pula widget yang dapat memiliki banyak anak atau bisa disebut **children**, seperti **Row**, **Column**, **ListView**, **GridView**, dan semacamnya.

~~~
Row(
  children: <Widget>[
    //di dalam children akan berisi banyak widget
  ]
)
~~~

## StatelessWidget dan StatefulWidget

Widget pada Flutter memiliki dua jenis, yaitu **StatelessWidget** dan **StatefulWidget**. 

State adalah data yang ada pada suatu widget. Widget menyimpan data yang nantinya dapat berubah sesuai interaksi pengguna.

Karena Flutter menggunakan paradigma OOP (Object-Oriented Programming), state biasanya menjadi suatu properti dari sebuah class.

~~~
class ContohWidget extends StatelessWidget{
    final String _judul    
    ...
}
~~~

Variabel **_judul** di atas merupakan contoh pendeklarasian state pada suatu widget.

### [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)

StatelessWidget adalah widget yang nilai state-nya tidak dapat berubah (immutable) maka widget tersebut lebih bersifat statis dan memiliki interaksi yang terbatas.

~~~
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Text("Hello world!"),
        ),
      ),
    );
  }
}
 
class Heading extends StatelessWidget {
  final String text;
 
  Heading({this.text});
 
  @override
  Widget build(BuildContext context){
    return Text(
      text,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
~~~

Kita coba ubah widget **Text** yang menampilkan "Hello world!" dengan widget **Heading** yang kita buat.

~~~
child: Heading( // mengubah widget Text
    text:"Hello world!",
~~~

Maka ketika kita ubah **Text** dengan widget **Heading**, hasilnya akan berubah. Tulisan "Hello world!" jadi lebih besar.

Sesuai definisi StatelessWidget, state-nya tidak dapat berubah (immutable), maka state yang ada di dalam kelas tersebut harus dibuat final. Nilainya hanya dapat diisi melalui constructor class-nya.

~~~
final String text; // state text bersifat final
 
Heading({this.text}); // lalu state text masuk ke constructor
~~~

### [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)

StatefulWidget ialah widget yang state-nya dapat berubah-ubah nilainya, yang berarti StatefulWidget bersifat dinamis dan memiliki interaksi yang tak terbatas.

~~~
class ContohStateful extends StatefulWidget {
 
    final String parameterWidget; // ini parameter widget
 
    ContohStateful({this.parameterWidget});
 
    @override
    _ContohStatefulState createState() => _ContohStatefulState();
}
 
class _ContohStatefulState extends State<ContohStateful>{
    String _dataState; // ini state dari Widget ContohStateful
 
    @override
    Widget build(BuildContext context){
        // isi sebuah widget
    }
}
~~~

Contoh di atas adalah cara penulisan **StatefulWidget**. Seperti yang kita lihat, penulisan **StatefulWidget** lebih panjang. Tetapi yang harus diperhatikan adalah **properti** dari setiap **class**-nya.

Pada class **ContohStateful** propertinya hanya berupa parameter ketika memanggil **ContohStateful**, parameter tersebut tidak wajib ada. Sedangkan pada class **_ContohStatefulState**, properti **_dataState** merupakan state yang sebenarnya.

~~~
class BiggerText extends StatefulWidget {
  final String text;
 
  const BiggerText({this.text});
 
  @override
  _BiggerTextState createState() => _BiggerTextState();
}
 
 
class _BiggerTextState extends State<BiggerText> {
  double _textSize = 16.0;
 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.text, style: TextStyle(fontSize: _textSize)),
        ElevatedButton(
          child: Text("Perbesar"),
          onPressed: () {
            setState(() {
              _textSize = 32.0;
            });
          },
        )
      ],
    );
  }
}
~~~

Letakkan kode di atas setelah StatelessWidget **Heading** yang telah kita buat sebelumnya lalu panggil StatefulWidget **BiggerText** pada **MyApp**.

~~~
child: BiggerText(text:"Hello world!"), // Ubah widget Heading ke PerubahanText
~~~

Ketika tombol "Perbesar" ditekan, text "Hello world!" akan membesar karena state **_textSize** diubah nilainya. Mengubah nilai state harus dilakukan pada fungsi **setState** seperti berikut:

~~~
setState(() {
  _textSize = 32.0; // ukuran text diubah menjadi 32
});
~~~

### [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html)

Scaffold merupakan sebuah widget yang digunakan untuk membuat tampilan dasar material design pada aplikasi Flutter, yang dapat disebut juga dasar sebuah halaman pada aplikasi Flutter.

![](https://d17ivq9b7rppb3.cloudfront.net/original/academy/2020061215241361da7eebd046c6406eea62a5e45b08bc.png)

Scaffold di atas memiliki 3 bagian yaitu **AppBar**, **Body**, dan **FloatingActionButton**.

Pada gambar di atas kotak berwarna merah merupakan **AppBar**; kotak berwarna hijau merupakan **body**; dan kotak berwarna biru merupakan **FloatingActionButton**.

~~~
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
~~~

Pada kode di atas kita membuat sebuah **StatelessWidget** bernama **FirstScreen**, yang merupakan widget tampilan kita. Kemudian di dalam method build kita panggil **Scaffold**.

Untuk memakainya kita perlu memanggil **FirstScreen** pada Widget **MyApp**.

~~~
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),// Panggil FirstScreen di sini
 
    );
  }
}
~~~

**AppBar**

**AppBar** merupakan Header (bagian paling atas) aplikasi atau biasa dikenal dengan toolbar. Pada **AppBar** umumnya terdapat judul dan **ActionButton**.

~~~
Scaffold(
  appBar: AppBar(
    title: Text('First Screen'),
  ),
);
~~~

Pada kode di atas kita menambahkan parameter **appBar** pada Scaffold dan menambahkan **title** pada **AppBar** tersebut.

Title di sini tidak hanya spesifik Text saja, melainkan juga dapat diisi dengan widget lainnya seperti TextField untuk kolom pencarian atau yang lainnya.

**Body**

~~~
body: Center(
  child: Text('Hello I\'m  Body'),
),
~~~

**FloatingActionButton**

**FloatingActionButton** merupakan bagian dari Scaffold yang digunakan untuk menampilkan sebuah tombol aksi yang posisinya floating (melayang dan posisinya tetap).

~~~
floatingActionButton: FloatingActionButton(
  child: Icon(Icons.add),
),
~~~

### [Container](https://api.flutter.dev/flutter/widgets/Container-class.html)

Container adalah widget yang digunakan untuk melakukan styling, membuat sebuah shape (bentuk), dan layout pada widget child-nya.

~~~
Container(
  child: Text('Hi', style: TextStyle(fontSize: 40)),
  color: Colors.blue,
)
~~~

Pada kode di atas kita membuat sebuah **Text** "Hi" yang dibungkus oleh widget **Container** dan kita beri parameter **color** dengan nilai **Colors.blue**.

**Width & Height**

~~~
Container(
  child: Text('Hi', style: TextStyle(fontSize: 40),),
  color: Colors.blue,
  width: 200,
  height: 100,
)
~~~

**Padding & Margin**

Padding merupakan jarak antara konten (child) dengan Container, sedangkan margin merupakan jarak antara Container dengan bagian luar container.

~~~
Container(
 child: Text('Hi', style: TextStyle(fontSize: 40),),
 color: Colors.blue,
 padding: EdgeInsets.all(10),
 margin: EdgeInsets.all(10),
)
~~~

### Dekorasi Container

Decoration merupakan bagian dari Container untuk styling. Untuk menggunakan decoration cukup menambahkan parameter **decoration** pada **Container** lalu beri nilai **BoxDecoration**.

**Color**

~~~
Container(
  child: Text('Hi', style: TextStyle(fontSize: 40),),
  decoration: BoxDecoration(
    color: Colors.red,
  ),
)
~~~

**Shape**

~~~
Container(
  child: Text('Hi', style: TextStyle(fontSize: 40),),
  decoration: BoxDecoration(
    color: Colors.red,
    shape: BoxShape.circle,
  ),
)
~~~

**Shadow**

~~~
Container(
  child: Text('Hi', style: TextStyle(fontSize: 40)),
  decoration: BoxDecoration(
    color: Colors.red,
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        offset: Offset(3, 6),
        blurRadius: 10,
      ),
    ],
  ),
)
~~~

Parameter boxShadow merupakan sebuah **Array**. Di dalamnya terdapat **BoxShadow** yang artinya pada **Container** kita dapat memberikan banyak bayangan atau **shadow**.

**Border**

Border merupakan batas garis dengan content (child).

~~~
Container(
  child: Text('Hi', style: TextStyle(fontSize: 40),),
  decoration: BoxDecoration(
    color: Colors.red,
    border: Border.all(color: Colors.green, width: 3),
  ),
)
~~~

Apabila Anda ingin membuat border yang tidak berujung lancip cukup tambahkan parameter borderRadius Pada BoxDecoration.

~~~
borderRadius: BorderRadius.circular(10),
~~~

### [Padding](https://api.flutter.dev/flutter/widgets/Padding-class.html)

Widget Padding merupakan sebuah widget yang khusus untuk memberikan padding pada suatu widget.

~~~
Padding(
  padding: EdgeInsets.all(30),
  child: Text('Ini Padding')
)
~~~

Pada kode di atas widget Padding harus memiliki child. Child di sini merupakan sebuah widget yang nantinya akan diberi padding. Parameter padding ditambahkan untuk menentukan besaran padding yang diinginkan.

### Center

Widget Center merupakan sebuah widget yang digunakan untuk membuat suatu widget berada pada posisi tengah.

~~~
Center(
  child: Text('Text berada di tengah'),
)
~~~

### Row & Column

[**Row**](https://api.flutter.dev/flutter/widgets/Row-class.html)

Widget Row merupakan suatu widget yang digunakan untuk membuat widget-widget tersusun berjajar secara horizontal.

~~~
Row(
  children: <Widget>[
    //di sini berisi widget-widget
  ],
)
~~~

Untuk membuat widget-widget berjajar secara horizontal kita harus memasukkan widget-widget tersebut ke dalam parameter children.

Parameter children berisi kumpulan atau list dari widget karena kita dapat menyusun beberapa widget sekaligus di dalamnya.

~~~
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget> [
    IconButton(icon: Icon(Icons.share)),
    IconButton(icon: Icon(Icons.thumb_up)),
    IconButton(icon: Icon(Icons.thumb_down)),
  ],
)
~~~

![](https://www.dicoding.com/academies/159/tutorials/6498?from=8584#)

Kita menambahkan **mainAxisAlignment** yang merupakan parameter alignment pada **Row**.

Parameter **mainAxisAlignment** yang berfungsi untuk mengatur alignment **vertikal** dari **Row** (alignment utama). Selain itu **Row** juga memiliki parameter **crossAxisAlignment** yang berfungsi untuk mengatur alignment secara **horizontal**. 

Kedua parameter ini juga berlaku sebaliknya untuk widget **Column**.

Berikut ini adalah contoh penerapan mainAxisAlignment pada Row:

![](https://d17ivq9b7rppb3.cloudfront.net/original/academy/2021042512000412e4c53a9d35daed279e1163d70a284b.jpeg)

[**Column**](https://api.flutter.dev/flutter/widgets/Column-class.html)

Column merupakan suatu widget yang digunakan untuk membuat widget-widget tersusun berjajar secara vertikal.

~~~
Column(
  children: <Widget>[
    //di sini berisi widget-widget
  ]
)
~~~

~~~
Column(
  children: <Widget>[
    Text(
      'Sebuah Judul',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    ),
    Text('Lorem ipsum dolor sit amet'),
  ],
)
~~~

[Flutter Layout](https://flutter.dev/docs/development/ui/layout)

### [Button](https://flutter.dev/docs/development/ui/widgets/material#Buttons)

Widget yang dapat menerima trigger sentuhan atau dapat melakukan suatu fungsi ketika disentuh.

[**ElevatedButton**](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)

~~~
ElevatedButton(
  onPressed: (){
    // Aksi ketika button diklik
  },
  child: Text("Tombol"),
);
~~~

Pada kode di atas **ElevatedButton** memiliki 2 parameter yaitu **onPressed** dan **child**. Parameter **onPressed** merupakan sebuah function event ketika tombol ditekan.

Terdapat ada event lain seperti **onLongPress** dan **onHighlightChanged**.

[**TextButton**](https://api.flutter.dev/flutter/material/TextButton-class.html)

TextButton merupakan widget button yang memiliki tampilan yang polos selayaknya Text.

TextButton umumnya digunakan pada toolbars, dialog, atau bersama komponen button lain.

~~~
TextButton(
  onPressed: () {
    // Aksi ketika button diklik
  },
  child: Text('Text Button'),
)
~~~

[**OutlinedButton**](https://api.flutter.dev/flutter/material/OutlinedButton-class.html)

OutlinedButton umumnya digunakan untuk tombol atau aksi yang penting, tetapi bukan aksi utama dalam aplikasi.

~~~
OutlinedButton(
  onPressed: () {
    // Aksi ketika button diklik
  },
  child: Text('Outlined Button'),
)
~~~

[**IconButton**](https://api.flutter.dev/flutter/material/IconButton-class.html)

IconButton merupakan widget button dengan icon.

~~~
IconButton(
  icon: Icon(Icons.volume_up),
  tooltip: 'Increase volume by 10',
  onPressed: () {
    // Aksi ketika button diklik
  },
)
~~~

IconButton tidak menggunakan child untuk isi (content) melainkan menggunakan parameter icon dan tooltip (penunjuk) untuk memberikan hint pada tombol.

[**DropdownButton**](https://api.flutter.dev/flutter/material/DropdownButton-class.html)

DropdownButton merupakan tombol yang saat diklik, akan muncul pop-up daftar beberapa item yang dapat kita pilih salah satu.

~~~
class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}
 
class _FirstScreenState extends State<FirstScreen> {
  String language;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: DropdownButton<String>(
        items: <DropdownMenuItem<String>>[
          DropdownMenuItem<String>(
            value: 'Dart',
            child: Text('Dart'),
          ),
          DropdownMenuItem<String>(
            value: 'Kotlin',
            child: Text('Kotlin'),
          ),
          DropdownMenuItem<String>(
            value: 'Swift',
            child: Text('Swift'),
          ),
        ],
        value: language,
        hint: Text('Select Language'),
        onChanged: (String value) {
          setState(() {
            language = value;
          });
        },
      ),
    );
  }
}
~~~

Pada contoh tersebut DropdownButton tidak menggunakan child maupun children, akan tetapi menggunakan items di mana berisi list dari widget DropdownMenuItem. Pada widget DropdownMenuItem terdapat child untuk tiap itemnya dan value yang ada pada DropdownMenuItem adalah nilai dari tiap itemnya. 

Nantinya akan dibutuhkan parameter onChanged ketika ada perubahan atau ketika memilih salah satu dari item tersebut dan mengubah nilai language atau value dari DropdownButton tersebut. Sedangkan hint berfungsi ketika nilai value dari DropdownButton null atau kosong.

## [Input Widget](https://flutter.dev/docs/development/ui/widgets/material#Input%20and%20selections)

Input pengguna umumnya berkaitan dengan state yang dapat sering berubah, karena itu umumnya input widget akan ditempatkan di dalam StatefulWidget.

### [TextField](https://api.flutter.dev/flutter/material/TextField-class.html)

TextField merupakan sebuah widget yang digunakan untuk menerima input berupa teks yang berasal dari keyboard.

Parameter **onChanged** berisi sebuah fungsi yang akan dipanggil setiap terjadi perubahan inputan pada **TextField**. Pada fungsi ini, kita dapat mengubah nilai variabel state dengan memanggil fungsi **setState()**.

Jika hanya ingin mengambil perubahan ketika seluruh input sudah selesai di-submit, dapat menggunakan parameter **onSubmitted**.

Cara lain yang bisa kita gunakan adalah dengan **TextEditingController**. Dengan **controller**, kita cukup membuat variabel **TextEditingController** lalu menambahkannya ke widget **TextField**.

~~~
class _FirstScreenState extends State<FirstScreen> {
  String _name = '';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Write your name here...',
                labelText: 'Your Name',
              ),
              onChanged: (String value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Hello, $_name'),
                      );
                    });
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
~~~

Ketika menggunakan controller, pastikan untuk menghapus controller ketika halaman atau widget sudah tidak digunakan. Ini bertujuan supaya tidak menimbulkan kebocoran memori (memory leak).

~~~
class _FirstScreenState extends State<FirstScreen> {
  TextEditingController _controller = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Write your name here...',
                labelText: 'Your Name',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Hello, ${_controller.text}'),
                      );
                    });
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
~~~

### [Switch](https://api.flutter.dev/flutter/material/Switch-class.html)

Switch merupakan inputan yang mengembalikan nilai boolean true atau false.

~~~
class _FirstScreenState extends State<FirstScreen> {
  bool lightOn = false;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Switch(
        value: lightOn,
        onChanged: (bool value) {
          setState(() {
            lightOn = value;
          });
 
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(lightOn ? 'Light On' : 'Light Off'),
              duration: Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
~~~

### [Radio](https://api.flutter.dev/flutter/material/Radio-class.html)

Radio merupakan inputan yang digunakan untuk memilih salah satu dari beberapa pilihan dalam suatu kelompok.

~~~
class _FirstScreenState extends State<FirstScreen> {
  String language;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Radio<String>(
              value: 'Dart',
              groupValue: language,
              onChanged: (String value) {
                setState(() {
                  language = value;
                  showSnackbar();
                });
              },
            ),
            title: Text('Dart'),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Kotlin',
              groupValue: language,
              onChanged: (String value) {
                setState(() {
                  language = value;
                  showSnackbar();
                });
              },
            ),
            title: Text('Kotlin'),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Swift',
              groupValue: language,
              onChanged: (String value) {
                setState(() {
                  language = value;
                  showSnackbar();
                });
              },
            ),
            title: Text('Swift'),
          ),
        ],
      ),
    );
  }
 
  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$language selected'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
~~~

Pada contoh tersebut terdapat variable **language** yang digunakan pada **groupValue** tiap Radio. **Language** inilah yang menyimpan nilai **Radio** yang dipilih. Nilainya akan berubah ketika fungsi **onChanged** terpanggil.

## [Checkbox](https://api.flutter.dev/flutter/material/Checkbox-class.html)

Checkbox merupakan inputan benar atau salah. Checkbox akan berisi centang jika nilainya adalah benar dan kosong jika salah.

~~~
class _FirstScreenState extends State<FirstScreen> {
  bool agree = false;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: ListTile(
        leading: Checkbox(
          value: agree,
          onChanged: (bool value) {
            setState(() {
              agree = value;
            });
          },
        ),
        title: Text('Agree / Disagree'),
      ),
    );
  }
}
~~~

## [Image](https://api.flutter.dev/flutter/widgets/Image-class.html)

### Image.network

Untuk menampilkan gambar yang bersumber dari internet, kita akan menggunakan method **Image.network**.

~~~
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Image.network(
          'https://picsum.photos/200/300',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
~~~

Pada kode di atas kita panggil method Image.network dengan url https://picsum.photos/200/300 lalu beri width dan height masing-masing 200.

### Image.asset

Kita juga dapat menampilkan gambar yang bersumber dari asset project. Asset di sini berupa gambar-gambar yang nantinya didaftarkan pada project. Untuk mendaftarkan asset gambar pada project kita harus menambahkannya pada berkas **pubspec.yaml**.

Flutter mendukung beberapa jenis format gambar, seperti JPEG, PNG, GIF, Animated GIF, WebP, Animated WebP, BMP, dan WBMP.

Di luar format tersebut, Flutter akan memanfaatkan API dari masing-masing platform.

Kita dapat menambahkan folder **images/** pada folder project, sebagai tempat untuk asset.

![](https://d17ivq9b7rppb3.cloudfront.net/original/academy/20210425141500f20e24ccaaaaeb832eb7c2e089b8ad4b.jpeg)

Masukkan berkas gambar yang ingin Anda gunakan ke dalam folder **image**. Sebagai contoh kita menggunakan gambar bernama **android.png**.

Setelah menambahkan gambar pada project, saatnya kita mendaftarkan gambar tersebut pada **pubspec.yaml**.

~~~
...
flutter:
  uses-material-design: true
 
  assets:
    - images/android.png
...
~~~

Hapus juga tanda pagar (**#**) atau komentar yang tidak diperlukan. Perhatikan pula indentasi kodenya. **assets:** berada sejajar dengan **uses-material-design:** yaitu berjarak **2 spasi** dari ujung dan berada di dalam **flutter:** sedangkan **- images/android.png** berada di dalam **assets:** dan berjarak **4 spasi** dari ujung.

Apabila ada banyak gambar yang kita masukkan ke dalam lokasi folder, dibandingkan menuliskan lokasi gambar satu per satu, kita bisa langsung menuliskan folder **images/**.

~~~
class FirstScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white,),
        ),
        title: Text('First Screen'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
          )
        ],
      ),
      body: Center(
        child: Image.asset('images/android.png', width: 200, height: 200),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}
~~~

## Font

### Menambahkan Font ke Project

Kita akan membuat folder fonts pada project kita, dan masukkan file-file font yang akan kita pakai.

![](https://d17ivq9b7rppb3.cloudfront.net/original/academy/20200615194557c0f63961b549064c8aa1bcde62857d41.jpeg)

### Mendaftarkan Font di pubspec.yaml

~~~
flutter:
 
  uses-material-design: true
  assets:
    - images/
 
  fonts:
    - family: Oswald
      fonts:
       - asset: fonts/Oswald/Oswald-Regular.ttf
~~~

Sama halnya dengan gambar, font ada dalam bagian flutter. Untuk mendaftarkan font, kita membuat bagian fonts yang ada dalam blok flutter.

Untuk mendaftarkan font Oswald kita tuliskan Oswald pada bagian family yang nantinya akan menjadi nama font yang kita panggil pada kode dart. 

Lalu dalam family kita masukkan fonts yang di dalamnya terdapat asset yang nanti akan mengarah pada file font.ttf. Contoh di atas kita menambahkan asset **fonts/oswald/Oswald-Regular.ttf**.

### Menggunakan Font pada Kode

~~~
Text('Custom Font', style: TextStyle(fontFamily: 'Oswald', fontSize: 30,),)
~~~

>NOTE: Setelah kita menambahkan **package** atau pun **asset** ke dalam **pubspec.yaml** kita perlu melakukan **full restart** agar asset yang baru dapat digunakan dalam aplikasi.

### Mengubah Font Default

Selain kita dapat mengubah font family pada satu per satu widget Text, kita dapat membuat font yang kita daftarkan menjadi default. Caranya dengan menambahkan parameter fontFamily pada kelas ThemeData yang ada pada parameter theme di MaterialApp.

~~~
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Oswald',
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}
~~~

## [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)

Widget ini digunakan untuk menampilkan beberapa item dalam bentuk baris atau kolom dan bisa di-scroll.

Cara penggunaan **ListView** ini mirip dengan **Column** atau **Row** di mana Anda memasukkan **widget** yang ingin disusun sebagai **children** dari **ListView**.

### Menampilkan Item Secara Dinamis

Selain memasukkan widget satu per satu ke dalam children dari ListView, Anda juga dapat menampilkan list secara dinamis.

Misalnya kita ingin menampilkan daftar angka dari 1 sampai 10. Caranya, masukkan variabel atau list Anda sebagai children lalu panggil fungsi **map()**. 

Fungsi **map** ini berguna untuk memetakan atau mengubah setiap item di dalam list menjadi objek yang kita inginkan. 

Karena parameter **children** ini membutuhkan nilai berupa list widget, maka kita perlu mengembalikan setiap item dari numberList menjadi widget yang akan ditampilkan. 

~~~
class ScrollingScreen extends StatelessWidget {
  final List<int> numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: numberList.map((number) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '$number', // Ditampilkan sesuai item
                style: TextStyle(fontSize: 50),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
~~~

Perhatikan di akhir kita perlu mengembalikan fungsi map menjadi objek List lagi dengan fungsi **.toList()**.

### Menggunakan ListView.builder

Selain mengisi parameter **children** dari **ListView** seperti sebelumnya, kita juga bisa memanfaatkan method **ListView.builder**.

**ListView.builder** lebih cocok digunakan pada **ListView** dengan jumlah item yang cukup besar. Ini karena Flutter hanya akan merender tampilan item yang terlihat di layar dan tidak me-render seluruh item **ListView** di awal.

**ListView.builder** memerlukan dua parameter yaitu **itemBuilder** dan **itemCount**. Parameter **itemBuilder** merupakan fungsi yang mengembalikan widget untuk ditampilkan. Sedangkan itemCount kita isi dengan jumlah seluruh item yang ingin ditampilkan.

~~~
ListView.builder(
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(
          '${numberList[index]}',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  },
  itemCount: numberList.length,
)
~~~

### ListView.separated

Cara lain untuk membuat **ListView** adalah dengan metode **ListView.separated**.

ListView jenis ini akan menampilkan daftar item yang dipisahkan dengan **separator**. Penggunaan **ListView.separated** mirip dengan **builder**, yang membedakan adalah terdapat satu parameter tambahan wajib yaitu **separatorBuilder** yang mengembalikan Widget yang akan berperan sebagai **separator**.

~~~
ListView.separated(
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(
          '${numberList[index]}',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  },
  separatorBuilder: (BuildContext context, int index) {
    return Divider();
  },
  itemCount: numberList.length,
)
~~~

## Expanded & Flexible

### [Expanded](https://api.flutter.dev/flutter/widgets/Expanded-class.html)

Flutter memiliki widget Expanded yang dapat mengembangkan child dari Row atau Column sesuai dengan ruang yang tersedia.

~~~
class Rainbow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.orange,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.indigo,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.purple,
          ),
        ),
      ],
    );
  }
}
~~~

Masing-masing container akan menempati ruang kosong yang ada. Jika Anda menjalankan di ukuran layar yang berbeda, maka ukuran container juga akan menyesuaikan.

Expanded memiliki parameter flex yang memiliki nilai default 1. Anda dapat mengubah nilai flex ini sesuai perbandingan yang diinginkan. Misalnya Anda memberikan nilai flex 2 pada salah satu container.

~~~
Expanded(
  flex: 2,
  child: Container(
    color: Colors.blue,
  ),
),
~~~

Maka container berwarna biru ini akan menjadi lebih besar dengan perbandingan 2/(1 + 1 + 1 + 1 + 2 + 1 + 1) atau 2/8 dari halaman.

### [Flexible](https://api.flutter.dev/flutter/widgets/Flexible-class.html)

Perbedaan Flexible dan Expanded adalah widget Flexible memungkinkan child widget-nya berukuran lebih kecil dibandingkan ukuran Flexible. 

Sementara, child widget dari Expanded harus menempati ruang yang tersisa dari Column atau Row.

~~~
class ExpandedFlexiblePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                ExpandedWidget(),
                FlexibleWidget(),
              ],
            ),
            Row(
              children: [
                ExpandedWidget(),
                ExpandedWidget(),
              ],
            ),
            Row(
              children: [
                FlexibleWidget(),
                FlexibleWidget(),
              ],
            ),
            Row(
              children: [
                FlexibleWidget(),
                ExpandedWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 
class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Expanded',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
 
class FlexibleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Flexible',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
~~~

## [Navigation](https://flutter.dev/docs/cookbook/navigation)

Dalam pemrograman Android kita mengenal Intent lalu pada pemrograman website terdapat tag untuk berpindah dari satu page ke page lain. 

Pada Flutter kita akan menggunakan sebuah class bernama Navigator.

Konsep navigasi pada Flutter mirip sekali dengan pemrograman Android, yakni bahwa ketika berpindah screen/activity akan menjadi tumpukan (stack).

Ketika berpindah dari satu screen ke screen lain (push), maka screen pertama akan ditumpuk oleh screen kedua. Kemudian apabila kembali dari screen kedua ke pertama, maka screen kedua akan dihapus (pop).

### Navigator.push

Untuk berpindah ke screen kedua kita akan menggunakan sebuah method Navigator.push.

~~~
Navigator.push(context, MaterialPageRoute(builder: (context) {
   return WidgetScreen();
}));
~~~

Pada kode di atas Navigator.push memiliki dua parameter. Pertama ialah context dan yang kedua Route. 

Parameter context ini merupakan variabel BuildContext yang ada pada method build.

Parameter route berguna untuk menentukan tujuan ke mana kita akan berpindah screen. Route tersebut kita isikan dengan MaterialPageRoute yang di dalamnya terdapat builder yang nantinya akan diisi dengan tujuan screen-nya.

~~~
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Pindah Screen'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondScreen();
            }));
          },
        ),
      ),
    );
  }
}
~~~

### Navigator.pop

Setelah dapat berpindah ke screen lain untuk kembali ke screen sebelumnya, maka kita menggunakan Navigator.pop.

~~~
Navigator.pop(context)
~~~

Pada Navigator.pop kita hanya cukup menambahkan parameter context yang merupakan variabel dari method build.

~~~
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: OutlinedButton(
          child: Text('Kembali'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
~~~

### Mengirimkan Data Antar Halaman

Pada Flutter kita memanfaatkan constructor dari sebuah class untuk mengirimkan data antar halaman.

Sebagai contoh kita memiliki pesan yang akan dikirimkan dari First Screen menuju Second Screen.

Untuk mengirimkan variabel message tersebut ke Second Screen, maka kita akan mengirimkannya sebagai parameter dari constructor kelas SecondScreen.

~~~
class SecondScreen extends StatelessWidget {
  final String message;
 
  SecondScreen(this.message);
}
~~~

~~~
Navigator.push(context,
    MaterialPageRoute(builder: (context) => SecondScreen(message)));
},
~~~

## Responsive Layout

### MediaQuery

MediaQuery adalah kelas yang dapat kita gunakan untuk mendapatkan ukuran dan juga orientasi layar.

~~~
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
 
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Screen width: ${screenSize.width.toStringAsFixed(2)}',
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Text(
            'Orientation: $orientation',
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
~~~

### LayoutBuilder

Perbedaan umum antara MediaQuery dan Layout Builder adalah MediaQuery akan mengembalikan ukuran layar yang digunakan, sedangkan LayoutBuilder mengembalikan ukuran maksimum dari widget tertentu.

~~~
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
 
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Row(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'MediaQuery: ${screenSize.width.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'LayoutBuilder: ${constraints.maxWidth}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'MediaQuery: ${screenSize.width.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'LayoutBuilder: ${constraints.maxWidth}',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
~~~

Dalam responsive design, terdapat breakpoint yang merupakan “titik” di mana layout akan beradaptasi untuk memberikan pengalaman pengguna sebaik mungkin.

~~~
class ResponsivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return ListView(
              children: _generateContainers(),
            );
          } else if (constraints.maxWidth < 900) {
            return GridView.count(
              crossAxisCount: 2,
              children: _generateContainers(),
            );
          } else {
            return GridView.count(
              crossAxisCount: 6,
              children: _generateContainers(),
            );
          }
        },
      ),
    );
  }
 
  List<Widget> _generateContainers() {
    return List<Widget>.generate(20, (index) {
      return Container(
        margin: const EdgeInsets.all(8),
        color: Colors.blueGrey,
        height: 200,
      );
    });
  }
}
~~~

![](https://d17ivq9b7rppb3.cloudfront.net/original/academy/20210425211022224c0de6d6751d5c57b5e4b7e39712a3.gif)

