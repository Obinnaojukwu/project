year_interest = int(input("Enter the year of interest: "))
with open("life-expectancy.csv") as expectancy_file:
    next(expectancy_file)
    max_year = 0
    max_life_expectancy = float('inf')
    min_year = 0
    min_life_expectancy = 100000000000
    country_with_highest_values =""
    country_with_lowest_value =""
    total_life_expectancy = 0
    num_countries = 0
    for line in expectancy_file:
        lines = line.strip()
        parts = line.split(",")
        country = parts[0]
        abv = parts[1]
        year = int(parts[2])
        life_expectancy = float(parts[3])
        if year > max_year :
            max_year = year
            max_life_expectancy = life_expectancy
            country_with_highest_values = country
        elif year == max_year and life_expectancy > max_life_expectancy:
            max_life_expectancy = life_expectancy
            country_with_highest_values = country
        if life_expectancy < min_life_expectancy:
            min_year = year
            min_life_expectancy = life_expectancy
            country_with_lowest_value = country   
    print("The overall max life expectancy is :", max_life_expectancy, "from", country_with_highest_values, "in", max_year)
    print("The overall min life expectancy is :", min_life_expectancy, "from", country_with_lowest_value, "in", min_year )
max_life_expectancy = 0
min_life_expectancy = float('inf')
country_with_highest_values =""
country_with_lowest_value =""
total_life_expectancy = 0
num_countries = 0  
life_exp = []       
with open("life-expectancy.csv") as expectancy_file:
    next(expectancy_file)
    for line in expectancy_file:
        lines = line.strip()
        parts = line.split(",")
        country = parts[0]
        abv = parts[1]
        year = int(parts[2])
        life_expectancy = float(parts[3])
        if year == year_interest:
            life_exp.append(life_expectancy)
if life_exp:
    average_life_expectancy = sum(life_exp) / len(life_exp)
    max_life_expectancy = max(life_exp)
    min_life_expectancy = min(life_exp)
    country_with_highest_values = [country for country, expectancy in zip(parts[0], life_exp) if expectancy == max_life_expectancy]
    country_with_lowest_value = [country for country, expectancy in zip(parts[0], life_exp) if expectancy == min_life_expectancy]                                                  
print('for the year', year_interest, ':')
print("The average life expectancy across all counties was" ,average_life_expectancy)
print("The max life expectancy was in ", country_with_highest_values, "with", max_life_expectancy)
print("The min life expectancy was in ",country_with_lowest_value, "with",min_life_expectancy )