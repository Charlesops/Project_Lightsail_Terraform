# Create a new GitLab Lightsail Instance
resource "aws_lightsail_instance" "custom" {
  name              = "myserver"
  availability_zone = "us-east-1b"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_3_0"
  user_data         = <<EOF
#!/bin/bash
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
EOF

# key_pair_name ="lagrossecle"

  tags = {
    Team = "Devops"
    env = "dev"
    create_by = "terraform"
  }
}