F = [
  "_d[d6Uo<f}6_~TZIbzmq7?h5;nbAVMX1?Rs)b7Q8jI4ea42NI[.*hq^x67{Tpg'jd?MhW1VA8IbkR]=|)NxiRX=~|JmGRMgV&li@3FJj{+9'7_^{Ono[[2/+mR~u;YRza}MSRXK3e&2G-3>vRa`J^y-SF;_|uO8,e3LpNjTFEEpbhP`FOy,=W8X(92TN(&aJhiq2jWjSdiZ(FYM2);AlV2Z)K;Zl}}z/+*i*R:VBWc7K(wi6'<VQv+6>N^M0z2:rtT*fY>uo]@|grGM=oL:k,a>PcrrQh|b.N.IS_kJ2HyQ5RLQ,e8y&A7P)B:mCC]Tm/,Gg7P^*o}'[MWvA,r4},R~bA-ph{PS1RCXw5NS[",
  "_d[d6Uo<f}6_~T[-lAk9JDoh|;Y{3(HV,m9DG|&Pj&=?]l3e/guDH|S'o)VqRDM-]?}qquCU>Tc:wsACC1&QZG{l7Bb_Q(:;wCa+XrL4N*@sJ,ai}iE1Wk.>bkj<L^FS>s>-q]dgRfY.m(14y/2]X8MnWLH/*=V2hLs~&)lUs:o@9b`wZ='m5kkypBh3vJkDpj(htWG0?_F`@d]>PVa&ncyJB}m*unPQibMv8kN21.WAp;KsSpDaXPeDxUn0fr7`jI5Hc@Er<2{@x]HVU>@JmE58~c[F+I84hpwBzF0i/C`fR@QhK<zCP>??Y|`rN<otYRHsVa5pNdYw5`]5cGee@C)B1n[EP4=WpMOsv^&l",
  "_d[d6Uo<f}6_~T[-lAk9JDoh|<j*xZub{-LK(YTdvJi.GSG5L(kZWj[Et+@a;Bu)/;`}Zp=&O=zJd09'LF=rqou4^hd4g_alU[ZO=eJh`dtZKW<@HG-o|@aiqN5h.V?A;hl*fIi5'8@ePVU88E56*b<u+RPma=K4D[_80u6F9W]OMKya{6=`c(z3Tc^Sb3H:bI8E~2[F'[@)os8&bUkB)H5+1.~0COB';e94SGETDui1TThfnIs5U7WR*C{m'`9WN,OtZr01JYA5jbqzV(5hKC<ihH|_9Jv<=9dHWft<+DIS106F4Am=VYN.(/d4qnMJVR=yv0zu:ZWNfR4LrdOMLX]3K=sHo-8Zouu;57f+",
  "_d[d6Uo<f}6_~T[-lAk9JDoh|<iXgjhbZ'0=Wtx)3oM,l'te6AkiJL<fpColNoQzH);aN5,~QvpAgF:o5;h&soC*=cRW[zd9'ObLV9[7-CXJ:-Hh9JU>1ab.?f6W>oz?axyV_1rCk<ncI'a`'2kRznFp(xG,(I*[5u>0}8-z;=c{SY0D`C<V(d.Y>tpQzlakRFsF;lOf~Qo9Un@F/-08aC&Rpww:|g36a<Yw>4'n[Qfd9nC;H{I|jSc9rd5;dgeQ*,`L0uN&}x(-1uqfS>7B^aoV/S`~BT~]TW?_~PsmnQa6r9i`zxAyv7/<FFuh.Kz;0EC`9+n[uy}{s*CBmp1):xErlMvB&K>OWlf2rx6l"
];
eval$s=%w(
  n = F.shift;
  F.push(n);
  s=%(
    F=#{F};
    eval$s=%w(#{$s})*"";
  );
  code = 0;
  n.bytes { |m| code = code * 88 + (m - 4) % 89 };

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
