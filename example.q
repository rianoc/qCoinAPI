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

/For book tables
/Split `asks`bids --> `askPrices`askSizes`bidPrices`bidSizes
.coin.example.expandAsksBids:{delete asks, bids from update askPrices:asks[;`price],askSizes:asks[;`size],bidPrices:bids[;`price],bidSizes:bids[;`size] from x}

/Volume
/ volume_by_symbol --> `symbol_id`asset_id_base`asset_id_quote`volume_base`volume_quote (+ungroup)
.coin.example.expandVolume:{.coin.caster[;`symbol_id`asset_id_base`asset_id_quote!(`$;`$;`$)]raze {(count[y]#enlist x),'y}'[select period_id,time_coinapi from x;x`volume_by_symbol]}