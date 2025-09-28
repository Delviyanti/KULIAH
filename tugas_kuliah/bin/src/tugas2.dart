import 'dart:io';

void main() {
  // Tampilkan prompt untuk input skor
  print('Masukkan skor Anda (0-100): ');
  
  // baca input dari pengguna
  String? input = stdin.readLineSync();
  
  // Validasi input kosong atau null
  if (input == null || input.isEmpty) {
    print('Input tidak valid.');
    return;
  }
  
  // Parsing input menjadi integer
  int score;
  try {
    score = int.parse(input.trim()); 
  } catch (e) {
    print('Input harus berupa angka.');
    return;
  }
  
  // Validasi rentang skor
  if (score < 0 || score > 100) {
    print('Skor harus antara 0 dan 100.');
    return;
  }
  
  // tentukan grade menggunakan if-else statement berdasarkan rentang skor
  String grade;
  if (score >= 85 && score <= 100) {
    grade = 'A';
  } else if (score >= 70 && score <= 84) {
    grade = 'B';
  } else if (score >= 60 && score <= 69) {
    grade = 'C';
  } else if (score >= 50 && score <= 59) {
    grade = 'D';
  } else {
    grade = 'E'; // Untuk skor < 50
  }
  
  // Menampilkan output sesuai format yang diminta
  print('Skor Anda: $score');
  print('Grade Anda: $grade');
}