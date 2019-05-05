i = 0;
eval$s=%w(
  s=%(
    i=#{(i+1)%4};
    eval$s=%w(#{$s})*"";
  );
  F = [
    "?t4e4nq5ZOO0qrwiS.;Bl:[5AUZ`SXJ*L`SMpUJK2ZdOM*t*wZ9Ks+[qnbUtsuMn9`hbJ7JGz^3LAxnB3tVU~/,Dgvzy8/U}.;Ar2ml;Hb[<RH1wtuGKDpVFP.c-30I>DnP80Dv3Q7ZTG4`YV5ox1=-~or;4*hz34v,`?]5S7-/3;7/a.derS2mNNI,wIf7+M^pqZj5<,/l<C~3r?wQHEyIhw4z<5gw=P=1,~l53^spgB:A^^`O5jHBPTRqt+Pp~AX3~O8qyxX^yk*in0K;Lp|~`=fx..wCgSjHI/kF0f}d?v>7fwd424H*?CSOrU{ZU3mH@=Sw:zGBCconXzC",
    "?u<|8Rk;_.195|*yDl@,NjL8Go89hT9OJDh;YtM=}]@8>hNp*yHP=,~BH]XS>oV/<w9QKhZ2U}Qa9x+yNA]{=JM>-or?bALEPEV8RT6L3Vbc,+azNq8q:q7~+PyXFWYj_yJ/Rv5dk3q|?9*Lhc-d+06JpNmb/cOue^=6y{M2A]QdK<w?n[qGY*c[`z2P/h9NlGDb9?P9vdvYsKbru[iJ^^yx@?e~pl.+F/6QP2M<Qy8a@}=a:Sid*zQ;xs>o@s0{W:U@<P5L6Zn+P2X*zMpOr03ym?V`@WUlUgo:b9.kQzNdqkEEMxSn29=qing>VC`A^SwYp-[F:Q.ptKFHC+",
    "?u<|8Rk;_.1956nKJ_jL41+oEchIfpeDg7+Xb|f/44Hn-_jmT6e@Q]X4PW{F{E~8>@,Qco?ret3Ao+kf6={<}JckMd`^XLSuj6cP@:<+N;UR9z9YxE^k^d7,B<epB;JCw1S6_xb0GIRBp9[nSMLi*tU2=QD/xLe_DF4wKdj>*4FOmV>:2_z?m6xoNY-wiy`=?SX{9SC4Hj^1?@[ATd]tJW2jR1ob4/Pz@rXUXV1-M,C+iOQkE_G*Q7l,-K*L>8-[E[>MI@IQ,oUTIXAAX-1a]gFywe7z}q>SNhkMDS-`n58T-A`H=1{;fvT~R9P/B-d{nzzg=+e0a{B36oh=Ix",
    "?u<|8Rk;_.1955HFpmZPN_9RU>fiOIOJ8e@`sL;aVXX9Mse{`hYEU*[Q;1qbJ@4~j5T+?qt>0Mq2:018w|=<Z3>dI^:QXZgoLDlRs7W=ZE/?Q;oWsbNi`[Q[ot[^1F^ae7cBi8~Wk+/6AC*_]4n9od-hP^o6}KkI1?VkH_AX/{.{]aG<gAXFmKOgFr2bQ>Q|*B~+E/s+2L1J,|X1}e?iys>nSB:6JzWYG0YnJt?~~/}`V^B_s,63HYBZnk}gqEZpzLjL=a9v[?/_s2fHH7BdDsB{2d0pnb,awTrHwi6mCWDeNkR*7w4:sME,|[<Ys-4n+xqIMHV9k^Rf-WJ?XW"
  ];
  n = F[i];
  f = 0;
  n.bytes { |m| f = f * 84 + (m - 8) % 85 };

  st = 0;
  ps = false;
  ss = false;

  gen = -> t {
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

  R = 27;
  C = 80;
  PAD = '1' * C;
  3.times { puts(gen[PAD]) };
  R.times { |y|
    puts(gen[(0..C - 1).map { |x| f[x + y * C] }.join]);
  };
  2.times { puts(gen[PAD]) };
  print(gen[PAD[0..-2]]);
  puts(64.chr);
)*"";
