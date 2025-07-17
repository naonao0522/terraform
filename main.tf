module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

module "cloudwatch" {
  source     = "./modules/cloudwatch"
  depends_on = [module.ecs]
}

module "ec2" {
  source         = "./modules/ec2"
  vpc_id         = module.vpc.vpc_id
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
  desired_count               = 1  # 必要に応じて指定
  private_subnets_id          = module.vpc.private_subnets_id
  ecs_target_group_arn        = module.ec2.ecs_target_group_arn
  depends_on                  = [module.ec2]
}