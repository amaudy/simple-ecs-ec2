data "aws_ami" "latest_ami" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  # Optionally filter by name pattern, if the AMIs follow a naming convention
  filter {
    name   = "name"
    values = ["al2023-ami-ecs-hvm-*"]
  }
}

