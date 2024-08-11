import csv
year_interest = int(input("Enter the year of interest: "))
max_year = 0
max_life_expectancy = 0
min_year = float('inf')
min_life_expectancy = 0
max_country = ""
min_country = ""
with open("life-expectancy.csv", "r") as file:
    reader = csv.reader(file)
    for row in reader:
        country = row[0]
        year = int(row[2])    
        life_expectancy = float(row[3])
        if life_expectancy > max_life_expectancy:
            max_life_expectancy = life_expectancy
            max_year = year
            max_country = country
        if life_expectancy < min_life_expectancy:
            min_life_expectancy = life_expectancy
            min_year = year
            min_country = country  
              
    print("The overall max life expectancy is :", max_life_expectancy, "from", max_country, "in", max_year)
    print("The overall min life expectancy is :", min_life_expectancy, "from", min_country, "in", min_year )                