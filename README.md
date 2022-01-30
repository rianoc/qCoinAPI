# qCoinAPI

Basic work in progress q/kdb+ websocket API for www.coinapi.io

## Usage

Export your API key as an environment variable:

```bash
export KX_QCOINAPI_APIKEY="******-****-****-****-************"
```

See `example.q` for an example of usage.

To view example processed messages:

```q
.coin.decode each read0 `:samples.json
```
