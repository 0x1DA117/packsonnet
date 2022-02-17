local pk8s = import 'main.libsonnet';

{
  kind_based_sorting_default: pk8s.package.new(
    function(config) [
      {kind: 'Deployment', metadata: {name: 'foo'}},
      {kind: 'Secret', metadata: {name: 'bar'}},
      {kind: 'ServiceAccount', metadata: {name: 'baz'}},
    ],
    sortFunc=pk8s.resource.newKindBasedSortFunc()
  )(),
}
