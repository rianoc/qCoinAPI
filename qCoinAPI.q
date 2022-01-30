.coin.resp:()
.coin.handle:0Ni

.coin.caster:{[t;d] ![t;();0b;key[d]!{(x;y)}'[value d;key d]]}
.coin.cast.ts:{"P"$-1_/:x}

.coin.decode:{[x]
 x:.j.k x;
 typ:x`type;
 .coin.cb[`$typ] $[in[;key .coin.cast] `$typ;.coin.caster[enlist `type _ x;.coin.cast `$typ];enlist x];
 }

.z.ws:.coin.decode
.coin.cast.basic:`time_exchange`time_coinapi`symbol_id`sequence!(.coin.cast.ts;.coin.cast.ts;`$;`int$)
.coin.cast.trade:.coin.cast.basic,`uuid`taker_side!("G"$;`$)
.coin.cast.quote:.coin.cast.basic
.coin.cast.book:.coin.cast.basic
.coin.cast.book5:.coin.cast.basic
.coin.cast.book20:.coin.cast.basic
.coin.cast.book50:.coin.cast.basic
.coin.cast.book_l3:.coin.cast.basic
.coin.cast.ohlcv:.coin.cast.basic,`time_open`time_close`trades_count!(.coin.cast.ts;.coin.cast.ts;`int$)
.coin.cast.volume:enlist[`time_coinapi]!enlist .coin.cast.ts
.coin.cast.exrate:`asset_id_base`asset_id_quote`time!(`$;`$;.coin.cast.ts)
.coin.cast.reconnect:`within_seconds`before_time!(`int$;.coin.cast.ts)

.coin.init:{[config]
 .coin.resp:`:wss://ws.coinapi.io "GET /v1 HTTP/1.1\r\nHost: ws.coinapi.io\r\nOrigin: ws.coinapi.io\r\n\r\n";
 .coin.handle:.coin.resp 0;
 neg[.coin.handle] .j.j config
 }

.coin.close:{
 if[(not null .coin.handle) and .coin.handle in key .z.W;
  hclose .coin.handle
 ];
 .coin.handle:0Ni
 }

