String getA000124(int n) {
  List<int> result = [];
  int current = 1;
  
  for (int i = 0; i < n; i++) {
    current += i;
    result.add(current);
  }
  
  return result.join('-');
}

void main() {
  print("=== Soal 1: A000124 of Sloane's OEIS ===");
  print("Input 5  : ${getA000124(5)}");
  print("Input 6  : ${getA000124(6)}");
  print("Input 16 : ${getA000124(16)}");
}