# Accumulators
- To accumulate a variable across the cluster
- Write-only on nodes

## Example
```sh
total = sc.accumulator(0)

def accumulate(x):
	total.add(x)

sc.parallelize([1, 2, 3, 4]).foreach(accumulate)
accum.value
```