####################
# Required variables
####################

variable "name" {
  description = "The service name."
  type        = string
}

variable "cluster" {
  description = "The cluster name or ARN."
  type        = string
}

variable "container_definitions" {
  description = "Container definitions raw json string or rendered template. Not required if `create_task_definition` is `false`."
  type        = string
}

variable "cpu" {
  description = "CPU unit for this task"
  type        = number
}

variable "memory" {
  description = "Memory for this task"
  type        = number
}

variable "vpc_subnets" {
  description = "VPC Subnets where the tasks should live in"
  type        = list(string)
}

variable "security_groups" {
  description = "Security Groups to apply for the task"
  type        = list(string)
}

#########
# Options
#########

#############
# IAM Section
#############

variable "iam_lb_role" {
  description = "IAM Role ARN to use to attach service to Load Balancer. This parameter is required if you are using a load balancer with your service, but only if your task definition does not use the awsvpc network mode. If using awsvpc network mode, do not specify this role. If your account has already created the Amazon ECS service-linked role, that role is used by default for your service unless you specify a role here."
  default     = null
  type        = string
}

variable "iam_task_role" {
  description = "IAM Role for task to use to access AWS services (dynamo, s3, etc.)"
  default     = null
  type        = string
}

variable "iam_daemon_role" {
  description = "IAM Role for ECS Agent and Docker Daemon to use (ECR, etc.). Required if specifying `repositoryCredentials` in container configuration."
  default     = null
  type        = string
}

###################
# Optional settings
###################

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running. Defaults to 0. Do not specify if using the `DAEMON` scheduling strategy."
  default     = null
  type        = number
}

variable "ignore_desired_count_changes" {
  description = "Ignores any changes to `desired_count` parameter after apply. Note updating this value will destroy the existing service and recreate it."
  default     = false
  type        = bool
}

variable "assign_public_ip" {
  description = "Assign public IP to the ENI"
  default     = false
  type        = bool
}

variable "elb_name" {
  description = "Name of ELB (Classic ELB) to associate with the service"
  default     = null
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the Application Load Balancer / Network Load Balancer target group"
  default     = null
  type        = string
}

variable "container_name" {
  description = "Container name to register to Load Balancer"
  default     = null
  type        = string
}

variable "container_port" {
  description = "The container port, must match the container exposed port"
  default     = null
  type        = string
}

variable "health_check_grace_period_seconds" {
  description = "Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647. Only valid for services configured to use load balancers."
  default     = null
  type        = number
}

variable "deployment_minimum_healthy_percent" {
  description = "lower limit (% of `desired_count`) of # of running tasks during a deployment"
  default     = 100
  type        = number
}

variable "deployment_maximum_percent" {
  description = "upper limit (% of `desired_count`) of # of running tasks during a deployment. Do not fill when using `DAEMON` scheduling strategy."
  default     = null
  type        = number
}

variable "platform_version" {
  description = "The platform version on which to run your service. Defaults to `LATEST`. [AWS Docs](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html)"
  default     = null
  type        = string
}

variable "proxy_configuration" {
  description = "The proxy configuration details for the App Mesh proxy. Defined as map argument. [Terraform Docs](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#proxy-configuration-arguments)"
  default     = null
}

variable "service_registry" {
  description = "Map of a service discovery registries for the service. Consists of `registry_arn`, `port`(optional), `container_port`(optional), `container_port`(optional). [Terraform Docs](https://www.terraform.io/docs/providers/aws/r/ecs_service.html#service_registries)"
  default     = null
}

variable "volume_configurations" {
  description = "Volume Block Arguments for Task Definition. List of map. Note that `docker_volume_configuration` should be specified as map argument instead of block. [Terraform Docs](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#volume-block-arguments)"
  default     = []
  type        = list(any)
}

variable "tags" {
  description = "Key-value mapping of resource tags"
  default     = {}
  type        = map(string)
}
