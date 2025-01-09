barnicle_density_m2 <- c(2.1,1.9,3.0,4.2)
str(barnicle_density_m2)
site <- c("Point Area", "Point conception", "San Clemente", "San Cat")
region <- c("NorCal", "CenCal", "Socal", "SoCal")
barnicle_density_m2[1]
barnicle_density_m2[4]

site_area_m2 <- c(25, 12, 8, 9)
barncalce_count <- barnicle_density_m2 * site_area_m2
barncalce_count

?paste
paste(region, site)
#Use conditions of one vector to index another
#barnacle density of pt arena

barnicle_density_m2[site == "Point Area"]

#Other conditional operators as well

#Sites that not NorCal
site[region != "NorCal"]

#sites barnacle density morw than avg
site[barnicle_density_m2 > mean(barnicle_density_m2)]

#Use sum to count number of TRUES
