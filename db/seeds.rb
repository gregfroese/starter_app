# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Status.create(name: "Unstarted")
Status.create(name: "In Progress")
Status.create(name: "Blocked")
Status.create(name: "Cancelled")
Status.create(name: "Complete")


