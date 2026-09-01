data_import
================
Fiona Messer
2026-08-28

## Load the data

Load the dataframe downloaded from WHO
<https://data.who.int/indicators/i/EF38E6A/EE6F72A>

``` r
alcohol <- read.csv("alcohol_consumption.csv")
summary(alcohol)
```

    ##     IND_ID            IND_CODE           IND_UUID         IND_PER_CODE      
    ##  Length:5405        Length:5405        Length:5405        Length:5405       
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##     DIM_TIME    DIM_TIME_TYPE      DIM_GEO_CODE_M49 DIM_GEO_CODE_TYPE 
    ##  Min.   :2000   Length:5405        Min.   :  1.0    Length:5405       
    ##  1st Qu.:2005   Class :character   1st Qu.:145.0    Class :character  
    ##  Median :2011   Mode  :character   Median :400.0    Mode  :character  
    ##  Mean   :2011                      Mean   :401.9                      
    ##  3rd Qu.:2017                      3rd Qu.:643.0                      
    ##  Max.   :2022                      Max.   :958.0                      
    ##  DIM_PUBLISH_STATE_CODE   IND_NAME         GEO_NAME_SHORT    
    ##  Length:5405            Length:5405        Length:5405       
    ##  Class :character       Class :character   Class :character  
    ##  Mode  :character       Mode  :character   Mode  :character  
    ##                                                              
    ##                                                              
    ##                                                              
    ##    DIM_SEX          RATE_PER_CAPITA_N RATE_PER_CAPITA_NL RATE_PER_CAPITA_NU
    ##  Length:5405        Min.   : 0.000    Min.   : 0.000     Min.   : 0.000    
    ##  Class :character   1st Qu.: 2.039    1st Qu.: 1.319     1st Qu.: 2.915    
    ##  Mode  :character   Median : 4.774    Median : 3.688     Median : 5.910    
    ##                     Mean   : 5.550    Mean   : 4.495     Mean   : 6.683    
    ##                     3rd Qu.: 8.700    3rd Qu.: 7.203     3rd Qu.:10.206    
    ##                     Max.   :19.498    Max.   :16.902     Max.   :22.251

``` r
head(alcohol)
```

    ##                 IND_ID      IND_CODE IND_UUID  IND_PER_CODE DIM_TIME
    ## 1 EE6F72ASA_0000001688 SA_0000001688  EE6F72A SA_0000001688     2003
    ## 2 EE6F72ASA_0000001688 SA_0000001688  EE6F72A SA_0000001688     2003
    ## 3 EE6F72ASA_0000001688 SA_0000001688  EE6F72A SA_0000001688     2003
    ## 4 EE6F72ASA_0000001688 SA_0000001688  EE6F72A SA_0000001688     2003
    ## 5 EE6F72ASA_0000001688 SA_0000001688  EE6F72A SA_0000001688     2003
    ## 6 EE6F72ASA_0000001688 SA_0000001688  EE6F72A SA_0000001688     2003
    ##   DIM_TIME_TYPE DIM_GEO_CODE_M49 DIM_GEO_CODE_TYPE DIM_PUBLISH_STATE_CODE
    ## 1          YEAR              192           COUNTRY              PUBLISHED
    ## 2          YEAR              196           COUNTRY              PUBLISHED
    ## 3          YEAR              199    CLASSIFICATION              PUBLISHED
    ## 4          YEAR              202            REGION              PUBLISHED
    ## 5          YEAR              203           COUNTRY              PUBLISHED
    ## 6          YEAR              204           COUNTRY              PUBLISHED
    ##                        IND_NAME            GEO_NAME_SHORT DIM_SEX
    ## 1 Alcohol consumption (age 15+)                      Cuba   TOTAL
    ## 2 Alcohol consumption (age 15+)                    Cyprus   TOTAL
    ## 3 Alcohol consumption (age 15+) Least developed countries   TOTAL
    ## 4 Alcohol consumption (age 15+)        Sub-Saharan Africa   TOTAL
    ## 5 Alcohol consumption (age 15+)                   Czechia   TOTAL
    ## 6 Alcohol consumption (age 15+)                     Benin   TOTAL
    ##   RATE_PER_CAPITA_N RATE_PER_CAPITA_NL RATE_PER_CAPITA_NU
    ## 1          5.885221           4.503071           7.410578
    ## 2          7.142592           5.563809           8.754144
    ## 3          2.029877           1.895321           2.216005
    ## 4          3.860405           3.588745           4.177033
    ## 5         14.557763          12.680295          16.571871
    ## 6          8.715128           6.812557          10.710716

## Simplify the dataframe

There are a few columns which we don’t need to keep, for example the
first four columns contain the same code for each line of the data.

``` r
alcohol <- alcohol[,5:15]
head(alcohol)
```

    ##   DIM_TIME DIM_TIME_TYPE DIM_GEO_CODE_M49 DIM_GEO_CODE_TYPE
    ## 1     2003          YEAR              192           COUNTRY
    ## 2     2003          YEAR              196           COUNTRY
    ## 3     2003          YEAR              199    CLASSIFICATION
    ## 4     2003          YEAR              202            REGION
    ## 5     2003          YEAR              203           COUNTRY
    ## 6     2003          YEAR              204           COUNTRY
    ##   DIM_PUBLISH_STATE_CODE                      IND_NAME
    ## 1              PUBLISHED Alcohol consumption (age 15+)
    ## 2              PUBLISHED Alcohol consumption (age 15+)
    ## 3              PUBLISHED Alcohol consumption (age 15+)
    ## 4              PUBLISHED Alcohol consumption (age 15+)
    ## 5              PUBLISHED Alcohol consumption (age 15+)
    ## 6              PUBLISHED Alcohol consumption (age 15+)
    ##              GEO_NAME_SHORT DIM_SEX RATE_PER_CAPITA_N RATE_PER_CAPITA_NL
    ## 1                      Cuba   TOTAL          5.885221           4.503071
    ## 2                    Cyprus   TOTAL          7.142592           5.563809
    ## 3 Least developed countries   TOTAL          2.029877           1.895321
    ## 4        Sub-Saharan Africa   TOTAL          3.860405           3.588745
    ## 5                   Czechia   TOTAL         14.557763          12.680295
    ## 6                     Benin   TOTAL          8.715128           6.812557
    ##   RATE_PER_CAPITA_NU
    ## 1           7.410578
    ## 2           8.754144
    ## 3           2.216005
    ## 4           4.177033
    ## 5          16.571871
    ## 6          10.710716

The columns `DIM_TIME_TYPE`, `DIM_PUBLISH_STATE_CODE`, `IND_NAME` and
`DIM_SEX` are also all the same for all of the data as well, so they can
be removed.

``` r
alcohol$DIM_TIME_TYPE <- NULL
alcohol$DIM_PUBLISH_STATE_CODE <- NULL
alcohol$IND_NAME <- NULL
alcohol$DIM_SEX <- NULL
head(alcohol)
```

    ##   DIM_TIME DIM_GEO_CODE_M49 DIM_GEO_CODE_TYPE            GEO_NAME_SHORT
    ## 1     2003              192           COUNTRY                      Cuba
    ## 2     2003              196           COUNTRY                    Cyprus
    ## 3     2003              199    CLASSIFICATION Least developed countries
    ## 4     2003              202            REGION        Sub-Saharan Africa
    ## 5     2003              203           COUNTRY                   Czechia
    ## 6     2003              204           COUNTRY                     Benin
    ##   RATE_PER_CAPITA_N RATE_PER_CAPITA_NL RATE_PER_CAPITA_NU
    ## 1          5.885221           4.503071           7.410578
    ## 2          7.142592           5.563809           8.754144
    ## 3          2.029877           1.895321           2.216005
    ## 4          3.860405           3.588745           4.177033
    ## 5         14.557763          12.680295          16.571871
    ## 6          8.715128           6.812557          10.710716

Now we only have the interesting columns of the dataframe, so we can get
on with playing with the data.

## Sort the data into new datframes

Looking at the variable `DIM_GEO_CODE_TYPE`, I can see that there are
several different geographical levels/classifications in this column.

``` r
unique(alcohol$DIM_GEO_CODE_TYPE)
```

    ## [1] "COUNTRY"        "CLASSIFICATION" "REGION"         "WHOREGION"     
    ## [5] "GLOBAL"

``` r
table(alcohol$DIM_GEO_CODE_TYPE)
```

    ## 
    ## CLASSIFICATION        COUNTRY         GLOBAL         REGION      WHOREGION 
    ##            115           4324             23            805            138

I will separate out the data into new data frames based on the
`DIM_GEO_CODE_TYPE` using the `dplyr` package.

``` r
library(dplyr)
```

    ## Warning: package 'dplyr' was built under R version 4.5.2

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
alcohol_class <- filter(alcohol, DIM_GEO_CODE_TYPE == "CLASSIFICATION")
alcohol_country <- filter(alcohol, DIM_GEO_CODE_TYPE == "COUNTRY")
alcohol_global <- filter(alcohol, DIM_GEO_CODE_TYPE == "GLOBAL")
alcohol_region <- filter(alcohol, DIM_GEO_CODE_TYPE == "REGION")
alcohol_whoregion <- filter(alcohol, DIM_GEO_CODE_TYPE == "WHOREGION")
```

These data sets are now set up to use for making graphs.

## Alternative dataset

The WHO also has another dataset, which further subdivides alcohol
consumption by beverage type.
<https://www.who.int/data/gho/data/indicators/indicator-details/GHO/alcohol-recorded-per-capita-(15-)-consumption-(in-litres-of-pure-alcohol)>

``` r
beverage_type <- read.csv("alcohol_bev_type.csv")
head(beverage_type)
```

    ##   IndicatorCode
    ## 1 SA_0000001400
    ## 2 SA_0000001400
    ## 3 SA_0000001400
    ## 4 SA_0000001400
    ## 5 SA_0000001400
    ## 6 SA_0000001400
    ##                                                                                      Indicator
    ## 1 Alcohol, recorded per capita (15+) consumption (in litres of pure alcohol), by beverage type
    ## 2 Alcohol, recorded per capita (15+) consumption (in litres of pure alcohol), by beverage type
    ## 3 Alcohol, recorded per capita (15+) consumption (in litres of pure alcohol), by beverage type
    ## 4 Alcohol, recorded per capita (15+) consumption (in litres of pure alcohol), by beverage type
    ## 5 Alcohol, recorded per capita (15+) consumption (in litres of pure alcohol), by beverage type
    ## 6 Alcohol, recorded per capita (15+) consumption (in litres of pure alcohol), by beverage type
    ##   ValueType ParentLocationCode        ParentLocation Location.type
    ## 1   numeric                EMR Eastern Mediterranean       Country
    ## 2   numeric                EMR Eastern Mediterranean       Country
    ## 3   numeric                EMR Eastern Mediterranean       Country
    ## 4   numeric                EMR Eastern Mediterranean       Country
    ## 5   numeric                EMR Eastern Mediterranean       Country
    ## 6   numeric                AFR                Africa       Country
    ##   SpatialDimValueCode    Location Period.type Period IsLatestYear
    ## 1                 AFG Afghanistan        Year   2024         true
    ## 2                 AFG Afghanistan        Year   2024         true
    ## 3                 AFG Afghanistan        Year   2024         true
    ## 4                 AFG Afghanistan        Year   2024         true
    ## 5                 AFG Afghanistan        Year   2024         true
    ## 6                 DZA     Algeria        Year   2024         true
    ##        Dim1.type                      Dim1                Dim1ValueCode
    ## 1 Beverage Types                      Beer          ALCOHOLTYPE_SA_BEER
    ## 2 Beverage Types Other alcoholic beverages ALCOHOLTYPE_SA_OTHER_ALCOHOL
    ## 3 Beverage Types                   Spirits       ALCOHOLTYPE_SA_SPIRITS
    ## 4 Beverage Types                 All types         ALCOHOLTYPE_SA_TOTAL
    ## 5 Beverage Types                      Wine          ALCOHOLTYPE_SA_WINE
    ## 6 Beverage Types Other alcoholic beverages ALCOHOLTYPE_SA_OTHER_ALCOHOL
    ##   Dim2.type Dim2 Dim2ValueCode Dim3.type Dim3 Dim3ValueCode
    ## 1        NA   NA            NA        NA   NA            NA
    ## 2        NA   NA            NA        NA   NA            NA
    ## 3        NA   NA            NA        NA   NA            NA
    ## 4        NA   NA            NA        NA   NA            NA
    ## 5        NA   NA            NA        NA   NA            NA
    ## 6        NA   NA            NA        NA   NA            NA
    ##   DataSourceDimValueCode
    ## 1    DATASOURCE_GISAHAFG
    ## 2    DATASOURCE_GISAHAFG
    ## 3    DATASOURCE_GISAHAFG
    ## 4    DATASOURCE_GISAHAFG
    ## 5    DATASOURCE_GISAHAFG
    ## 6    DATASOURCE_GISAHDZA
    ##                                                                                  DataSource
    ## 1               Food and Agriculture Organization of the UN (FAO) 1961-1999; IWSR 2000-2024
    ## 2               Food and Agriculture Organization of the UN (FAO) 1961-1999; IWSR 2000-2024
    ## 3               Food and Agriculture Organization of the UN (FAO) 1961-1999; IWSR 2000-2024
    ## 4               Food and Agriculture Organization of the UN (FAO) 1961-1999; IWSR 2000-2024
    ## 5               Food and Agriculture Organization of the UN (FAO) 1961-1999; IWSR 2000-2024
    ## 6 World Drink Trends (WDT) 1961-1999; merged (FAO, GlobalData, imputed data, OIV) 2000-2024
    ##   FactValueNumericPrefix FactValueNumeric FactValueUoM
    ## 1                     NA                0           NA
    ## 2                     NA                0           NA
    ## 3                     NA                0           NA
    ## 4                     NA                0           NA
    ## 5                     NA                0           NA
    ## 6                     NA                0           NA
    ##   FactValueNumericLowPrefix FactValueNumericLow FactValueNumericHighPrefix
    ## 1                        NA                  NA                         NA
    ## 2                        NA                  NA                         NA
    ## 3                        NA                  NA                         NA
    ## 4                        NA                  NA                         NA
    ## 5                        NA                  NA                         NA
    ## 6                        NA                  NA                         NA
    ##   FactValueNumericHigh Value FactValueTranslationID FactComments Language
    ## 1                   NA     0                     NA           NA       EN
    ## 2                   NA     0                     NA           NA       EN
    ## 3                   NA     0                     NA           NA       EN
    ## 4                   NA     0                     NA           NA       EN
    ## 5                   NA     0                     NA           NA       EN
    ## 6                   NA     0                     NA           NA       EN
    ##               DateModified
    ## 1 2026-07-05T23:00:00.000Z
    ## 2 2026-07-05T23:00:00.000Z
    ## 3 2026-07-05T23:00:00.000Z
    ## 4 2026-07-05T23:00:00.000Z
    ## 5 2026-07-05T23:00:00.000Z
    ## 6 2026-07-05T23:00:00.000Z

``` r
summary(beverage_type)
```

    ##  IndicatorCode       Indicator          ValueType         ParentLocationCode
    ##  Length:52558       Length:52558       Length:52558       Length:52558      
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##  ParentLocation     Location.type      SpatialDimValueCode   Location        
    ##  Length:52558       Length:52558       Length:52558        Length:52558      
    ##  Class :character   Class :character   Class :character    Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character    Mode  :character  
    ##                                                                              
    ##                                                                              
    ##                                                                              
    ##                                                                              
    ##  Period.type            Period     IsLatestYear        Dim1.type        
    ##  Length:52558       Min.   :1960   Length:52558       Length:52558      
    ##  Class :character   1st Qu.:1980   Class :character   Class :character  
    ##  Mode  :character   Median :1997   Mode  :character   Mode  :character  
    ##                     Mean   :1995                                        
    ##                     3rd Qu.:2011                                        
    ##                     Max.   :2024                                        
    ##                                                                         
    ##      Dim1           Dim1ValueCode      Dim2.type        Dim2        
    ##  Length:52558       Length:52558       Mode:logical   Mode:logical  
    ##  Class :character   Class :character   NA's:52558     NA's:52558    
    ##  Mode  :character   Mode  :character                                
    ##                                                                     
    ##                                                                     
    ##                                                                     
    ##                                                                     
    ##  Dim2ValueCode  Dim3.type        Dim3         Dim3ValueCode 
    ##  Mode:logical   Mode:logical   Mode:logical   Mode:logical  
    ##  NA's:52558     NA's:52558     NA's:52558     NA's:52558    
    ##                                                             
    ##                                                             
    ##                                                             
    ##                                                             
    ##                                                             
    ##  DataSourceDimValueCode  DataSource        FactValueNumericPrefix
    ##  Length:52558           Length:52558       Mode:logical          
    ##  Class :character       Class :character   NA's:52558            
    ##  Mode  :character       Mode  :character                         
    ##                                                                  
    ##                                                                  
    ##                                                                  
    ##                                                                  
    ##  FactValueNumeric FactValueUoM   FactValueNumericLowPrefix FactValueNumericLow
    ##  Min.   :-0.002   Mode:logical   Mode:logical              Mode:logical       
    ##  1st Qu.: 0.034   NA's:52558     NA's:52558                NA's:52558         
    ##  Median : 0.620                                                               
    ##  Mean   : 1.943                                                               
    ##  3rd Qu.: 2.650                                                               
    ##  Max.   :26.040                                                               
    ##  NA's   :60                                                                   
    ##  FactValueNumericHighPrefix FactValueNumericHigh    Value          
    ##  Mode:logical               Mode:logical         Length:52558      
    ##  NA's:52558                 NA's:52558           Class :character  
    ##                                                  Mode  :character  
    ##                                                                    
    ##                                                                    
    ##                                                                    
    ##                                                                    
    ##  FactValueTranslationID FactComments     Language         DateModified      
    ##  Min.   :827            Mode:logical   Length:52558       Length:52558      
    ##  1st Qu.:827            NA's:52558     Class :character   Class :character  
    ##  Median :827                           Mode  :character   Mode  :character  
    ##  Mean   :827                                                                
    ##  3rd Qu.:827                                                                
    ##  Max.   :827                                                                
    ##  NA's   :52498

Like the previous dataset, there are a few columns which contain the
same information for each entry, so they will be removed.

``` r
beverage_type <- beverage_type[, c(4, 5, 7, 8, 10, 11, 13, 14, 21, 22, 24, 30, 31, 33, 34)]
head(beverage_type)
```

    ##   ParentLocationCode        ParentLocation SpatialDimValueCode    Location
    ## 1                EMR Eastern Mediterranean                 AFG Afghanistan
    ## 2                EMR Eastern Mediterranean                 AFG Afghanistan
    ## 3                EMR Eastern Mediterranean                 AFG Afghanistan
    ## 4                EMR Eastern Mediterranean                 AFG Afghanistan
    ## 5                EMR Eastern Mediterranean                 AFG Afghanistan
    ## 6                AFR                Africa                 DZA     Algeria
    ##   Period IsLatestYear                      Dim1                Dim1ValueCode
    ## 1   2024         true                      Beer          ALCOHOLTYPE_SA_BEER
    ## 2   2024         true Other alcoholic beverages ALCOHOLTYPE_SA_OTHER_ALCOHOL
    ## 3   2024         true                   Spirits       ALCOHOLTYPE_SA_SPIRITS
    ## 4   2024         true                 All types         ALCOHOLTYPE_SA_TOTAL
    ## 5   2024         true                      Wine          ALCOHOLTYPE_SA_WINE
    ## 6   2024         true Other alcoholic beverages ALCOHOLTYPE_SA_OTHER_ALCOHOL
    ##   DataSourceDimValueCode
    ## 1    DATASOURCE_GISAHAFG
    ## 2    DATASOURCE_GISAHAFG
    ## 3    DATASOURCE_GISAHAFG
    ## 4    DATASOURCE_GISAHAFG
    ## 5    DATASOURCE_GISAHAFG
    ## 6    DATASOURCE_GISAHDZA
    ##                                                                                  DataSource
    ## 1               Food and Agriculture Organization of the UN (FAO) 1961-1999; IWSR 2000-2024
    ## 2               Food and Agriculture Organization of the UN (FAO) 1961-1999; IWSR 2000-2024
    ## 3               Food and Agriculture Organization of the UN (FAO) 1961-1999; IWSR 2000-2024
    ## 4               Food and Agriculture Organization of the UN (FAO) 1961-1999; IWSR 2000-2024
    ## 5               Food and Agriculture Organization of the UN (FAO) 1961-1999; IWSR 2000-2024
    ## 6 World Drink Trends (WDT) 1961-1999; merged (FAO, GlobalData, imputed data, OIV) 2000-2024
    ##   FactValueNumeric Value FactValueTranslationID Language
    ## 1                0     0                     NA       EN
    ## 2                0     0                     NA       EN
    ## 3                0     0                     NA       EN
    ## 4                0     0                     NA       EN
    ## 5                0     0                     NA       EN
    ## 6                0     0                     NA       EN
    ##               DateModified
    ## 1 2026-07-05T23:00:00.000Z
    ## 2 2026-07-05T23:00:00.000Z
    ## 3 2026-07-05T23:00:00.000Z
    ## 4 2026-07-05T23:00:00.000Z
    ## 5 2026-07-05T23:00:00.000Z
    ## 6 2026-07-05T23:00:00.000Z

## Regions and parent locations

Both datasets refer to regions or classifications - these are groups of
countries based on factors such as geographical location or income.

The `beverage_type` dataset makes it obvious which country belongs to
which ‘parent region’ with the `ParentLocation` column. The `alcohol`
data set does not have this built in, so it would be useful to have a
grouping reference for when I want to compare between levels.

I’ll retrieve the parent regions from `beverage_type` to see if they
match up with the ones from `alcohol`:
