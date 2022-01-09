# Variables for re-use in terraform code

variable "env_name" {
  description = "Value for the env tag used in all resources for this terraform lab"
  type        = string
  default     = "TESTENV"
}

/*
# The following variable has been moved to variables-private.tf which is .gitignore to preserve sensitive info
variable "mike_home_IP" {
  description = "Value for my home IP"
  type        = string
  default     = "#.#.#.#/32"
}
*/