# The machine is dropped from state without being destroyed.
#
# stategraph/fly cannot reconcile a fly_machine at all: Update acquires a lease
# (machine_resource.go:480) and then calls UpdateMachine without passing the
# nonce (pkg/apiclient/machines.go:28), so Fly rejects the provider's own
# request with a 409. Every published version, 0.2.0 through the final 0.2.4,
# has this. The importer also never populates cordoned, desired_status or
# skip_launch, so the machine planned a permanent diff that could never apply.
#
# Fly's postgres-flex tooling owns the machine anyway. The app and the volume,
# which is where the data actually lives, remain managed.
#
# Delete this file once it has applied.
removed {
  from = module.fly_postgres.fly_machine.postgres

  lifecycle {
    destroy = false
  }
}
