import csv
year_interest = int(input("Enter the year of interest: "))
max_year = 0
max_life_expectancy = float('inf')
min_year = 0
min_life_expectancy = 0
country_with_highest_values =""
country_with_lowest_value =""
total_life_expectancy = 0
num_countries = 0
with open("life-expectancy.csv", "r") as file:
    reader = csv.reader(file)
    for row in reader:
        year = int(row[2])
        life_expectancy = float(row[3])
        country = row[0]
        if year > max_year :
            max_year = year
            max_life_expectancy = life_expectancy
            country_with_highest_values = country
        elif year == max_year and life_expectancy > max_life_expectancy:
            max_life_expectancy = life_expectancy
            country_with_highest_values = country
        if year < min_year:
            min_year = year
            min_life_expectancy = life_expectancy
            country_with_lowest_value = country
        elif year == min_year and life_expectancy < min_life_expectancy:
            min_life_expectancy = life_expectancy
            country_with_lowest_value = country
print("The overall max life expectancy is :", max_life_expectancy, "from", country_with_highest_values, "in", max_year)
print("The overall min life expectancy is :", min_life_expectancy, "from", country_with_lowest_value, "in", min_year )
with open("life-expectancy.csv", "r") as file:
    reader = csv.reader(file)
    for row in reader:
        year = int(row[2])
        life_expectancy = float(row[3])
        country = row[0]
        if year == year_interest:
            total_life_expectancy += life_expectancy
            num_countries += 1
    average_life_expectancy = total_life_expectancy / num_countries                            
    print('for the year', year_interest, ':')
    print("The average life expectancy across all counties was ",average_life_expectancy)
    print("The max life expectancy was in ", country_with_highest_values, "with", max_life_expectancy)
    print("The min life expectancy was in ",country_with_lowest_value, "with",min_life_expectancy )