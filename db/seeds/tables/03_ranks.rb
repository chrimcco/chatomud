#      0 unskilled
#  1..16 neophyte
# 17..33 amateur
# 34..54 familiar
# 55..71 adroit
# 72..79 master
# 80..85 grand master

Rank.create!(rate: :limited, value:  0, bonus: -20, label: :unskilled)
Rank.create!(rate: :limited, value:  1, bonus:   2, label: :neophyte)
Rank.create!(rate: :limited, value:  2, bonus:   4, label: :neophyte)
Rank.create!(rate: :limited, value:  3, bonus:   6, label: :neophyte)
Rank.create!(rate: :limited, value:  4, bonus:   8, label: :neophyte)
Rank.create!(rate: :limited, value:  5, bonus:  10, label: :neophyte)
Rank.create!(rate: :limited, value:  6, bonus:  12, label: :neophyte)
Rank.create!(rate: :limited, value:  7, bonus:  14, label: :neophyte)
Rank.create!(rate: :limited, value:  8, bonus:  16, label: :neophyte)
Rank.create!(rate: :limited, value:  9, bonus:  18, label: :amateur)
Rank.create!(rate: :limited, value: 10, bonus:  20, label: :amateur)
Rank.create!(rate: :limited, value: 11, bonus:  21, label: :amateur)
Rank.create!(rate: :limited, value: 12, bonus:  22, label: :amateur)
Rank.create!(rate: :limited, value: 13, bonus:  23, label: :amateur)
Rank.create!(rate: :limited, value: 14, bonus:  24, label: :amateur)
Rank.create!(rate: :limited, value: 15, bonus:  25, label: :amateur)
Rank.create!(rate: :limited, value: 16, bonus:  26, label: :amateur)
Rank.create!(rate: :limited, value: 17, bonus:  27, label: :amateur)
Rank.create!(rate: :limited, value: 18, bonus:  28, label: :amateur)
Rank.create!(rate: :limited, value: 19, bonus:  29, label: :amateur)
Rank.create!(rate: :limited, value: 20, bonus:  30, label: :amateur)
Rank.create!(rate: :limited, value: 21, bonus:  31, label: :amateur)
Rank.create!(rate: :limited, value: 22, bonus:  31, label: :amateur)
Rank.create!(rate: :limited, value: 23, bonus:  32, label: :amateur)
Rank.create!(rate: :limited, value: 24, bonus:  32, label: :amateur)
Rank.create!(rate: :limited, value: 25, bonus:  33, label: :amateur)
Rank.create!(rate: :limited, value: 26, bonus:  33, label: :amateur)
Rank.create!(rate: :limited, value: 27, bonus:  34, label: :familiar)
Rank.create!(rate: :limited, value: 28, bonus:  34, label: :familiar)
Rank.create!(rate: :limited, value: 29, bonus:  35, label: :familiar)
Rank.create!(rate: :limited, value: 30, bonus:  35, label: :familiar)


Rank.create!(rate: :below_average, value:  0, bonus: -17, label: :unskilled)
Rank.create!(rate: :below_average, value:  1, bonus:   2, label: :neophyte)
Rank.create!(rate: :below_average, value:  2, bonus:   4, label: :neophyte)
Rank.create!(rate: :below_average, value:  3, bonus:   6, label: :neophyte)
Rank.create!(rate: :below_average, value:  4, bonus:   9, label: :neophyte)
Rank.create!(rate: :below_average, value:  5, bonus:  12, label: :neophyte)
Rank.create!(rate: :below_average, value:  6, bonus:  15, label: :neophyte)
Rank.create!(rate: :below_average, value:  7, bonus:  17, label: :amateur)
Rank.create!(rate: :below_average, value:  8, bonus:  19, label: :amateur)
Rank.create!(rate: :below_average, value:  9, bonus:  22, label: :amateur)
Rank.create!(rate: :below_average, value: 10, bonus:  24, label: :amateur)
Rank.create!(rate: :below_average, value: 11, bonus:  26, label: :amateur)
Rank.create!(rate: :below_average, value: 12, bonus:  28, label: :amateur)
Rank.create!(rate: :below_average, value: 13, bonus:  29, label: :amateur)
Rank.create!(rate: :below_average, value: 14, bonus:  31, label: :amateur)
Rank.create!(rate: :below_average, value: 15, bonus:  32, label: :amateur)
Rank.create!(rate: :below_average, value: 16, bonus:  34, label: :familiar)
Rank.create!(rate: :below_average, value: 17, bonus:  36, label: :familiar)
Rank.create!(rate: :below_average, value: 18, bonus:  38, label: :familiar)
Rank.create!(rate: :below_average, value: 19, bonus:  39, label: :familiar)
Rank.create!(rate: :below_average, value: 20, bonus:  40, label: :familiar)
Rank.create!(rate: :below_average, value: 21, bonus:  41, label: :familiar)
Rank.create!(rate: :below_average, value: 22, bonus:  42, label: :familiar)
Rank.create!(rate: :below_average, value: 23, bonus:  42, label: :familiar)
Rank.create!(rate: :below_average, value: 24, bonus:  43, label: :familiar)
Rank.create!(rate: :below_average, value: 25, bonus:  43, label: :familiar)
Rank.create!(rate: :below_average, value: 26, bonus:  44, label: :familiar)
Rank.create!(rate: :below_average, value: 27, bonus:  45, label: :familiar)
Rank.create!(rate: :below_average, value: 28, bonus:  46, label: :familiar)
Rank.create!(rate: :below_average, value: 29, bonus:  47, label: :familiar)
Rank.create!(rate: :below_average, value: 30, bonus:  47, label: :familiar)


Rank.create!(rate: :standard, value:  0, bonus: -15, label: :unskilled)
Rank.create!(rate: :standard, value:  1, bonus:   3, label: :neophyte)
Rank.create!(rate: :standard, value:  2, bonus:   6, label: :neophyte)
Rank.create!(rate: :standard, value:  3, bonus:   9, label: :neophyte)
Rank.create!(rate: :standard, value:  4, bonus:  12, label: :neophyte)
Rank.create!(rate: :standard, value:  5, bonus:  15, label: :neophyte)
Rank.create!(rate: :standard, value:  6, bonus:  18, label: :amateur)
Rank.create!(rate: :standard, value:  7, bonus:  21, label: :amateur)
Rank.create!(rate: :standard, value:  8, bonus:  24, label: :amateur)
Rank.create!(rate: :standard, value:  9, bonus:  27, label: :amateur)
Rank.create!(rate: :standard, value: 10, bonus:  30, label: :amateur)
Rank.create!(rate: :standard, value: 11, bonus:  32, label: :amateur)
Rank.create!(rate: :standard, value: 12, bonus:  34, label: :familiar)
Rank.create!(rate: :standard, value: 13, bonus:  36, label: :familiar)
Rank.create!(rate: :standard, value: 14, bonus:  38, label: :familiar)
Rank.create!(rate: :standard, value: 15, bonus:  40, label: :familiar)
Rank.create!(rate: :standard, value: 16, bonus:  42, label: :familiar)
Rank.create!(rate: :standard, value: 17, bonus:  44, label: :familiar)
Rank.create!(rate: :standard, value: 18, bonus:  46, label: :familiar)
Rank.create!(rate: :standard, value: 19, bonus:  48, label: :familiar)
Rank.create!(rate: :standard, value: 20, bonus:  50, label: :familiar)
Rank.create!(rate: :standard, value: 21, bonus:  51, label: :familiar)
Rank.create!(rate: :standard, value: 22, bonus:  52, label: :familiar)
Rank.create!(rate: :standard, value: 23, bonus:  53, label: :familiar)
Rank.create!(rate: :standard, value: 24, bonus:  54, label: :familiar)
Rank.create!(rate: :standard, value: 25, bonus:  55, label: :adroit)
Rank.create!(rate: :standard, value: 26, bonus:  56, label: :adroit)
Rank.create!(rate: :standard, value: 27, bonus:  57, label: :adroit)
Rank.create!(rate: :standard, value: 28, bonus:  58, label: :adroit)
Rank.create!(rate: :standard, value: 29, bonus:  59, label: :adroit)
Rank.create!(rate: :standard, value: 30, bonus:  60, label: :adroit)


Rank.create!(rate: :above_average, value:  0, bonus: -12, label: :unskilled)
Rank.create!(rate: :above_average, value:  1, bonus:   3, label: :neophyte)
Rank.create!(rate: :above_average, value:  2, bonus:   7, label: :neophyte)
Rank.create!(rate: :above_average, value:  3, bonus:  10, label: :neophyte)
Rank.create!(rate: :above_average, value:  4, bonus:  14, label: :neophyte)
Rank.create!(rate: :above_average, value:  5, bonus:  17, label: :amateur)
Rank.create!(rate: :above_average, value:  6, bonus:  21, label: :amateur)
Rank.create!(rate: :above_average, value:  7, bonus:  24, label: :amateur)
Rank.create!(rate: :above_average, value:  8, bonus:  27, label: :amateur)
Rank.create!(rate: :above_average, value:  9, bonus:  30, label: :amateur)
Rank.create!(rate: :above_average, value: 10, bonus:  33, label: :amateur)
Rank.create!(rate: :above_average, value: 11, bonus:  37, label: :familiar)
Rank.create!(rate: :above_average, value: 12, bonus:  40, label: :familiar)
Rank.create!(rate: :above_average, value: 13, bonus:  43, label: :familiar)
Rank.create!(rate: :above_average, value: 14, bonus:  45, label: :familiar)
Rank.create!(rate: :above_average, value: 15, bonus:  47, label: :familiar)
Rank.create!(rate: :above_average, value: 16, bonus:  50, label: :familiar)
Rank.create!(rate: :above_average, value: 17, bonus:  52, label: :familiar)
Rank.create!(rate: :above_average, value: 18, bonus:  54, label: :familiar)
Rank.create!(rate: :above_average, value: 19, bonus:  56, label: :adroit)
Rank.create!(rate: :above_average, value: 20, bonus:  58, label: :adroit)
Rank.create!(rate: :above_average, value: 21, bonus:  61, label: :adroit)
Rank.create!(rate: :above_average, value: 22, bonus:  62, label: :adroit)
Rank.create!(rate: :above_average, value: 23, bonus:  63, label: :adroit)
Rank.create!(rate: :above_average, value: 24, bonus:  64, label: :adroit)
Rank.create!(rate: :above_average, value: 25, bonus:  65, label: :adroit)
Rank.create!(rate: :above_average, value: 26, bonus:  67, label: :adroit)
Rank.create!(rate: :above_average, value: 27, bonus:  68, label: :adroit)
Rank.create!(rate: :above_average, value: 28, bonus:  69, label: :adroit)
Rank.create!(rate: :above_average, value: 29, bonus:  70, label: :adroit)
Rank.create!(rate: :above_average, value: 30, bonus:  72, label: :master)


Rank.create!(rate: :plus, value:  0, bonus: -10, label: :unskilled)
Rank.create!(rate: :plus, value:  1, bonus:   4, label: :neophyte)
Rank.create!(rate: :plus, value:  2, bonus:   8, label: :neophyte)
Rank.create!(rate: :plus, value:  3, bonus:  12, label: :neophyte)
Rank.create!(rate: :plus, value:  4, bonus:  16, label: :neophyte)
Rank.create!(rate: :plus, value:  5, bonus:  20, label: :amateur)
Rank.create!(rate: :plus, value:  6, bonus:  24, label: :amateur)
Rank.create!(rate: :plus, value:  7, bonus:  28, label: :amateur)
Rank.create!(rate: :plus, value:  8, bonus:  32, label: :amateur)
Rank.create!(rate: :plus, value:  9, bonus:  36, label: :familiar)
Rank.create!(rate: :plus, value: 10, bonus:  40, label: :familiar)
Rank.create!(rate: :plus, value: 11, bonus:  43, label: :familiar)
Rank.create!(rate: :plus, value: 12, bonus:  46, label: :familiar)
Rank.create!(rate: :plus, value: 13, bonus:  49, label: :familiar)
Rank.create!(rate: :plus, value: 14, bonus:  52, label: :familiar)
Rank.create!(rate: :plus, value: 15, bonus:  55, label: :familiar)
Rank.create!(rate: :plus, value: 16, bonus:  58, label: :adroit)
Rank.create!(rate: :plus, value: 17, bonus:  61, label: :adroit)
Rank.create!(rate: :plus, value: 18, bonus:  64, label: :adroit)
Rank.create!(rate: :plus, value: 19, bonus:  67, label: :adroit)
Rank.create!(rate: :plus, value: 20, bonus:  70, label: :adroit)
Rank.create!(rate: :plus, value: 21, bonus:  72, label: :master)
Rank.create!(rate: :plus, value: 22, bonus:  73, label: :master)
Rank.create!(rate: :plus, value: 23, bonus:  75, label: :master)
Rank.create!(rate: :plus, value: 24, bonus:  76, label: :master)
Rank.create!(rate: :plus, value: 25, bonus:  78, label: :master)
Rank.create!(rate: :plus, value: 26, bonus:  79, label: :master)
Rank.create!(rate: :plus, value: 27, bonus:  81, label: :grandmaster)
Rank.create!(rate: :plus, value: 28, bonus:  82, label: :grandmaster)
Rank.create!(rate: :plus, value: 29, bonus:  84, label: :grandmaster)
Rank.create!(rate: :plus, value: 30, bonus:  85, label: :grandmaster)
