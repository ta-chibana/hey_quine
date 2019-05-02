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

  n='d7g705ztp6fv4svae0st2ey5sgeukr4rcgub63x9t818mr5okjdyupyyuw9h5p9cpm0y3o98cln772vz9x3h2y2vdbv6ysboxwxid7osig6a1zwnikz4dd5qpwj8psu2cuvcom9aamyf4ae6twocsjqsqylgqb451r2jz91qeus4fxhc1uwhb42bxdsb6tkpsm6gwl58dsjiixt3sp2q5f72dboixbjxvzeyvtvc8pxuu7e9esrd6gfi8r2pvsbpuhbk2uhvdtd6qqi3aik8u59d92c45ago4maxosh709xncsccn2dvu2oh0hj88pjroor2kjjjf17m4iitqj5ucv9f71fqve4g1gjf45235u5jopv4hs1y15nrszx5zi5oq32max785s014dyqzc00m95xmqpb17kee76q4cc4o2okz8ehrfkul8zfd727'.to_i(36);
  row_length=31;
  column_length=74;
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
