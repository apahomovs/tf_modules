output "igw_id" {
  value       = length(aws_internet_gateway.igw) > 0 ? aws_internet_gateway.igw[0].id : null
  description = "ID of the Internet Gateway attached to the VPC, or null if not created"
}
