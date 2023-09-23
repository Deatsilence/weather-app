extension StringExtension on String {
  String capitalize() {
    // String'i boşluklara göre ayırın.
    List<String> words = split(" ");

    // Her kelimenin baş harfini büyüğe çevirin.
    words = words.map((word) => word[0].toUpperCase() + word.substring(1)).toList();

    // Kelimeleri birleştirin.
    return words.join(" ");
  }
}
