abstract class Matematika {
  hasil(x, y) {}
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int? x, y;

  @override
  hasil(x, y) {
    int fpb1 = fpb(x, y);
    return (x ~/ fpb1) * y;
  }

  fpb(x, y) {
    if (x == 0) {
      return y;
    } else {
      return fpb(y % x, x);
    }
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int? x, y;

  @override
  hasil(x, y) {
    if (y == 0) {
      return x;
    } else {
      return hasil(y, x % y);
    }
  }
}

void main(List<String> args) {
  var kpk = KelipatanPersekutuanTerkecil();
  print('KPK nya adalah : ${kpk.hasil(30, 14)}'); 

  var fpb = FaktorPersekutuanTerbesar();
  print('FPB nya adalah : ${fpb.hasil(30, 14)}');
}