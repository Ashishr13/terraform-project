resource "github_repository" "terraform-first-repo" {
  name        = "terraform-project"
  description = "resources from terraform"
  auto_init   = true
  visibility  = "private"
}


output "repo-url" {
  value = github_repository.terraform-first-repo.html_url
}