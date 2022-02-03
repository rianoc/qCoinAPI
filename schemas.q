book:flip `symbol_id`sequence`time_exchange`time_coinapi`is_snapshot`asks`bids!(
 `symbol$();`int$();`timestamp$();`timestamp$();`boolean$();();())

book20:flip `symbol_id`sequence`time_exchange`time_coinapi`asks`bids!(
 `symbol$();`int$();`timestamp$();`timestamp$();();())

book5:flip `symbol_id`sequence`time_exchange`time_coinapi`asks`bids!(
 `symbol$();`int$();`timestamp$();`timestamp$();();())

book50:flip `symbol_id`sequence`time_exchange`time_coinapi`asks`bids!(
 `symbol$();`int$();`timestamp$();`timestamp$();();())

book_l3:flip `symbol_id`sequence`time_exchange`time_coinapi`is_snapshot`asks`bids!(
 `symbol$();`int$();`timestamp$();`timestamp$();`boolean$();();())

error:flip `type`message`time!(
 ();();`timestamp$())

exrate:flip `asset_id_base`asset_id_quote`time`rate!(
 `symbol$();`symbol$();`timestamp$();`float$())
heartbeat:flip `type`time!(();`timestamp$())

ohlcv:flip `symbol_id`sequence`time_period_start`time_period_end`time_open`time_close`price_open`price_high`price_low`price_close`volume_traded`trades_count!(
 `$();`float$();();();`timestamp$();`timestamp$();`float$();`float$();`float$();`float$();`float$();`int$())

quote:flip `symbol_id`sequence`time_exchange`time_coinapi`ask_price`ask_size`bid_price`bid_size!(
 `symbol$();`int$();`timestamp$();`timestamp$();`float$();`float$();`float$();`float$())

reconnect:flip `within_seconds`before_time!(
 `int$();`timestamp$())

trade:flip `time_exchange`time_coinapi`uuid`price`size`taker_side`symbol_id`sequence!(
 `timestamp$();`timestamp$();`guid$();`float$();`float$();`symbol$();`symbol$();`int$())

volume:flip `period_id`time_coinapi`volume_by_symbol!(
 `$();`timestamp$();())