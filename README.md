Spoiler: Python is faster when rename 10 files+, since the weight of the overhead in Python gets lower.
A likely explanation is that Bash forks itself to execute `mv` every single time, while python does all the operations in a single process.
