module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  alb_subnet_ids = module.vpc.alb_subnet_ids
}

module "iam" {
  source     = "./modules/iam"
  name       = "aws_iam_role"
  identifier = "ecs_task_execution_role"
}

module "ecs" {
  source                      = "./modules/ecs"
  vpc_id                      = module.vpc.vpc_id
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
  ecs_task_role_arn           = module.iam.ecs_task_role_arn
  desired_count               = 2   # 必要に応じて指定
  subnet_id                   = module.vpc.alb_subnet_ids  # module.ec2の出力を渡す
  ecs_target_group_arn        = module.ec2.ecs_target_group_arn  # module.ec2の出力を渡す
  depends_on                  = [module.ec2]
}