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
on with playing with the data
