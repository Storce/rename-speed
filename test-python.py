import os

files = os.listdir('.')

for file_name in files:
    os.rename(file_name, f"{file_name}_python")

