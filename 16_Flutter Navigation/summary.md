Summary - Flutter Navigation

1. Apa itu Navigation

Navigation berarti berpindah dari satu layar ke layar lain dalam aplikasi. Flutter mendukung dua jenis navigasi, yaitu Implicit dan Explicit. Implicit Navigation menggunakan fungsi Navigator.push() untuk memindahkan ke layar baru dan Navigator.pop() untuk kembali ke layar sebelumnya. Sementara Explicit Navigation menggunakan fungsi Navigator.pushNamed() untuk navigasi berdasarkan nama layar dan Navigator.popNamed() untuk kembali ke layar sebelumnya dengan menggunakan nama layar.

2. Navigation Dasar

    - Navigator.push: Metode ini digunakan untuk menambahkan layar baru ke dalam tumpukan layar dan beralih ke layar tersebut. Contohnya adalah dengan menggunakan perintah Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage())).
    - Navigator.pop: Metode ini digunakan untuk menghapus layar teratas dari tumpukan layar dan kembali ke layar sebelumnya. Contohnya adalah dengan menggunakan perintah Navigator.pop(context).

3. Navigation dengan Named Routes

Setiap layar memiliki alamat yang disebut "route." Untuk berpindah ke layar lain, kita dapat menggunakan metode Navigator.pushNamed() dengan menyebutkan nama layar yang sesuai, dan untuk kembali ke layar sebelumnya, metode Navigator.popNamed() dapat digunakan. Untuk menggunakan named routes ini, perlu mendaftarkannya terlebih dahulu dalam konfigurasi MaterialApp.