eval$s=%w(
  s=%(eval$s=%w(#{$s})*"");

  n='d7g705ztp6fv4svae0st2ey5sgeukr4rcgub63x9t818mr5okjdyupyyuw9h5p9cpm0y3o98cln772vz9x3h2y2vdbv6ysboxwxid7osig6a1zwnikz4dd5qpwj8psu2cuvcom9aamyf4ae6twocsjqsqylgqb451r2jz91qeus4fxhc1uwhb42bxdsb6tkpsm6gwl58dsjiixt3sp2q5f72dboixbjxvzeyvtvc8pxuu7e9esrd6gfi8r2pvsbpuhbk2uhvdtd6qqi3aik8u59d92c45ago4maxosh709xncsccn2dvu2oh0hj88pjroor2kjjjf17m4iitqj5ucv9f71fqve4g1gjf45235u5jopv4hs1y15nrszx5zi5oq32max785s014dyqzc00m95xmqpb17kee76q4cc4o2okz8ehrfkul8zfd727'.to_i(36);
  rl=31;
  cl=74;
  o='';
  rl.times { |r|
    l = (0..cl - 1).map { |c|
      n[c + r * cl]
    }.join.tr('01', ''<<32<<'#');
    puts(l)
  };
)*""
