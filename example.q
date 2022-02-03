// Load the API
\l qCoinAPI.q

// If you need schemas load them
\l schemas.q

// Create a dictionary of your connection settings
config:(!) . flip (
    (`type;`hello);
    (`apikey;getenv`KX_QCOINAPI_APIKEY);
    (`aeartbeat;1b);
    (`subscribe_data_type;enlist `trade)
 );

// Define a callback for each message type
.coin.cb.error:{`error upsert update time:.z.p from x;'first x`message}
.coin.cb.trade:{`trade upsert x}
.coin.cb.quote:{`quote upsert x}
.coin.cb.book:{`book upsert x}
.coin.cb.book5:{`book5 upsert x}
.coin.cb.book20:{`book20 upsert x}
.coin.cb.book50:{`book50 upsert x}
.coin.cb.book_l3:{`book_l3 upsert x}
.coin.cb.ohlcv:{`ohlcv upsert x}
.coin.cb.volume:{`volume upsert x}
.coin.cb.exrate:{`exrate upsert x}
.coin.cb.reconnect:{`reconnect upsert x}
.coin.cb.hearbeat:{`heartbeat upsert update time:.z.p from x} // DO NOT FIX! it's a typo in the official msg 

.coin.init config

.z.ts:{
 if[20000<count trade;.coin.close[]]
 }

\t 1000

