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

## playbookの実行

```bash
ansible-playbook -i inventory.yml playbook.yml
```
