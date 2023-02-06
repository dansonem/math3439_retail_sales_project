rm(list=ls())
library(dplyr)
library(tidyverse)


df = read.csv('merged_datasets_adj_bins.csv')
head(df)
model <- aov(Weekly_Sales_Adjusted ~ IsHoliday * bin_unemp * bin_fuel, data=df)

#view summary of three-way ANOVA
summary(model)

'
Original: (sales not adjusted)
                                    Df    Sum Sq   Mean Sq F value   Pr(>F)    
IsHoliday                            1 5.451e+11 5.451e+11   1.684   0.1945    
Unemployment                         1 5.258e+12 5.258e+12  16.246 5.76e-05 ***
Fuel_Price                           1 2.269e+13 2.269e+13  70.090  < 2e-16 ***
IsHoliday:Unemployment               1 5.164e+08 5.164e+08   0.002   0.9681    
IsHoliday:Fuel_Price                 1 1.265e+12 1.265e+12   3.909   0.0482 *  
Unemployment:Fuel_Price              1 5.781e+12 5.781e+12  17.861 2.48e-05 ***
IsHoliday:Unemployment:Fuel_Price    1 1.974e+11 1.974e+11   0.610   0.4349    
Residuals                         2152 6.965e+14 3.237e+11                     
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
'

'
For adjusted sales:
                                    Df    Sum Sq   Mean Sq F value   Pr(>F)    
IsHoliday                            1 0.000e+00 0.000e+00   0.000    1.000    
Unemployment                         1 5.228e+12 5.228e+12  16.905 4.08e-05 ***
Fuel_Price                           1 9.972e+12 9.972e+12  32.244 1.54e-08 ***
IsHoliday:Unemployment               1 1.868e+07 1.868e+07   0.000    0.994    
IsHoliday:Fuel_Price                 1 1.901e+11 1.901e+11   0.615    0.433    
Unemployment:Fuel_Price              1 5.580e+12 5.580e+12  18.044 2.25e-05 ***
IsHoliday:Unemployment:Fuel_Price    1 9.042e+10 9.042e+10   0.292    0.589    
Residuals                         2152 6.655e+14 3.093e+11                     
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
'
'
Categorized:
                               Df    Sum Sq   Mean Sq F value Pr(>F)
IsHoliday                       1 0.000e+00 0.000e+00   0.000  1.000
bin_unemp                       7 9.261e+13 1.323e+13  47.922 <2e-16
bin_fuel                        9 9.617e+12 1.069e+12   3.870  7e-05
IsHoliday:bin_unemp             7 2.834e+10 4.049e+09   0.015  1.000
IsHoliday:bin_fuel              7 7.665e+11 1.095e+11   0.397  0.905
bin_unemp:bin_fuel             31 9.327e+12 3.009e+11   1.090  0.336
IsHoliday:bin_unemp:bin_fuel   22 1.382e+12 6.281e+10   0.228  1.000
Residuals                    2075 5.729e+14 2.761e+11               
                                
IsHoliday                       
bin_unemp                    ***
bin_fuel                     ***
IsHoliday:bin_unemp             
IsHoliday:bin_fuel              
bin_unemp:bin_fuel              
IsHoliday:bin_unemp:bin_fuel    
Residuals                       
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
'