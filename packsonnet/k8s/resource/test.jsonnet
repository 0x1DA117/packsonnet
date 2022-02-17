local resource = import 'main.libsonnet';
local kindOrder = resource.kindOrder;

{
  add_kind_after: kindOrder.withKindsAfter('Deployment', 'Foo', kindOrder.default()),
  add_kind_before: kindOrder.withKindsBefore('Deployment', 'Bar', kindOrder.default()),
  add_kinds_after: kindOrder.withKindsAfter('Deployment', ['Foo', 'Bar'], kindOrder.default()),
  add_kinds_before: kindOrder.withKindsBefore('Deployment', ['Foo', 'Bar'], kindOrder.default()),
}
