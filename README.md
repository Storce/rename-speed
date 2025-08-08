Spoiler: Python is faster when renaming 10 files+, since the weight of the overhead in Python gets lower.

```
┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
└─( on main)──> ./test.sh 5                                                                                                             
Bash took 33 ms.
Python took 60 ms.
Python is slower by 81.00 %

┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
└─()──> ./test.sh 10                                                                                                                     
Bash took 58 ms.
Python took 43 ms.
Bash is slower by 34.00 %

┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
└─()──> ./test.sh 100                                                                                                               
Bash took 526 ms.
Python took 51 ms.
Bash is slower by 931.00 %
```

A likely explanation is that Bash forks itself to execute `mv` every single time, while python does all the operations in a single process.
