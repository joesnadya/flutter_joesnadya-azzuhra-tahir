Summary - Flutter Layout

1. Layout
Layout digunakan untuk mengatur tata letak. Layout berbentuk widget yang mengatur widget di dalamnya.

2. Single Child Layout
Widget ini hanya dapat memiliki satu child saja seperti Container, SizedBox, Center, SingleChildScrollView, dan lain-lain.
    - Container: Membuat sebuah box dan dapat dibungkus oleh widget lain, memiliki margin, padding, dan juga border. Margin adalah jarak antara Container dengan bagian luar Container, sedangkan Padding adalah jarak antara child dengan Container.
    - Center: Dapat mengikuti lebar dan tinggi ruang di luarnya serta meletakan widget berada dibagian tengah,
    - SizedBox: Widget yang digunakan untuk membuat sebuah box dan bisa dibungkus oleh widget lain. Dapat diatur lebar dan tingginya, lebih sederhana daripada Container karena hanya memiliki beberapa properti seperti child, width, height, dan key.

3. Multi-Child Layout
Digunakan untuk widget lebih dari satu dan menggunakan properti children.
    - Column: Menagtur widgets secara vertikal.
    - Row: Mengatur widgets secara horizontal.
    - ListView: Berbeda dengan Column dan Row, widget ini bisa mengatur widgets dalam bentuk list sehingga memiliki kemampuan scroll apabila children yang dimiliki sudah melebihi batas.
    - GridView: Dapat mengatur widgets childrennya dalam bentuk galeri, dan bisa menggunakan GridView.count untuk mengatur jumlah yang diinginkan.