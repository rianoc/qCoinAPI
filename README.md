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
@[.coin.decode;;{show x}] each read0 `:samples.json
```

### Notes

Below steps can avoid SSL issues.
Full details available on <https://code.kx.com/q/kb/ssl/>

```bash
export KX_SSL_VERIFY_SERVER=false
sudo apt-get install -y libssl-dev
```
