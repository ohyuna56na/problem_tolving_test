String highestPalindrome(String s, int k) {
  List<String> chars = toListRecursive(s, 0, []);
  
  List<bool> changed = createBoolList(s.length, 0, []);

  int minChanges = makePalindrome(chars, 0, chars.length - 1, changed);

  if (minChanges > k) return "-1";

  maximizePalindrome(chars, 0, chars.length - 1, k - minChanges, changed);

  return buildStringRecursive(chars, 0, "");
}

List<String> toListRecursive(String s, int index, List<String> current) {
  if (index == s.length) return current;
  current.add(s[index]);
  return toListRecursive(s, index + 1, current);
}

List<bool> createBoolList(int length, int index, List<bool> current) {
  if (index == length) return current;
  current.add(false);
  return createBoolList(length, index + 1, current);
}

String buildStringRecursive(List<String> chars, int index, String current) {
  if (index == chars.length) return current;
  return buildStringRecursive(chars, index + 1, current + chars[index]);
}

int makePalindrome(List<String> chars, int left, int right, List<bool> changed) {
  if (left >= right) return 0;

  if (chars[left] != chars[right]) {
    if (chars[left].codeUnitAt(0) > chars[right].codeUnitAt(0)) {
      chars[right] = chars[left];
    } else {
      chars[left] = chars[right];
    }
    changed[left] = true;
    changed[right] = true;
    return 1 + makePalindrome(chars, left + 1, right - 1, changed);
  }

  return makePalindrome(chars, left + 1, right - 1, changed);
}

void maximizePalindrome(List<String> chars, int left, int right, int k, List<bool> changed) {
  if (left > right || k <= 0) return;

  if (left == right) {
    if (k >= 1 && chars[left] != '9') {
      chars[left] = '9';
    }
    return;
  }

  if (chars[left] != '9') {
    if (changed[left] || changed[right]) {
      if (k >= 1) {
        chars[left] = '9';
        chars[right] = '9';
        maximizePalindrome(chars, left + 1, right - 1, k - 1, changed);
        return;
      }
    } else {
      if (k >= 2) {
        chars[left] = '9';
        chars[right] = '9';
        maximizePalindrome(chars, left + 1, right - 1, k - 2, changed);
        return;
      }
    }
  }

  maximizePalindrome(chars, left + 1, right - 1, k, changed);
}

void main() {
  print("=== Soal 3: Highest Palindrome ===");
  
  print("Test 1 (String: '3943', k: 1)   -> Output: ${highestPalindrome('3943', 1)}");
  
  print("Test 2 (String: '932239', k: 2) -> Output: ${highestPalindrome('932239', 2)}");
  
  print("Test 3 (String: '12345', k: 1)  -> Output: ${highestPalindrome('12345', 1)}");
}