# Broadcast variables
- example: lookup table or configuration dictionary
- large variable used in across nodes
- transfer just once per executor
- efficient peer-to-peer transfer

## Example

```sh
config = sc.broadcast({"order":3, "filter":True})
config.value
```