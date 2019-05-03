eval$s=%w(
  s=%(eval$s=%w(#{$s})*"");

  create_generator = -> {
    start = 0;
      ->(n) {
      t = -> {
        head = s.slice(start..-1);
        rest = start + n - s.length;
        tail = s.slice(0, rest);
        start = rest;
        head + tail;
      };
      f = -> {
        s.slice(start, n).tap { start += n };
      };
      (start + n > s.length) ? t.call() : f.call()
    };
  };
  generator = create_generator.call;

  n='enojl1k11g20mj5381reqjpe01m9m82js0kstmb9i0s4gxg2iwa7ztdtbkdvjirms6rf4oig7dk8tcsb2qeufcre6zi3ij8cbnefywdlsshr61lnd96pvlri7mbhdcb1a33718j6rgau4c0lcilz53ms8vkpx5n7qehyq56r1twswzwq6rm4keahs70l2kyksaktgljjel8io7lcvexhjfm9afeom2ajt1h1o7mi08c0rvk7hfzb5ta5c73y0oe2p09vwp3uvprvp8dymi5bebekzy9wsz84ebksxfaaopj8dwc06flqd1wc5hlj03vaprvvq13z0cmmt505v4nm9v71tnwlaz134b239yqrne2kzroxca65mxb29e9fx456odd32bf0yfpbfx895ockoqpbje7s0fb3k9p8e9qmaw15b3788gjasps7xsenttpmn'.to_i(36);
  row_length=29;
  column_length=80;
  row_length.times { |y|
    line = (0..column_length - 1)
           .map { |c| n[c + y * column_length] }
           .join
           .tr('01', 32.chr << '#');
    new_line = line.split('').reduce('') { |a, e|
      a + ((e == '#') ? generator.call(1) : 32.chr)
    };
    puts(new_line);
  };
)*""
