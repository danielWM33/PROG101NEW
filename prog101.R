##########################################################################
## Driver: (Name) (GitHub Handle)                                       ##
## Navigator: (Name) (GitHub Handle)                                    ##
## Date: (YYYY-MM-DD)                                                   ##
##########################################################################

library(marinecs100b)


# Guiding questions -------------------------------------------------------

# What does KEFJ stand for?
#KEFJ stands for Kenai Fjords National Park

# How was temperature monitored?
# Temp is monitored through temp loggers placed in a PVC pipe stuck in bedrock/
#boulder 0.5m above mean lower low water gathering data every 60/30 minutes.

# What's the difference between absolute temperature and temperature anomaly?
#Abs Temp is the mean of temperatures without outlier temperatures in the air
#due to its high variability. Temp anomaly are outlier temps

# Begin exploring ---------------------------------------------------------
?kefj
kefj_site
kefj_datetime[900] - kefj_datetime[899]
kefj_*
plot_kefj()

# How many kefj_* vectors are there?
#6 vectors

# How long are they?
# all of them are = 1295038


# What do they represent?
# Site represents the site from it was taken (KEFJ)
# Temperature = temperature in C
# tidelevel = tide level in m
# datetime = time/date of reading
# exposure = type of temperature reading based on the difference between the predicted
# tide level and where the logger was placed

# Link to sketch
  # https://docs.google.com/document/d/10JybwClKPq1gLxcjj8XKmpLWhhXrBDVsBg8bJOTYRkg/edit?usp=sharing

kefj_datetime1 <- kefj_datetime[kefj_site == "Aialik"]
kefj_datetime2 <- kefj_datetime[kefj_site == "Aialik"]
# above code gives reference vectors for documentation

kefj_datetime3 <- kefj_datetime1[2:length(kefj_datetime1)]
# above code defines new vector as the reference vectors excpet the first value
# think of this as shifting down the reference variable by one index

kefj_datetime4 <- kefj_datetime2[1:(length(kefj_datetime1)-1)]
# above code defines new vector as the reference vectors except the last value
# remove last value because we need to make the lengths equal

kefj_datetime5 <- kefj_datetime3 - kefj_datetime4
# gives time diff

table(kefj_datetime5)
#gives the most common values


# Problem decomposition ---------------------------------------------------

which.min(kefj_temperature)
which.max(kefj_temperature)
plot_kefj(kefj_temperature)
plot_kefj(kefj_temperature)
kefj_site[158962]
kefj_site[63809]
kefj_datetime[158962]
kefj_datetime[63809]

# When and where did the hottest and coldest air temperature readings happen?
# Hottest = Aialik, July 3rd 2018 at 1 pm
# Coldest = Aialik, January 27th at 9 pm

# Link to sketch
# https://docs.google.com/document/d/10JybwClKPq1gLxcjj8XKmpLWhhXrBDVsBg8bJOTYRkg/edit?usp=sharing
# Plot the hottest day

hottest_idx <- which.max(kefj_temperature)
# gives the index of the exact time of the highest temperature in data set
hottest_time <- kefj_datetime[hottest_idx]
# gives the exact time of the highest temperature
hottest_site <- kefj_site[hottest_idx]
# gives the site of the highest temperature
hotday_start <- as.POSIXct("2018-07-03 0:00:00", tz = "Etc/GMT+8")
# gives the starting time, of the day, of the highest temperature
hotday_end <- as.POSIXct("2018-07-03 23:59:59", tz = "Etc/GMT+8")
# gives the ending time, of the day, of the highest temperature

hotday_idx <- kefj_site == hottest_site & kefj_datetime >= hotday_start & kefj_datetime <= hotday_end
# gives the index (in TRUE rather than FALSE), of when the hot day is in session
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_datetime
# gives the times of when the hot day is in session
hotday_temperature <- kefj_temperature[hotday_idx]
hotday_temperature
# gives the temp of when the hot day is in session
hotday_exposure <- kefj_exposure[hotday_idx]
hotday_exposure
# gives the exposure of when the hot day is in session


# Plot the data
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)
# Plots the hottest day from start to finish (x-axis), temperature (y-axis), and
# the exposure in the colored background


# Repeat for the coldest day
# Same code except for finding the min temperature
coldest_idx <- which.min(kefj_temperature)
coldest_time <- kefj_datetime[coldest_idx]
coldest_time
coldest_site <- kefj_site[coldest_idx]
coldday_start <- as.POSIXct("2013-01-27 0:00:00", tz = "Etc/GMT+8")
coldday_end <- as.POSIXct("2013-01-27 23:59:59", tz = "Etc/GMT+8")

coldday_idx <- kefj_site == coldest_site & kefj_datetime >= coldday_start & kefj_datetime <= coldday_end
coldday_idx
coldday_datetime <- kefj_datetime[coldday_idx]
coldday_temperature <- kefj_temperature[coldday_idx]
coldday_exposure <- kefj_exposure[coldday_idx]

# Plot the data
plot_kefj(coldday_datetime, coldday_temperature, coldday_exposure)

# What patterns do you notice in time, temperature, and exposure? Do those
# patterns match your intuition, or do they differ?

# The patterns match my intuition, they both have the peaks of their extremes when
# exposed to air, since water helps regulate temperature and keep it temperate
# due to the high heat capacity of water. Also, the highest temperature occured
# when the highest temps are usually recorded, the coldest was at night when the
# coldest temps are recorded.

# How did Traiger et al. define extreme temperature exposure?
# Defined extreme temp exposure by temperatures above 25C and below -4C. They
# did not include those temperatures into their calculations because they're
# variable

# Translate their written description to code and calculate the extreme heat
# exposure for the hottest day.


ExTempExTime <- kefj_site == hottest_site & kefj_datetime >= hotday_start & kefj_datetime <= hotday_end & kefj_temperature > 25
ExTempExTime1 <- kefj_datetime[ExTempExTime]
a <- length(ExTempExTime1) / 2
a

ExColdTempExTime <- kefj_site == coldest_site & kefj_datetime >= coldday_start & kefj_datetime <= coldday_end & kefj_temperature < -4
ExColdTempExTime1 <- kefj_datetime[ExColdTempExTime]
b <- length(ExColdTempExTime1) / 2
b

# Compare your answer to the visualization you made. Does it look right to you?
# Yes, it looks right

# Repeat this process for extreme cold exposure on the coldest day.
# See above

# Putting it together -----------------------------------------------------

# Link to sketch
# https://docs.google.com/document/d/10JybwClKPq1gLxcjj8XKmpLWhhXrBDVsBg8bJOTYRkg/edit?usp=sharing

# Pick one site and one season. What were the extreme heat and cold exposure at
# that site in that season?

ExTempExSznTime <- kefj_site == "Aialik" & kefj_temperature > 25 & kefj_season == "Summer"
ExTempExSznTime2 <- kefj_site == "Aialik" & kefj_temperature < -4 & kefj_season == "Summer"
ExTempExSznTime1 <- kefj_datetime[ExTempExSznTime]
ExTempExSznTime3 <- kefj_datetime[ExTempExSznTime]
c <- length(ExTempExSznTime1) / 2
c1 <- length(ExTempExSznTime3) / 2
c3 <- c1 + c
c3

# Repeat for a different site and a different season.

ExTempExSznColdTime <- kefj_site == "Harris" & kefj_temperature < -4 & kefj_season == "Early winter"
ExTempExSznColdTime2 <- kefj_site == "Harris" & kefj_temperature > 25 & kefj_season == "Early winter"
ExTempExSznColdTime3 <- kefj_datetime[ExTempExSznColdTime2]
ExTempExSznColdTime1 <- kefj_datetime[ExTempExSznColdTime]
d <- length(ExTempExSznColdTime1) / 2
d1 <- length(ExTempExSznColdTime3) / 2
d3 <- d1 + d
d3

# Optional extension: Traiger et al. (2022) also calculated water temperature
# anomalies. Consider how you could do that. Make a sketch showing which vectors
# you would need and how you would use them. Write code to get the temperature
# anomalies for one site in one season in one year.

ExTempExSznColdWaterTime <- kefj_site == "Aialik" & kefj_exposure == "water" & kefj_temperature < -4
ExTempExSznColdWaterTime2 <- kefj_site == "Aialik" & kefj_exposure == "water" & kefj_temperature > 25
table(ExTempExSznColdWaterTime2)
ExTempExSznColdWaterTime3 <- kefj_datetime[ExTempExSznColdWaterTime2]
ExTempExSznColdWaterTime1 <- kefj_datetime[ExTempExSznColdWaterTime]
e <- length(ExTempExSznColdWaterTime1) / 2
e1 <- length(ExTempExSznColdWaterTime3) / 2
e3 <- e1 + e
e3
