## Parquet

- Column-oriented binary file format
- Uses the record shredding and assembly algorithm described in the Dremel paper
- Each data file contains the values for a set of rows
- Efficient in terms of disk I/O when specific columns need to be queried