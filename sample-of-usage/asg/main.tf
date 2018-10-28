######
# Launch configuration and autoscaling group
######
module "launch_configuration" {
  source = "../../modules/asg"

  name = "application-asg"

  # Launch configuration
  lc_name = "applicattion-lc"

  image_id                     = "ami-0dcc86ea551840962"
  instance_type                = "t2.micro"
  #user_data                    = "${data.template_file.user_data.rendered}"
  security_groups              = ["${data.terraform_remote_state.sg.app_id}"]
  load_balancers               = ["${module.elb.this_elb_id}"]
  key_name                     = "cs-keypair"
  associate_public_ip_address  = false
  recreate_asg_when_lc_changes = true

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "50"
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size           = "50"
      volume_type           = "gp2"
      delete_on_termination = true
    },
  ]

  # Auto scaling group
  asg_name                  = "application-asg"
  vpc_zone_identifier       = ["${data.terraform_remote_state.vpc.private_subnet_a}", "${data.terraform_remote_state.vpc.private_subnet_b}"]
  health_check_type         = "EC2"
  min_size                  = 0
  max_size                  = 1
  desired_capacity          = 1
  wait_for_capacity_timeout = 0

  tags = [
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "Main Application"
      propagate_at_launch = true
    },
  ]

  tags_as_map = {
    extra_tag1 = "extra_value1"
    extra_tag2 = "extra_value2"
  }
}

######
# ELB
######
module "elb" {
  source = "../../modules/elb"

  name = "application-elb"

  subnets         = ["${data.terraform_remote_state.vpc.private_subnet_a}", "${data.terraform_remote_state.vpc.private_subnet_b}"]
  security_groups = ["${data.terraform_remote_state.sg.app_id}"]
  internal        = false

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "HTTP"
      lb_port           = "80"
      lb_protocol       = "HTTP"
    },
  ]

  health_check = [
    {
      target              = "HTTP:80/"
      interval            = 8
      healthy_threshold   = 2
      unhealthy_threshold = 2
      timeout             = 5
    },
  ]

  tags = {
    Environment = "dev"
  }
}