# インターネットゲートウェイの定義

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  
  tags = {
    Name = "${var.project}-${var.env}-igw"
  }
}