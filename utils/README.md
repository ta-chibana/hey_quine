## `encode.rb`

```json
hey_quine $ ruby utils/encode.rb hey | jq .
{
  "base": 84,
  "decoder": "(m + -8) % (85)",
  "encoded": "?t4e4nq5ZOO0qrwiS.;Bl:[5AUZ`SXJ*L`SMpUJK2ZdOM*t*wZ9Ks+[qnbUtsuMn9`hbJ7JGz^3LAxnB3tVU~/,Dgvzy8/U}.;Ar2ml;Hb[<RH1wtuGKDpVFP.c-3
0I>DnP80Dv3Q7ZTG4`YV5ox1=-~or;4*hz34v,`?]5S7-/3;7/a.derS2mNNI,wIf7+M^pqZj5<,/l<C~3r?wQHEyIhw4z<5gw=P=1,~l53^spgB:A^^`O5jHBPTRqt+Pp~AX3~O8qy
xX^yk*in0K;Lp|~`=fx..wCgSjHI/kF0f}d?v>7fwd424H*?CSOrU{ZU3mH@=Sw:zGBCconXzC",
  "result": true
}
```
