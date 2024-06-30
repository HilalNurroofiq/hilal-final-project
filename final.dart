import 'dart:io';

class MenuBakso {
  String nama;
  int harga;
  String deskripsi;

  MenuBakso(this.nama, this.harga, this.deskripsi);
}

class PenjualanBakso {
  String namaPenjual;
  String lokasi;
  int jumlahBakso;
  int totalPenjualan = 0;

  PenjualanBakso(this.namaPenjual, this.lokasi, this.jumlahBakso);

  void mulaiPenjualan() => print('$namaPenjual mulai berjualan di $lokasi.');

  void jualBakso(int jumlahTerjual) {
    if (jumlahTerjual <= jumlahBakso) {
      jumlahBakso -= jumlahTerjual;
      totalPenjualan += jumlahTerjual;
      print('$namaPenjual menjual $jumlahTerjual bakso. Sisa bakso: $jumlahBakso.');
    } else {
      print('Stok bakso tidak mencukupi.');
    }
  }

  void isiUlangStok(int tambahanBakso) {
    jumlahBakso += tambahanBakso;
    print('Stok bakso ditambah $tambahanBakso. Total stok sekarang: $jumlahBakso.');
  }

  void tampilkanMenuBakso(List<MenuBakso> menuBakso) {
    for (int i = 0; i < menuBakso.length; i++) {
      print('${i + 1}. Nama: ${menuBakso[i].nama}');
      print('   Harga: Rp ${menuBakso[i].harga}');
      print('   Deskripsi: ${menuBakso[i].deskripsi}');
    }
  }

  void pilihMenuBakso (List<MenuBakso> menuBakso) {
    tampilkanMenuBakso(menuBakso);
    print('Pilih menu bakso (masukkan nomor menu dipisahkan dengan koma, contoh: 1,3,5): ');
    String? input = stdin.readLineSync();
    if (input != null) {
      List<int> pilihan = input.split(',').map((e) => int.parse(e.trim())).toList();
      for (int nomor in pilihan) {
        if (nomor >= 1 && nomor <= menuBakso.length) {
          var menuTerpilih = menuBakso[nomor - 1];
          print('Anda memilih: ${menuTerpilih.nama}');
          print('Harga: Rp ${menuTerpilih.harga}');
          print('Deskripsi: ${menuTerpilih.deskripsi}');
        } else {
          print('Pilihan nomor $nomor tidak valid.');
        }
      }
    } else {
      print('Input tidak valid.');
    }
  }
}

void main() {
  List<MenuBakso> menuBakso = [
    MenuBakso('Bakso Sapi', 15000, 'Bakso sapi dengan kuah kaldu sapi yang lezat.'),
    MenuBakso('Bakso Tetelan', 18000, 'Bakso Tetelan dengan tekstur yang empuk dan lezat.'),
   MenuBakso('Bakso Telur', 17000, 'Bakso dengan isian telur di dalamnya.'),
  ];

  PenjualanBakso penjual = PenjualanBakso('Pak agus', 'Muncar', 100);
  penjual.mulaiPenjualan();
  penjual.pilihMenuBakso(menuBakso);
}
