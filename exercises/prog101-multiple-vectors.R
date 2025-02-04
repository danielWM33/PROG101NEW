# What does the following code do?
# Tip: `%%` is the remainder operator. E.g. 10 %% 4 is 2.
instrument_deployed_hm <- c(730, 915, 1345)
#above are times without the colon
instrument_deployed_h <- floor(instrument_deployed_hm) / 100
#above gets strictly the hours by rounding down
instrument_deployed_hdec <- (instrument_deployed_hm %% 100) / 60
#above gets minutes through the mod, then divides by 60 to get minutes
instrument_deployed <- instrument_deployed_h + instrument_deployed_hdec
#above puts this into variable with hour and decimal


# Based on the code above, calculate the duration of instrument deployments
# using the instrument recovery times below. What units do the durations have?
instrument_recovered_hm <- c(1600, 1920, 2015)
???
?c()
instrument_recovered <- floor(instrument_recovered_hm) / 100
instrument_recovered_hdec <- (instrument_recovered_hm %% 100) / 60
instrument_recovered <- instrument_recovered + instrument_recovered_hdec


instrument_durations <- instrument_recovered - instrument_deployed
instrument_durations[2] > instrument_durations[1] & instrument_durations[2] > instrument_durations[3]


# Which site had the longest duration? Use conditional indexing.
site <- c("Santa Cruz", "Santa Rosa", "San Miguel")
site[2]

#Santa Rosa!
