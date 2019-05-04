eval$s=%w(
  s=%(eval$s=%w(#{$s})*"";);

  create_generator = -> {
    start = 0;
    pad_started = false;
    sep_started = false;

    ->(template) {
      char_count = template.count('1');
      t = -> {
        head = s.slice(start..-1);
        rest = start + char_count - s.length;
        tail = s.slice(0, rest);
        chars = (!pad_started && !sep_started) ? (head + '%' + 64.chr + tail[0..-3]).tap {
          rest - 2; pad_started = true; sep_started = true;
        } : head + tail;
        template.split('').reduce('') { |a, c|
          char = (c == '1') ? chars.slice!(0) : 32.chr;
          a + char;
        }.tap { start = rest };
      };
      f = -> {
        chars = s.slice(start, char_count);
        template.split('').reduce('') { |a, c|
          char = (c == '1') ? (
            (pad_started && !sep_started) ? (sep_started = true; 64.chr)
                                          : chars.slice!(0);
          ) : 32.chr;
          a + char;
        }.tap { start += char_count };
      };
      (start + char_count > s.length) ? t.call() : f.call()
    };
  };
  generator = create_generator.call;

  n = 'enojl1k11g20mj5382kzjg9jfsfpqjsuh3goz5wertqdilk73ybgyb9caquycycz77upm8tdmb3oe812k9os0ludjlrubhfq2l13s6c7fs1ox98sx1391m1hpxpyfv1r6zrsd4vf2vb2q25g99iezaj4h2bnq5hf8m5j4xtu0dr3pd6jqc0nuiq4og5xdm4qkiwepxvuiirlz34wsllugd4svk4bshfg9ryw07xw66rhee6nkb8e9ubth1gg4g7gss2y47dmlix698rt9g9nw06ssll5owsy8suabyxr9z67fhw68anmy87evjphjpplksg9j06ugdctg9092s0h34h9v3v0i86rgvvjbdbko73uhulrp00ijh8qxrcno90g4tvc6940gqcsqwns0ng6krwy3upc938fwckp8za1zl4kywmljoo9m3prltvxd3i7z'.to_i(36);
  row_length = 29;
  column_length = 80;
  row_length.times { |y|
    line = (0..column_length - 1)
           .map { |x| n[x + y * column_length] }
           .join;
    new_line = generator.call(line);
    print((y == row_length - 1) ? new_line.slice(0..-2) : new_line + "\n");
  };
  puts(64.chr);
)*"";
