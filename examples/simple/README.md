# Examples - Simple

This is a simple example which shows the most basic usage.

## Usage

### Jsonnet

```bash
$ jsonnet -m . main.jsonnet
```

### Bazel

```bash
$ bazel build //examples/simple:simple
```

## Output

**foo.json**

```json
{
   "bar": "baz"
}
```
