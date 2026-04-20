#!/bin/bash
icons=(
  "docker/docker-original"
  "kubernetes/kubernetes-plain"
  "amazonwebservices/amazonwebservices-original-wordmark"
  "googlecloud/googlecloud-original"
  "terraform/terraform-original"
  "ansible/ansible-original"
  "linux/linux-original"
  "jenkins/jenkins-original"
  "github/github-original"
  "gitlab/gitlab-original"
  "prometheus/prometheus-original"
  "grafana/grafana-original"
  "elasticsearch/elasticsearch-original"
  "php/php-original"
  "laravel/laravel-original"
  "mysql/mysql-original"
  "postgresql/postgresql-original"
  "redis/redis-original"
  "git/git-original"
  "nginx/nginx-original"
  "bash/bash-original"
  "python/python-original"
  "vuejs/vuejs-original"
  "debian/debian-original"
)

for icon in "${icons[@]}"; do
  status=$(curl -s -I "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/$icon.svg" | head -n 1 | awk '{print $2}')
  echo "$icon: $status"
done
