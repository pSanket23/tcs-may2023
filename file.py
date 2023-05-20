# Function to print Numbers 1 to 100 and write to file

def write_to_file():
    file = open("numbers.txt", "w")
    for i in range(1, 101):
        file.write(str(i) + "\n")
    file.close()

write_to_file()

