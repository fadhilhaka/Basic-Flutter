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