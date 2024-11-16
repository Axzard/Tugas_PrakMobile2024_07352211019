// Enum untuk Jenis Keanggotaan
enum JenisKeanggotaan { Reguler, Premium }

// Mixin untuk aktivitas anggota
mixin AktivitasMixin {
  int poinAktivitas = 0;

  void tambahPoinAktivitas(int poin) {
    poinAktivitas += poin;
    print("Poin aktivitas ditambahkan: $poin. Total: $poinAktivitas");
  }
}

// Kelas abstrak untuk Anggota
abstract class Anggota {
  String nama;
  int usia;
  JenisKeanggotaan jenisKeanggotaan;

  Anggota(this.nama, this.usia, this.jenisKeanggotaan);

  void tampilkanInfo();
}

// Subkelas Anggota Reguler dan Premium
class AnggotaReguler extends Anggota with AktivitasMixin {
  AnggotaReguler(String nama, int usia)
      : super(nama, usia, JenisKeanggotaan.Reguler);

  @override
  void tampilkanInfo() {
    print("Anggota Reguler: $nama, Usia: $usia, Poin Aktivitas: $poinAktivitas");
  }
}

class AnggotaPremium extends Anggota with AktivitasMixin {
  AnggotaPremium(String nama, int usia)
      : super(nama, usia, JenisKeanggotaan.Premium);

  @override
  void tampilkanInfo() {
    print("Anggota Premium: $nama, Usia: $usia, Poin Aktivitas: $poinAktivitas");
  }
}

// Kelas Klub
class Klub {
  final int maxAnggotaAktif;
  List<Anggota> anggotaAktif = [];
  List<Anggota> anggotaNonAktif = [];

  Klub(this.maxAnggotaAktif);

  void tambahAnggota(Anggota anggota) {
    if (anggotaAktif.length < maxAnggotaAktif) {
      anggotaAktif.add(anggota);
      print("${anggota.nama} ditambahkan sebagai anggota aktif.");
    } else {
      print(
          "Klub sudah penuh! Menambahkan ${anggota.nama} ke daftar anggota non-aktif.");
      anggotaNonAktif.add(anggota);
    }
  }

  void tampilkanAnggota() {
    print("\nAnggota Aktif:");
    for (var anggota in anggotaAktif) {
      anggota.tampilkanInfo();
    }
    print("\nAnggota Non-Aktif:");
    for (var anggota in anggotaNonAktif) {
      anggota.tampilkanInfo();
    }
  }
}

void main() {
  // Membuat instance Klub
  Klub klubOlahraga = Klub(3);

  // Membuat anggota
  AnggotaReguler anggota1 = AnggotaReguler("Atir", 20);
  AnggotaPremium anggota2 = AnggotaPremium("Akbar", 23);
  AnggotaReguler anggota3 = AnggotaReguler("Arhy", 22);
  AnggotaPremium anggota4 = AnggotaPremium("Mahfud", 22);

  // Menambahkan anggota ke klub
  klubOlahraga.tambahAnggota(anggota1);
  klubOlahraga.tambahAnggota(anggota2);
  klubOlahraga.tambahAnggota(anggota3);
  klubOlahraga.tambahAnggota(anggota4);

  // Menampilkan daftar anggota
  klubOlahraga.tampilkanAnggota();

  // Menambahkan aktivitas ke anggota
  anggota1.tambahPoinAktivitas(10);
  anggota2.tambahPoinAktivitas(20);
}
