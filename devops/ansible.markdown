ansible
===
- is a server management, orchestration and deployment tool
- agent-less (ssh and python required on servers)
- pushes configurations to servers
- configuration is written in YAML
- set of tasks in playbooks run on a set of hosts

Host Inventory
Playbooks
Plays
Tasks & Modules
Handlers
Variables, Templates & Facts
Roles

host inventory
---
- list of hostnames or ip addresses you want to manage with ansible
- can be organized into groups

playbook
---
- a script of tasks to run against a set of hosts
- playbooks contain plays
- plays contain tasks
- tasks call modules

plays
---
- plays are a set of tasks

tasks & modules
---
- tasks call modules to alter configuration on a server
- changes on idempotent

handlers
---
- task that are run after certain triggers

facts
---
- facts are information collected about each server

roles
---
- group tasks
