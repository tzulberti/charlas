import strutils, nimpy

proc levenshtein(seq1, seq2: string): int {.inline, exportpy.} =
  editDistance(seq1, seq2)

{.passL: "-s", passC: "-flto -ffast-math -march=native", optimization: speed.}
