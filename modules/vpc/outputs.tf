output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "cidr_block" {
  value = aws_vpc.vpc.cidr_block
}

output "subnet_id" {
  value = aws_subnet.private_a_ecs.id
}

output "alb_subnet_ids" {
  description = "Subnets for ALB (Public subnets in AZ a, c, d)"
  value = [
    aws_subnet.public_a_alb.id,
    aws_subnet.public_c_alb.id,
    aws_subnet.public_d_alb.id
  ]
}

output "rds_subnet_ids" {
  description = "Subnets for RDS (Private subnets in AZ a, c, d)"
  value = [
    aws_subnet.private_a_rds.id,
    aws_subnet.private_c_rds.id,
    aws_subnet.private_d_rds.id
  ]
}

output "private_subnets_id" {
   value = [
       aws_subnet.private_a_ecs.id,
       aws_subnet.private_c_ecs.id
   ]
}

# output "public_a_subnet_id" {
#   value = aws_subnet.public_a_alb.id
# }

# # プライベートサブネットのリソースがあると仮定して出力する
# output "private_subnets_id" {
#   description = "List of private subnet IDs"
#   value       = aws_subnet.private_a_ecs.id
# }


