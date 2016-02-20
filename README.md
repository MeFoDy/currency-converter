# Currency Converter script

Currency converter using YAHOO API

---
## Using

Just call `currency.rb` as `ruby currency.rb [amount] [currency]`, where
* `amount` - amount of your money (1000 default);
* `currency` - your current currency: BYR (default), EUR, USD or RUB.

Result looks like:
```
user@user:~$ ruby currency.rb 1000000 BYR
USD 46.296
EUR 41.587
RUB 3566.308
```

## Alias
To use this script with Terminal as fast command just add this string to your `~/.bash_profile`:
```
alias curconv="ruby ~/currency.rb"
```

Change `curconv` to your own alias. `~/currency.rb` is the path to my script, change it too.

After these manipulations you can call this script like `curconv 10000 USD`.
