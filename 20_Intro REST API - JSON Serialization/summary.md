Summary - REST API - JSON Serialization/Deserialization

1. REST API

REST API (Representational State Transfer Application Programming Interface) adalah sebuah arsitektur yang memisahkan antara tampilan dengan proses bisnis, dan bagian tampilan dengan proses bisnis mengirim data melalui permintaan HTTP.

2. HTTP

Ini adalah protokol yang digunakan untuk mengirimkan data melalui internet, dan biasanya data tersebut berbentuk media web. Pola komunikasi dalam HTTP adalah saat klien mengirimkan permintaan, server akan memproses permintaan tersebut dan memberikan respons.

Struktur Request :

    - URL: Alamat halaman yang akan diakses.
    - Method (GET, POST, PUT, DELETE): Menunjukkan aksi yang diinginkan.
    - Header: Informasi tambahan terkait request yang dikirimkan.
    - Body: Data yang disertakan bersama request.

Struktur Response :

    - Status Code: Kode yang mewakili response baik itu sukses maupun gagal.
    - Header: Informasi tambahan terkait response yang diberikan.
    - Body: Data yang disertakan bersama response.

3. Serialisasi JSON

JSON adalah singkatan dari Javascript Object Notation dan biasanya digunakan dalam REST API.

    - Mengubah struktur data ke bentuk JSON disebut dengan SERIALISASI JSON. Menggunakan fungsi jsonEncode dari package dart:convert.
    MAP/LIST => SERIALISASI => JSON.
    - Mengubah bentuk JSON ke struktur data disebut dengan DESERIALISASI JSON. Menggunakan fungsi jsonDecode daro package dart:convert.
    JSON => DESERIALISASI => MAP/LIST.