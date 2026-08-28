# terraform
Terraform Code


Used to manage the following resources
- Cloudflare
- Fly.io


Setup
1. Create a file in the root of the repo called `terraform.tfvars` with the following values
```terraform
cloudflare_api_token  = ""
cloudflare_account_id = ""
cloudflare_zone_id    = ""

terraform_cloud_deploy_token = ""
```


## Fly.io

`modules/fly` manages the Postgres cluster running in the `thesammy2010` app: a
single `flyio/postgres-flex` machine in `lhr` with an attached `pg_data` volume.

The cluster is modelled as `fly_app` + `fly_machine` + `fly_volume` rather than
`fly_postgres_cluster`. Two reasons:

- Those three resources are served by the Fly REST API, so they need no `flyctl`
  binary. `fly_postgres_cluster` shells out to `flyctl`, which does not exist on
  HCP Terraform's remote runners, so it could never run in this workspace.
- Every attribute on `fly_postgres_cluster` forces replacement. A drift in
  `volume_size` or `vm_size` would plan a destroy of the database.

The provider is [`stategraph/fly`](https://github.com/stategraph/terraform-provider-fly).
Its repository was archived in August 2026, so it is pinned to `~> 0.2.4` and
should be treated as unmaintained.

### Adopting the existing cluster

`fly_imports.tf` holds `import` blocks for the resources that already exist on
Fly.io. Import blocks are used instead of `terraform import` because this
workspace executes remotely, where there is no CLI to run the command against.

Delete `fly_imports.tf` once the import has been applied.

### Upgrading Postgres

`image` is digest-pinned so an upstream retag does not appear as a diff. Bump the
tag and the digest together, and take a volume snapshot first.
