n = 'enojl1k11g20mj5381reqjpe01m9m82js0kstmb9i0s4gxg2iwa7ztdtbkdvjirms6rf4oig7dk8tcsb2qeufcre6zi3ij8cbnefywdlsshr61lnd96pvlri7mbhdcb1a33718j6rgau4c0lcilz53ms8vkpx5n7qehyq56r1twswzwq6rm4keahs70l2kyksaktgljjel8io7lcvexhjfm9afeom2ajt1h1o7mi08c0rvk7hfzb5ta5c73y0oe2p09vwp3uvprvp8dymi5bebekzy9wsz84ebksxfaaopj8dwc06flqd1wc5hlj03vaprvvq13z0cmmt505v4nm9v71tnwlaz134b239yqrne2kzroxca65mxb29e9fx456odd32bf0yfpbfx895ockoqpbje7s0fb3k9p8e9qmaw15b3788gjasps7xsenttpmn';
eval$s=%w(
  s=%(
    n = [
      'enojl1k11g20mj5382kzjg9jfsfpqjsuh3goz5wertqdilk73ybgyb9caquycycz77upm8tdmb3oe812k9os0ludjlrubhfq2l13s6c7fs1ox98sx1391m1hpxpyfv1r6zrsd4vf2vb2q25g99iezaj4h2bnq5hf8m5j4xtu0dr3pd6jqc0nuiq4og5xdm4qkiwepxvuiirlz34wsllugd4svk4bshfg9ryw07xw66rhee6nkb8e9ubth1gg4g7gss2y47dmlix698rt9g9nw06ssll5owsy8suabyxr9z67fhw68anmy87evjphjpplksg9j06ugdctg9092s0h34h9v3v0i86rgvvjbdbko73uhulrp00ijh8qxrcno90g4tvc6940gqcsqwns0ng6krwy3upc938fwckp8za1zl4kywmljoo9m3prltvxd3i7z',
      'enojl1k11g20mj5382kzjg9jfsfpqjsv0xh33f3foxtcreu7dqbitoe39xdgsf9m91v1gi8gts3jieuqhuu6nwvylct3e7joabfnczvwnstzouag1oo80hadlxvgioj49rbmp978a1q4p2e46n293rg4z5rd5b5g16w6beaa8k9c1gtw84vqpm2dlp9wlakny49tjuur4pq0b3dzxdwcdq68bz5klpn5rpv1oldhqedfllo5vyglxu8arvh67qxu3ysvz3rj1i7y6weqf7oiml41qu1bbi6h0lspph4wxq48oqe53r5yn4t8sm7sb00jl5ptbmngz6z7f61n9bo2jvu4704hd124rlq7swme606rxdc4rjyivcuqt8c8hkco7clxrguxyfh51nv2g98b1kq7gi7lr37ln1u84w9qh8zb329n7cklkoyujvrcp5tz3',
      'enojl1k11g20mj5382kzjg9jfsfpqjsv0c6vb8ap3j2y1y5b74dwij9setihwe56novihhujhotpgzzx33ne34i9ujzs0daypganj09ptvvbpis24w8s349fp4qh1pvemtmnum4k1d9h7c4pl5miwzcdh8oh4tvziej9on9wf31vi3nbd3zoykdsxkk53s073dhrknwfxowgfy46n2sg9fgrdnr55hjp1guam9ve5t46k931lja3k0ihude9yuj0ifq6ffejm98gw305u1jlb1u18kmiu63vjaev9adedxykijrgcrpgobsaebjjcthd6tc77donv8y6209mr5sgt25qzgh9aeps4x4qlp0i5al28lhtvk93ubvbp5vt7oidumxrcr1s2vplna1m1lmhwvo6ngor86mc3iu7znjhgoon4bku55mbchi06nn09o3cv'
    ].push('#{n}').shift;
    eval$s=%w(#{$s})*"";
  );
  code = n.to_i(36);

  st = 0;
  ps = false;
  ss = false;

  gen = ->t {
    cc = t.count('1');
    ft = -> {
      head = s.slice(st..-1);
      rest = st + cc - s.length;
      tail = s.slice(0, rest);
      chars = (!ps && !ss) ? (head + '%' + 64.chr + tail[0..-3]).tap {
        rest - 2; ps = true; ss = true
      } : head + tail;
      t.split('').reduce('') { |a, c|
        char = (c == '1') ? chars.slice!(0) : 32.chr;
        a + char;
      }.tap { st = rest };
    };
    ff = -> {
      chars = s.slice(st, cc);
      t.split('').reduce('') { |a, c|
        char = (c == '1') ? (
          (ps && !ss) ? (ss = true; 64.chr)
                      : chars.slice!(0);
        ) : 32.chr;
        a + char;
      }.tap { st += cc };
    };
    (st + cc > s.length) ? ft.call() : ff.call()
  };

  R = 29;
  C = 80;
  R.times { |y|
    l = gen.call((0..C - 1).map { |x| code[x + y * C] }.join);
    print((y == R - 1) ? l.slice(0..-2) : l + "\n");
  };
  puts(64.chr);
)*"";
