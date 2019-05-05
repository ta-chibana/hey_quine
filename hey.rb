F = [
  "bOlE1R-Y^LnYxIADvyJOWT)&J>/|R;}T@z>|t3<m<v]e[bWH*-ytJ{=iSgW7a^twA_>dT0Cfjt0zN>`Mn6AhH:7'rnTcb>()qZ4GLEa3(Q9rKK9^sX(I8Q(-aN0c>V{CL9r^90kS*rdluCbc:w_pJ'nR;(-ZQZ>.+LaC+nyi0GlxZ/d=rskR/~U?8u@;A7Zjf=pA4]pAOPx*)l<wXKVN;aN]NQXV7m7{GNpIJayrOi6A_-JGiP*`471Uxkv,2Ao`M7?LX<[|(]k}UbSgV{e[fJs`yt**w*l]**Lx(om)Ayl-R;k@kY*.*~.z]=?5TCX4Z28p?(_y<`T)4C[",
  "bOw-xSho(i<qZrGPyR=1SNSfo0c4a<q30F=-E{rSj&`4Avggz1md.6I_S(A()z(qRE|A7IaV5P;kXedO5W~P6<~aqb:h&K+iM=e|ztJ|06^p+1CzpZ?'T;8Ml^08'VXR}H<*eOq(dSg?q0@3':gJbm?5V/vov5.7q{zq;A+GQD_X)U=H_.P=8~BwW@?Gl0qh_l.Njvr,=tK*==xoNXGmtWc1_pTRiD|,?84&_}@KCRz>v7eF{7bO|HdA=|+}f5e3@[5){[8z,y|dHBqFW{f>XDwmF`:-VYoe@,ZQn*A(MIB??`g}x?~ghJhw8ZBBts68;A&Na'h0i1q@ywl",
  "bOw-xSho(i<qZu<*J?)y2`8hP20kb)V_[3S-lg~)WzPJPb&f[wJ(qN()^1*M&Ex:S~beFWfAo6^G@z,qo-*m{37Vi1&1'O^+v@(Rpt]B5N6IT+lrH}'tu<XA8XmXGXX5^;/@z).{[RB'/K[(`TFjNWI|2/Hix>V}Zis9<eYYTI(-[`00F@Bmy-'Xn9V6y1:/Sa9sJ'?tr`K8QxcJ*l@ksg8+gf'jL8?2R7gyp/zHA=z:tgDJ[8]3Z1b'w)W7DsH3VA;b=<HJOS}9UVJ/0]^B@m2kNiup{o_u?u6c0[J)cN?<yM6u,_jib/{W3h)k|;+E?n+a|s+zEl=@v=+",
  "bOw-xSho(i<qZu4TsL,^5Gzv(=:cC1j43.7Uvx4ojN8UaeyHMtzst7xhHYjKFJ.oYTwi^zS1r1zy<=DkCM5|/xZ57Dj5*(vNCSsEGH9YJk?'H_)MyXV*+-kb]~8P}Iwa-95kMOcAEapnq?f5gxwgP1;Sd0KRp^z|7J:U`5EaP'I'6ek[TpSkl=<K.RB)ON,y{ylw,]v7&ssvVLPn{U|piyNsObU.7J&PI6@f^kxS?:H}2c0o/,5|)V)>{:I.W:oXDLo7k2|7HPJe5<V7@R[5gimadE-K*V*/VhAt|+/6B_N8txD/C+an1.hCq*F,m|m&.?'FiJ=Uh]djB.l"
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
