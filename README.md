# 当日にやること

1. `inventory.yml`の各サーバーの`ansible_host`をEC2のパブリックIPに変更

# コマンド

## セットアップ

```bash
make setup
```
## 疎通確認

```bash
make ping
```

## setupの実行

```bash
make setup
```

## デプロイ

```bash
make deploy branch=main
```
