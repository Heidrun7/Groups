# Groups Package

This is an R pacakge that contains functions for operations such as to divide a population into different group sizes. It also contains helper functions that can be used for different purposes.

# Usage
Install the package:

`devtools::install_github('davidissamattos/ESEData')`

Load the package:

`library(ESEData)`

Use the functions:

`randomGroups <- randAssign(144, 12, 20, 4, 12)
randomGroups`

Example output:

`12 20  4 20  4  4  4  4 12 12 12 20  4  4  4  4`

List of functions:
1. randAssign(totalPopulation, groupSize1, ...) - Randomly assign groups to a given population
2. cutListByElement(list, element) - Cut all elements from a list, up to the given element and return the rest
3. randElem(list) - Get a list and choose a random element from it