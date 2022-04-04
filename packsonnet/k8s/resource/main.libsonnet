local getKindIndex(kind, order) =
  local indexes = std.find(kind, order);
  assert std.length(indexes) > 0 : std.format('Kind %s not found in order', kind);
  indexes[0];

{
  kindOrder: {
    default:: [
      'Namespace',
      'NetworkPolicy',
      'ResourceQuota',
      'LimitRange',
      'PodSecurityPolicy',
      'PodDisruptionBudget',
      'ServiceAccount',
      'Secret',
      'ConfigMap',
      'StorageClass',
      'PersistentVolume',
      'PersistentVolumeClaim',
      'CustomResourceDefinition',
      'ClusterRole',
      'ClusterRoleBinding',
      'Role',
      'RoleBinding',
      'Service',
      'DaemonSet',
      'Pod',
      'ReplicationController',
      'ReplicaSet',
      'Deployment',
      'HorizontalPodAutoscaler',
      'StatefulSet',
      'Job',
      'CronJob',
      'IngressClass',
      'Ingress',
      'APIService',
    ],

    withKindsAtPosition(position, kinds, baseOrder):: std.flattenArrays([
      baseOrder[0:position:1],
      kinds,
      baseOrder[position::1],
    ]),

    withKindsAfter(after, kinds, baseOrder)::
      local order = std.uniq(baseOrder);
      local newKinds = if std.isString(kinds) then [kinds] else kinds;
      local index = getKindIndex(after, order) + 1;

      self.withKindsAtPosition(index, newKinds, baseOrder),

    withKindsBefore(after, kinds, baseOrder)::
      local order = std.uniq(baseOrder);
      local newKinds = if std.isString(kinds) then [kinds] else kinds;
      local index = getKindIndex(after, baseOrder);

      self.withKindsAtPosition(index, newKinds, order),
  },

  newKindBasedSortFunc(order=$.kindOrder.default)::
    function(resources)
      std.sort(
        resources,
        keyF=function(res)
          local idxs = std.find(res.kind, order);
          if std.length(idxs) > 0 then
            // Use the index of the first match.
            idxs[0]
          else
            // Put at the end of the list.
            99
      )
    ),
}
