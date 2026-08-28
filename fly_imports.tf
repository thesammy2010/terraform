# One-off adoption of the Postgres cluster that already exists on Fly.io.
#
# Import blocks are used rather than `terraform import` because this workspace
# runs remotely in HCP Terraform, where there is no CLI to run the command
# against. Delete this file once the import has been applied and the resources
# are recorded in state.
#
# Read the plan before approving it: `import` and `update` are fine, but any
# `replace`/`destroy` on fly_machine.postgres or fly_volume.pg_data would take
# the database with it.

import {
  to = module.fly_postgres.fly_app.postgres
  id = "thesammy2010"
}

import {
  to = module.fly_postgres.fly_volume.pg_data
  id = "thesammy2010/vol_4qgj85k923wy8m8v"
}

import {
  to = module.fly_postgres.fly_machine.postgres
  id = "thesammy2010/1781979c45d968"
}
