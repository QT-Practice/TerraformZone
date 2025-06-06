variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "default_tags" {
  type = map(string)
  default = {
    "Env"       = "Dev"
    "CreatedBy" = "Terrform"
  }

}