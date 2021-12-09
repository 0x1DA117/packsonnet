# Examples - Simple with Config

This example shows the usage of the `config` argument of a package to
parameterize the output.

## Usage

### Jsonnet

```bash
$ jsonnet -m . main.jsonnet
```

### Bazel

```bash
$ bazel build //examples/simple_with_config:simple_with_config
```

## Output

**foo.json**

```json
{
   "bar": "cux"
}
```
