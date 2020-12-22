# Get a list and choose a random element from it
randElem <- function(x) {
  x[sample(1:length(x),1)]
}

# Cut all elements from a list, up to the given element and return the rest
cutListByElement <- function(fullList, element) {
  index <- which(fullList == element)[1] # Get the first instance of the element
  return(fullList[(index+1):length(fullList)])
}


# Randomly assign groups
# First variable is total number of objects to divide into groups (the population)
# Second variable is an array of group sizes
randAssign <- function(totalPopulation, ...) {
  groupSizes <- c()
  listOfGroups <- c()
  if (totalPopulation <= 0) { # Check if totalPopulation is bigger than 0
    return("Total population must be greater than 0!")
  }
  for (i in list(...)) {
    groupSizes <- c(groupSizes, i)
  }
  if ((totalPopulation %% min(groupSizes)) != 0) { # Check if totalPopulation is divisible by smallest group size
    return("Total population must be divisible by the smallest group number")
  }  
    groupSizes <- unique(groupSizes) # Only get one instance of each group size from array
    groupSizes <- sort(groupSizes, decreasing=TRUE) # Sort the array to get the largest size first
    
    while(totalPopulation > 0) {
      newGroup <- randElem(groupSizes) # Get a random group size
      
      if (newGroup > totalPopulation) { # If the given new group is too large, cut all groups larger than it from the list of group sizes
        while(newGroup > totalPopulation) { # Loop and cut until too large elements have been cut away
          groupSizes <- cutListByElement(groupSizes, newGroup)
          newGroup <- randElem(groupSizes)
        }
      }

      totalPopulation <- totalPopulation - newGroup
      listOfGroups <- append(listOfGroups, newGroup)
      
    }
    
  listOfGroups
}

#randomGroups <- randAssign(144, 12, 20, 4, 12)
#randomGroups
#sum(randomGroups)
