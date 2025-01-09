#Create vectors with the c() short for combine
barnicle_density_m2 <- c(2.1,1.9,3.0,4.2)
str(barnicle_density_m2)
site <- c("Point Area", "Point conception", "San Clemente", "San Cat")
region <- c("NorCal", "CenCal", "Socal", "SoCal")
barnicle_density_m2[1]
barnicle_density_m2[4]

#Can also pull of silces using : operator
barnicle_density_m2[1:2]
str(barnicle_density_m2[1:2])
site[3:2]

#pull out non-contigous indices with c()
barnicle_density_m2[c(1,3)]

#Output vector sizes

#n -> n... this is a very slow process going one by one
sqrt(barnicle_density_m2)
toupper(site)

#n -> 1
length(barnicle_density_m2)
max(barnicle_density_m2)
min(barnicle_density_m2)

#n -> m (otro)
unique(region)
