require 'json'

# エンコード後の値に`()`を含めないようにするため,
# 42 ~ 91, 93 ~ 126の文字を使う
A = 42
B = 91
C = 93
D = 126

# 基数
BASE = (A..B).to_a.length + (C..D).to_a.length

EXPECTED = %w(hey code for fun)

FILENAME = ARGV[0]
unless EXPECTED.include?(FILENAME)
  raise "invalid filename: #{FILENAME}\nexpected: #{EXPECTED.join(', ')}"
end

def encode(n)
  ns = []
  while n > 0
    ns << n % BASE
    n /= BASE
  end

  ns = ns.map { |n| (n + C - A) % (D - A + 1) + A }

  ns.pack('C*').reverse
end

def decode(s)
  n = 0
  s.bytes do |m|
    n = n * BASE + (m + D - A - C + 1) % (D - A + 1)
  end
  n
end

def source
  File
    .read("./sources/#{FILENAME}.txt")
    .tr("\n", '')
    .reverse
    .gsub(/./, { ' ' => 0, '#' => 1 })
    .to_i(2)
end

encoded = encode(source)
puts({
  base: BASE,
  decoder: "(m + #{D - A - C + 1}) % (#{D - A + 1})",
  encoded: encoded,
  result: decode(encoded) == source
}.to_json)
