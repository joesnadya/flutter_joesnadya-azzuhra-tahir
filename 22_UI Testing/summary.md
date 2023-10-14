Summary - UI Testing

1. Apa itu UI testing

Pengujian antarmuka pengguna (UI Testing) adalah metode yang digunakan untuk memeriksa apakah suatu aplikasi mampu merespons interaksi pengguna dengan baik dan apakah tampilannya berfungsi sebagaimana mestinya. Di dalam kerangka kerja Flutter, UI Testing sering disebut sebagai pengujian widget, yang artinya pengujian difokuskan pada komponen-komponen (widget) dengan menyusun skrip yang dapat dijalankan secara otomatis.

2. Keuntungan UI Testing

    - Memastikan respons yang baik terhadap seluruh interaksi pengguna: UI Testing membantu memastikan bahwa semua tindakan atau input pengguna direspons dengan benar oleh aplikasi, sehingga meminimalkan risiko bug atau ketidakcocokan antara tindakan pengguna dan respons aplikasi.
    - Memastikan konsistensi tampilan untuk seluruh widget: UI testing juga berguna untuk memeriksa apakah semua elemen tampilan dalam aplikasi sesuai dengan desain yang diinginkan. Ini penting untuk menjaga kualitas visual dan pengalaman pengguna yang konsisten.
    - Menjadi panduan saat ada perubahan pada widget: UI Testing menjadi acuan yang berharga saat perlu melakukan perubahan atau peningkatan pada widget dalam aplikasi. Dengan memastikan pengujian yang lancar, tim pengembangan dapat lebih percaya diri dalam menerapkan perubahan tanpa merusak fungsi atau tampilan aplikasi.

Jika ingin melakukan UI Testing pada Flutter, instalasi package Testing (flutter_test: ) di dev_dependencies di pubspec.yaml terlebih dahulu.

3. Penulisan Script Testing

    - Script pengujian disusun dalam folder yang ditunjuk untuk pengujian.
    - Setiap file skrip pengujian harus diberi nama yang mengikuti format "_test.dart," seperti contoh dengan file "contact_test.dart" atau "advance_form_test.dart," dan lainnya.