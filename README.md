 ### モジュール構造
```
.
├── envs
│   ├── dev
│   │   └── terraform.tfvars
│   ├── prod
│   │   └── terraform.tfvars
│   └── staging
│       └── terraform.tfvars
├── global
├── modules
│   ├── ec2
│   │   ├── alb_Sg.tf
│   │   ├── alb.tf
│   │   ├── outputs.tf
│   │   ├── security_group.tf
│   │   ├── tg.tf
│   │   ├── variables.tf
│   ├── ecs
│   │   ├── ecs.tf
│   │   ├── nginx_sg.tf
│   │   ├── variables.tf
│   ├── iam
│   │   ├── ecs_task_execution_role.tf
│   ├── vpc
│   │   ├── vpc.tf
│   │   ├── subnets.tf
│   │   ├── routes.tf
│   │   ├── igw.tf
│   │   ├── eip.tf
│   │   ├── ngw.tf
│   │   ├── vpc_endpoint.tf
│   │   ├── variables.tf
│   │   └── security_group.tf
│   └── ec2
│   │   ├── alb.tf
│   │   ├── alb_sg.tf
│   │   ├── tg.tf
│   └── ecs
│   └── iam
│   └── rds
├── locals.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── README.md
├── terraform.tfvars
├── variables.tf
└── versions.tf
```

### Terraformコマンド
| コマンド | 説明 |	備考 | 
| ----    | ---- | ---- |
|terraform init |	Terraformの作業ディレクトリの初期化	| Terraformを実行する際に一番最初に実行 |
|terraform fmt	| terraformのコードのフォーマットを整える | - |
|terraform plan	| 現状のソースコードをもとに実行計画を確認する |	terraform applyの実行前に実行 |
|terraform validate |	構成ファイルの記述が全て正常であることを確認  |	terraform applyの実行前に実行
|terraform apply |	現状のソースコードに従って変更を適用  |	以下のコマンドにて強制的にYesで実行可能 `terraform apply -auto-approve` |
|terraform destroy |	terraformで管理されているリソースを削除 | 以下のコマンドにて強制的にYesで実行可能 `terraform destroy -auto-approve` |
|terraform show	|terraform.stateファイルを元に現在のリソースの状態を参照する |	リソースに変更を加えた際等に確認のために実行 |
