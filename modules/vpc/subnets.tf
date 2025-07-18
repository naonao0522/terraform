# サブネットの定義

resource "aws_subnet" "public_a_alb" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1a"  
  map_public_ip_on_launch = true
  
  tags = {
    Name = "${var.project}-${var.env}-pub-a-alb"
  }
}
resource "aws_subnet" "public_c_alb" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1c"  
  map_public_ip_on_launch = true
  
  tags = {
    Name = "${var.project}-${var.env}-pub-c-alb"
  }
}

resource "aws_subnet" "public_d_alb" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-northeast-1d"
  map_public_ip_on_launch = false
  
  tags = {
    Name = "${var.project}-${var.env}-pub-d-alb"
  }
}
resource "aws_subnet" "public_a_ng" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "ap-northeast-1a" 
  map_public_ip_on_launch = false
  
  tags = {
    Name = "${var.project}-${var.env}-pub-a-ng"
  }
}


resource "aws_subnet" "private_a_ecs" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.5.0/24"
  availability_zone       = "ap-northeast-1a" 
  map_public_ip_on_launch = false
  
  tags = {
    Name = "${var.project}-${var.env}-pri-a-ecs"
  }
}

resource "aws_subnet" "private_c_ecs" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.6.0/24"
  availability_zone       = "ap-northeast-1c" 
  map_public_ip_on_launch = false
  
  tags = {
    Name = "${var.project}-${var.env}-pri-c-ecs"
  }
}

resource "aws_subnet" "private_a_rds" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.7.0/24"
  availability_zone       = "ap-northeast-1a" 
  map_public_ip_on_launch = false
  
  tags = {
    Name = "${var.project}-${var.env}-private-1a-rds"
  }
}

resource "aws_subnet" "private_c_rds" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.8.0/24"
  availability_zone       = "ap-northeast-1c" 
  map_public_ip_on_launch = false
  
  tags = {
    Name = "${var.project}-${var.env}-private-1c-rds"
  }
}

resource "aws_subnet" "private_d_rds" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.9.0/24"
  availability_zone       = "ap-northeast-1d" 
  map_public_ip_on_launch = false
  
  tags = {
    Name = "${var.project}-${var.env}-private-1d-rds"
  }
}



