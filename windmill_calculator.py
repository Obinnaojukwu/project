def celsius_to_fah(celsius):
    fahrenheit = (celsius * 9/5) + 32
    return fahrenheit
def cal_wind(temperature, wind_speed):
    wind_chill = 35.74 + (0.6215 * temperature) - 35.75 * (wind_speed ** 0.16) + 0.4275 * temperature * (wind_speed ** 0.16)
    return wind_chill
def calcutor():
    temp = float(input('What is the temperature ?'))
    scale = input('Fehrenheit or Celsius (F/C) ?')
    if scale.upper() == 'C':
        temperature = temp
    elif scale.upper() == 'F':
        temperature = (temp - 32) * 5/9
    else:
        print('Scale invalid. Enter F or C.')
        return
    for speed in range(5, 61):
        temp_feh = celsius_to_fah(temperature)
        wind_chill = cal_wind(temperature, speed)
        print(f'At temperature {temperature:.2f} C/ {temperature:.2f}F, and wind speed {speed} mph, the windchill is {wind_chill:.2f}S' )
if __name__ == "__main__":
    calcutor()                     