output "password" {
  value       = random_password.password.result
  description = "Randomly generated password result."

  sensitive = true
}