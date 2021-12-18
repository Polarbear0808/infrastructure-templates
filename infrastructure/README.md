# infrastructure
インフラの構築  
Terraformを利用する  
インストール方法：https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started

## 環境セットアップ
### 開発環境

```
$ cd ./environment/dev
$ terraform plan
$ terraform apply
```

### 本番環境

```
$ cd ./environment/prd
$ terraform plan
$ terraform apply
```