locals {
  port = "${var.default_ports[var.engine]}"
}

variable "default_db_parameters" {
  default = {
    mysql = [
      {
        name  = "slow_query_log"
        value = "1"
      },
      {
        name  = "long_query_time"
        value = "1"
      },
      {
        name  = "general_log"
        value = "0"
      },
      {
        name  = "log_output"
        value = "FILE"
      },
    ]

    postgres = []
    oracle   = []
  }
}

variable "default_ports" {
  default = {
    mysql    = "3306"
    postgres = "5432"
    oracle   = "1521"
  }
}

locals {
  port = "${var.default_ports[var.engine]}"
}
