# 当日にやること

1. `inventory.yml`の各サーバーの`ansible_host`をEC2のパブリックIPに変更

# コマンド

## セットアップ

```bash
brew install ansible
ansible-galaxy install newrelic.newrelic_install
ansible-galaxy collection install ansible.windows ansible.utils
```

## 疎通確認

```bash
ansible -i inventory.yml all -m ping
```

## setupの実行

```bash
ansible-playbook -i inventory.yml setup.yml
```

## デプロイ

```bash
ansible-playbook -i inventory.yml rakko.yml -e "branch_name=<branch_name>"
```

systemctl list-unit-files --type=service
systemctl cat
systemctl daemon-reload
