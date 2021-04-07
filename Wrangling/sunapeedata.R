library(tidyr)
library(dplyr)
library(tidyverse)
library(lubridate)

setwd("~/Dropbox/sunapee_ensemblr")

hypso <- read.csv('sunapee_hypsography_matrix_0p5m_29Sept2020.csv')
temp <- read.csv('L1_buoy_temp_hourlymean.csv')
full_temp <- read.csv('LMP_L1daily_temp_merge.csv')
met <- read.csv('SunapeeMet_1979_2018EST.csv')
inflow <- read.csv('oneInflow_14Jun19.csv')
man_temp <- read.csv('manual_temperature_210.csv')


hypso <- select(hypso, act_depth_m, area_m2)
colnames(hypso) <- c("Depth_meter", "Area_meterSquared")
hypso2=hypso[order(nrow(hypso):1),]


write_csv(hypso2, "sunapee_hypso.csv")
















temp0 <- select(temp, date, Temp_0m_degC)
temp0.5 <- select(temp, date, Temp_0p5m_degC)
temp1 <- select(temp, date, Temp_1m_degC)
temp1.5 <- select(temp, date, Temp_1p5m_degC)
temp2 <- select(temp, date, Temp_2m_degC)
temp2.5 <- select(temp, date, Temp_2p5m_degC)
temp3 <- select(temp, date, Temp_3m_degC)
temp3.5 <- select(temp, date, Temp_3p5m_degC)
temp4 <- select(temp, date, Temp_4m_degC)
temp5 <- select(temp, date, Temp_5m_degC)
temp6 <- select(temp, date, Temp_6m_degC)
temp7 <- select(temp, date, Temp_7m_degC)
temp8 <- select(temp, date, Temp_8m_degC)
temp9 <- select(temp, date, Temp_9m_degC)
temp10 <- select(temp, date, Temp_10m_degC)
temp11 <- select(temp, date, Temp_11m_degC)
temp12 <- select(temp, date, Temp_12m_degC)
temp13 <- select(temp, date, Temp_13m_degC)


colnames(temp0) <- c("datetime","WaterTemperature_celsius")
colnames(temp0.5) <- c("datetime","WaterTemperature_celsius")
colnames(temp1) <- c("datetime","WaterTemperature_celsius")
colnames(temp1.5) <- c("datetime","WaterTemperature_celsius")
colnames(temp2) <- c("datetime","WaterTemperature_celsius")
colnames(temp2.5) <- c("datetime","WaterTemperature_celsius")
colnames(temp3) <- c("datetime","WaterTemperature_celsius")
colnames(temp3.5) <- c("datetime","WaterTemperature_celsius")
colnames(temp4) <- c("datetime","WaterTemperature_celsius")
colnames(temp5) <- c("datetime","WaterTemperature_celsius")
colnames(temp6) <- c("datetime","WaterTemperature_celsius")
colnames(temp7) <- c("datetime","WaterTemperature_celsius")
colnames(temp8) <- c("datetime","WaterTemperature_celsius")
colnames(temp9) <- c("datetime","WaterTemperature_celsius")
colnames(temp10) <- c("datetime","WaterTemperature_celsius")
colnames(temp11) <- c("datetime","WaterTemperature_celsius")
colnames(temp12) <- c("datetime","WaterTemperature_celsius")
colnames(temp13) <- c("datetime","WaterTemperature_celsius")


temp0$Depth_meter <- 0
temp0.5$Depth_meter <- 0.5
temp1$Depth_meter <- 1
temp1.5$Depth_meter <- 1.5
temp2$Depth_meter <- 2
temp2.5$Depth_meter <- 2.5
temp3$Depth_meter <- 3
temp3.5$Depth_meter <- 3.5
temp4$Depth_meter <- 4
temp5$Depth_meter <- 5
temp6$Depth_meter <- 6
temp7$Depth_meter <- 7
temp8$Depth_meter <- 8
temp9$Depth_meter <- 9
temp10$Depth_meter <- 10
temp11$Depth_meter <- 11
temp12$Depth_meter <- 12
temp13$Depth_meter <- 13










temp0 <- aggregate(temp0, by = list(temp0$datetime), FUN = mean)
temp0.5 <- aggregate(temp0.5, by = list(temp0.5$datetime), FUN = mean)
temp1 <- aggregate(temp1, by = list(temp1$datetime), FUN = mean)
temp1.5 <- aggregate(temp1.5, by = list(temp1.5$datetime), FUN = mean)
temp2 <- aggregate(temp2, by = list(temp2$datetime), FUN = mean)
temp2.5 <- aggregate(temp2.5, by = list(temp2.5$datetime), FUN = mean)
temp3 <- aggregate(temp3, by = list(temp3$datetime), FUN = mean)
temp3.5 <- aggregate(temp3.5, by = list(temp3.5$datetime), FUN = mean)
temp4 <- aggregate(temp4, by = list(temp4$datetime), FUN = mean)
temp5 <- aggregate(temp5, by = list(temp5$datetime), FUN = mean)
temp6 <- aggregate(temp6, by = list(temp6$datetime), FUN = mean)
temp7 <- aggregate(temp7, by = list(temp7$datetime), FUN = mean)
temp8 <- aggregate(temp8, by = list(temp8$datetime), FUN = mean)
temp9 <- aggregate(temp9, by = list(temp9$datetime), FUN = mean)
temp10 <- aggregate(temp10, by = list(temp10$datetime), FUN = mean)
temp11 <- aggregate(temp11, by = list(temp11$datetime), FUN = mean)
temp12 <- aggregate(temp12, by = list(temp12$datetime), FUN = mean)
temp13 <- aggregate(temp13, by = list(temp13$datetime), FUN = mean)

new_temp <- rbind(temp0, temp0.5, temp1, temp1.5, temp2, temp2.5, temp3, temp3.5, temp4, temp5, temp6, temp7, temp8,
              temp9, temp10, temp11, temp12, temp13)
new_temp <- select(new_temp, Group.1, WaterTemperature_celsius, Depth_meter)
colnames(new_temp) <- c("datetime", "Water_Temperature_celsius", "Depth_meter")
new_temp <- select(new_temp, datetime, Depth_meter, Water_Temperature_celsius)
str(new_temp)
?as.POSIXct
new_temp$datetime <- as.POSIXct(new_temp$datetime, format = c("%Y-%m-%d HH:MM:SS"))
str(new_temp)

write.csv(new_temp, "new_temp.csv", row.names = FALSE)


















str(man_temp)
man_temp <- select(man_temp, DateTime, Temp, Depth)
colnames(man_temp) <- c("datetime", "Water_Temperature_celsius", "Depth_meter")
#man_temp$datetime <- as.POSIXct(man_temp$datetime, format = c("%Y-%m-%d"))
#write.csv(man_temp, 'man_temp.csv', row.names = FALSE)

man_temp$time <- c("00:00:00")

met_daily$datetime <- paste(met_daily$datetime, met_daily$time)

man_temp$datetime <- paste(man_temp$datetime, man_temp$time)

man_temp$datetime <- as.character(man_temp$datetime)
#man_temp$datetime <- as.POSIXct(man_temp$datetime, 
#                                    format = "%Y-%m-%d %H:%M:%OS")

man_temp <- select(man_temp, -time)

man_temp <- filter(man_temp, is.na(man_temp$Water_Temperature_celsius) == FALSE)
man_temp <- filter(man_temp, Depth_meter <= 80)

write.csv(man_temp, "manual_temp.csv", row.names = FALSE)

new_man_temp <- read.csv("man_temp.csv")
str(new_man_temp)
new_man_temp$datetime <- as.POSIXct(new_man_temp$datetime)
head(new_man_temp)
str(new_man_temp)

write.csv(new_man_temp, "new_man_temp.csv", row.names = FALSE)

?strptime















?as.POSIXct

met$time <- as.POSIXct(met$time)
met$time <- as.character(met$time)


met$date <- as.POSIXct(met$time, format = c("%Y-%m-%d %H:%M:%OS"))
met_daily <- aggregate(met, by = list(met$date), FUN = mean)

met_daily <- select(met_daily, time, LongWave, ShortWave, AirTemp, RelHum, WindSpeed, Rain)

colnames(met_daily) <- c("datetime", "Longwave_Radiation_Downwelling_wattPerMeterSquared", "Shortwave_Radiation_Downwelling_wattPerMeterSquared", 
                         "Air_Temperature_celsius", "Relative_Humidity_percent", "Ten_Meter_Elevation_Wind_Speed_meterPerSecond", 
                         "Rainfall_millimeterPerDay")
met_daily$Surface_Level_Barometric_Pressure_pascal <- 100000

met_daily$time <- c("00:00:00")

met_daily$datetime <- as.character(met_daily$datetime)

met_daily$datetime <- paste(met_daily$datetime, met_daily$time)

met_daily <- select(met_daily, -time)

write.csv(met_daily, "met_daily.csv", row.names = FALSE)


?as.POSIXct
















inflow <- select(inflow, time, FLOW, TEMP, SALT)

colnames(inflow) <- c("datetime", "Flow_metersCubedPerSecond", "Water_Temperature_celsius", "Salinity_practicalSalinityUnits")

str(inflow)

#inflow$datetime <- as.POSIXct(inflow$datetime, format = "%Y-%m-%d")

met_daily$datetime <- paste(met_daily$datetime, met_daily$time)

inflow$time <- c("00:00:00")

inflow$datetime <- paste(inflow$datetime, inflow$time)

inflow <- select(inflow, -time)

write.csv(inflow, "now_inflow.csv", row.names = FALSE)








