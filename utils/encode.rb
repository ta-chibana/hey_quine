# 88進数を用いる前提のスクリプト
EXPECTED = %w(hey code for fun)

FILENAME = ARGV[0]
unless EXPECTED.include?(FILENAME)
  raise "invalid filename: #{FILENAME}\nexpected: #{EXPECTED.join(', ')}"
end

def encode(n)
  ns = []
  while n > 0
    ns << n % 88
    n /= 88
  end

  ns = ns.map { |n| (n + 55) % 89 + 38 }

  ns.pack('C*').reverse
end

def decode(s)
  n = 0
  s.bytes do |m|
    n = n * 88 + (m - 4) % 89
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
puts("encoded: #{encoded}")
puts("decoded == source: #{decode(encoded) == source}")
