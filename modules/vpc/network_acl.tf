# resource "aws_network_acl" "main" {
#   vpc_id       = aws_vpc.vpc.id

#   // インバウンドルールの設定
#   ingress {
#     rule_no    = 100        // ルール番号
#     action     = "allow"    // 許可するアクション
#     from_port  = 0          // 開始ポート（0は全てのポート）
#     to_port    = 0          // 終了ポート（0は全てのポート）
#     protocol   = "-1"       // プロトコル（-1は全てのプロトコル）
#     cidr_block = "0.0.0.0/0"// 許可するIP範囲
#   }

#   // アウトバウンドルールの設定
#   egress {
#     rule_no    = 100        // ルール番号
#     action     = "allow"    // 許可するアクション
#     from_port  = 0          // 開始ポート（0は全てのポート）
#     to_port    = 0          // 終了ポート（0は全てのポート）
#     protocol   = "-1"       // プロトコル（-1は全てのプロトコル）
#     cidr_block = "0.0.0.0/0"// 許可するIP範囲
#   }

#   tags = {
#     Name = "${var.project}-${var.env}-networkacl"
#   }
# }