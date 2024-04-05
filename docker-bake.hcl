target "docker-metadata-action" {
  tags = ["perplexed:local"]
}

target "default" {
  inherits = ["docker-metadata-action"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/arm/v7",
  ]
}

target "artifact" {
  inherits = ["docker-metadata-action"]
  target = "artifact"
  output = ["type=local,dest=./artifact"]
}

target "artifact-linux" {
  inherits = ["artifact"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/arm/v7",
  ]
}

target "release" {
  target = "release"
  output = ["type=local,dest=./release"]
  contexts = {
    artifacts = "./artifact"
  }
}
