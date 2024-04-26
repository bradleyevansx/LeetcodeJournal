#!/bin/zsh

# Check if no arguments are provided
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <function_name>"
    exit 1
fi

# List of major topics
topics=("array" "string" "linkedList" "stack" "queue" "tree" "heap/priorityQueue" "graph" "hashTable/hashMap" "dynamicProgramming" "greedyAlgorithms" "backtracking" "bitManipulation" "TwoPointers" "binarySearch" "divideAndConquer" "trie" "segmentTree/fenwickTree")

# Prompt user to select a topic
echo "Select a topic:"
select topic in "${topics[@]}"; do
    if [[ -n $topic ]]; then
        break
    else
        echo "Invalid selection. Please try again."
    fi
done

# Prepare function name
function_name=$1

leetcodeDir="/Users/bradleyevans/Documents/leetCode/"

# Directory for the selected topic
directory="$leetcodeDir$topic"

# Create directory if it doesn't exist
mkdir -p "$directory"

# Create the Python file with the provided function name in the selected directory
python_file="$directory/$function_name.py"
cat > "$python_file" <<EOF
from collections import deque
class Solution:
    def $function_name(self):
        pass

sol = Solution()

req = []

print(sol.$function_name(req))

#Time Complexity:

#Space Complexity:

#Trick:

#Ease:

EOF
code "$leetcodeDir"

code "$directory/$function_name.py"

echo "Python file created: $python_file"
