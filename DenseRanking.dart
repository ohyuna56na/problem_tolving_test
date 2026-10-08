List<int> denseRanking(List<int> scores, List<int> gitsScores) {
  List<int> uniqueScores = [];
  for (int score in scores) {
    if (uniqueScores.isEmpty || uniqueScores.last != score) {
      uniqueScores.add(score);
    }
  }

  List<int> result = [];
  
  for (int gitsScore in gitsScores) {
    int rank = 1;
    bool found = false;
    
    for (int i = 0; i < uniqueScores.length; i++) {
      if (gitsScore >= uniqueScores[i]) {
        result.add(rank);
        found = true;
        break;
      }
      rank++;
    }
    
    if (!found) {
      result.add(rank);
    }
  }
  
  return result;
}

void main() {
  print("=== Soal 2: Dense Ranking ===");
  
  List<int> scores1 = [100, 100, 50, 40, 40, 20, 10];
  List<int> gits1 = [5, 25, 50, 120];
  print("Test 1 (GITS: $gits1) -> Output: ${denseRanking(scores1, gits1).join(' ')}");

  List<int> scores2 = [200, 150, 150, 130];
  List<int> gits2 = [120, 140, 160, 210];
  print("Test 2 (GITS: $gits2) -> Output: ${denseRanking(scores2, gits2).join(' ')}");

  List<int> scores3 = [10, 10, 10, 10];
  List<int> gits3 = [5, 10, 15];
  print("Test 3 (GITS: $gits3) -> Output: ${denseRanking(scores3, gits3).join(' ')}");
}