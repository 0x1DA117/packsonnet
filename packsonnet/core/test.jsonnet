local packsonnet = import 'main.libsonnet';
local package = packsonnet.package;

{
  simple: package.new(function(config) [
    {
      name: 'foo.json',
      content: {
        bar: 'baz',
      },
    },
  ])(),
  multiple_files: package.new(function(config) [
    {
      name: 'foo.json',
      content: {
        bar: 'baz',
      },
    },
    {
      name: 'bar.json',
      content: {
        baz: 'cux',
      },
    },
  ])(),
  with_config: package.new(
    function(config) [
      {
        name: 'foo.json',
        content: {
          bar: config.value,
        },
      },
    ],
    defaultConfig={value: 'one'},
  )({value: 'two'}),
  with_indexed_names_default: package.new(
    function(config) [
      {
        name: 'foo.json',
        content: {
          bar: 'baz',
        },
      },
      {
        name: 'bar.json',
        content: {
          baz: 'cux',
        },
      },
    ],
    nameFunc=packsonnet.file.newIndexedNameFunc()
  )(),
  with_indexed_names_format: package.new(
    function(config) [
      {
        name: 'foo.json',
        content: {
          bar: 'baz',
        },
      },
      {
        name: 'bar.json',
        content: {
          baz: 'cux',
        },
      },
    ],
    nameFunc=packsonnet.file.newIndexedNameFunc(format='%03d_%s')
  )(),
  with_indexed_names_start: package.new(
    function(config) [
      {
        name: 'foo.json',
        content: {
          bar: 'baz',
        },
      },
      {
        name: 'bar.json',
        content: {
          baz: 'cux',
        },
      },
    ],
    nameFunc=packsonnet.file.newIndexedNameFunc(start=10)
  )(),
  with_content_func: package.new(
    function(config) [
      {
        name: 'foo.json',
        my_content: {
          bar: 'baz',
        },
      },
    ],
    contentFunc=function(resource) resource.my_content
  )(),
  with_sort_func: package.new(
    function(config) [
      {
        name: 'foo.json',
        content: {
          bar: 'baz',
        },
      },
      {
        name: 'bar.json',
        content: {
          baz: 'cux',
        },
      },
    ],
    sortFunc=function(resources)
      std.sort(resources, keyF=function(res) res.name)
  )(),
  with_name_func_override: package.new(function(config) [
    {
      name: 'foo.json',
      content: {
        bar: 'baz',
      },
    },
  ])(packsonnetConfig={
    nameFuncOverride: function(index, resource) 'oof.json',
  }),
  with_sort_func_override: package.new(function(config) [
    {
      name: 'c.json',
      content: {
        foo: 'bar',
      },
    },
    {
      name: 'a.json',
      content: {
        baz: 'cux',
      },
    },
  ])(packsonnetConfig={
    sortFuncOverride:
      function(resources) std.sort(resources, keyF=function(res) res.name)
  }),
}
