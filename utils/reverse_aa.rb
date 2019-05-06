# AAの`#`と空白を反転させる
LINE_LENGTH = 80

filename = ARGV[0]
source = File.read("./tmp/#{filename}.txt")
file = File.open("./aa/#{filename}.txt", 'w')

source.each_line do |line|
  str = line
        .chomp
        .gsub(/./, { ' ' => '#', '#' => ' ' })
        .ljust(LINE_LENGTH, '#')
  file.write("#{str}\n")
end
