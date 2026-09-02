Simple graphs
================
Fiona Messer
2026-09-01

## Making simple plots

Now the data sets are nicely formatted I can start messing around with
plotting the data in fun and interesting ways.

Load the data from the `data_import_files` folder:

``` r
alcohol_country <- read.csv("alcohol_country.csv")
```

I will start by plotting the alcohol consumption data for a random
country over time. First, choose a country:

``` r
country <- unique(alcohol_country$GEO_NAME_SHORT)[[sample(1:length(unique(alcohol_country$GEO_NAME_SHORT)), 1)]]
filter(alcohol_country, GEO_NAME_SHORT == country)
```

    ##      X GEO_NAME_SHORT ParentLocationCode ParentLocation SpatialDimValueCode
    ## 1  783          Chile                AMR       Americas                 CHL
    ## 2  784          Chile                AMR       Americas                 CHL
    ## 3  785          Chile                AMR       Americas                 CHL
    ## 4  786          Chile                AMR       Americas                 CHL
    ## 5  787          Chile                AMR       Americas                 CHL
    ## 6  788          Chile                AMR       Americas                 CHL
    ## 7  789          Chile                AMR       Americas                 CHL
    ## 8  790          Chile                AMR       Americas                 CHL
    ## 9  791          Chile                AMR       Americas                 CHL
    ## 10 792          Chile                AMR       Americas                 CHL
    ## 11 793          Chile                AMR       Americas                 CHL
    ## 12 794          Chile                AMR       Americas                 CHL
    ## 13 795          Chile                AMR       Americas                 CHL
    ## 14 796          Chile                AMR       Americas                 CHL
    ## 15 797          Chile                AMR       Americas                 CHL
    ## 16 798          Chile                AMR       Americas                 CHL
    ## 17 799          Chile                AMR       Americas                 CHL
    ## 18 800          Chile                AMR       Americas                 CHL
    ## 19 801          Chile                AMR       Americas                 CHL
    ## 20 802          Chile                AMR       Americas                 CHL
    ## 21 803          Chile                AMR       Americas                 CHL
    ## 22 804          Chile                AMR       Americas                 CHL
    ## 23 805          Chile                AMR       Americas                 CHL
    ##    DIM_TIME DIM_GEO_CODE_M49 DIM_GEO_CODE_TYPE RATE_PER_CAPITA_N
    ## 1      2019              152           COUNTRY          7.366765
    ## 2      2021              152           COUNTRY          7.929031
    ## 3      2005              152           COUNTRY          7.588063
    ## 4      2007              152           COUNTRY          7.847923
    ## 5      2008              152           COUNTRY          7.958862
    ## 6      2013              152           COUNTRY          8.307424
    ## 7      2012              152           COUNTRY          8.011873
    ## 8      2003              152           COUNTRY          6.773735
    ## 9      2009              152           COUNTRY          8.010829
    ## 10     2020              152           COUNTRY          7.910445
    ## 11     2017              152           COUNTRY          6.581213
    ## 12     2004              152           COUNTRY          7.276823
    ## 13     2011              152           COUNTRY          8.125549
    ## 14     2006              152           COUNTRY          7.940426
    ## 15     2002              152           COUNTRY          6.702532
    ## 16     2001              152           COUNTRY          6.658858
    ## 17     2010              152           COUNTRY          7.909384
    ## 18     2015              152           COUNTRY          7.860608
    ## 19     2000              152           COUNTRY          6.658858
    ## 20     2016              152           COUNTRY          7.110228
    ## 21     2022              152           COUNTRY          7.929031
    ## 22     2014              152           COUNTRY          8.152529
    ## 23     2018              152           COUNTRY          6.839852
    ##    RATE_PER_CAPITA_NL RATE_PER_CAPITA_NU
    ## 1            6.041574           8.901592
    ## 2            6.466642           9.436972
    ## 3            6.183986           9.023551
    ## 4            6.475829           9.267204
    ## 5            6.457598           9.536982
    ## 6            6.859433           9.854076
    ## 7            6.640024           9.588248
    ## 8            5.450019           8.158507
    ## 9            6.523170           9.473966
    ## 10           6.552837           9.446440
    ## 11           5.190223           7.961711
    ## 12           5.879919           8.738891
    ## 13           6.702356           9.731205
    ## 14           6.532242           9.478824
    ## 15           5.364396           8.092976
    ## 16           5.385002           8.011441
    ## 17           6.457442           9.416024
    ## 18           6.487958           9.430019
    ## 19           5.385002           8.011441
    ## 20           5.776678           8.540089
    ## 21           6.466642           9.436972
    ## 22           6.773106           9.564102
    ## 23           5.538334           8.265290

``` r
print(country)
```

    ## [1] "Chile"

Next, plot a scatterplot with a line:

``` r
alcohol_country %>% 
  filter(alcohol_country$GEO_NAME_SHORT == country) %>%
  ggplot(aes(x=DIM_TIME, y=RATE_PER_CAPITA_N)) +
    geom_line() +
    geom_point()
```

<figure>
<img
src="simple_graphs_files/figure-gfm/Scatter%20and%20line%20plot-1.png"
alt="Chile" />
<figcaption aria-hidden="true">Chile</figcaption>
</figure>

Plot made, can I add the upper and lower estimates as well?

``` r
alcohol_country %>% 
  filter(alcohol_country$GEO_NAME_SHORT == country) %>%
  ggplot(aes(x=DIM_TIME)) +
    geom_line(aes(y = RATE_PER_CAPITA_N, colour = "Rate per capita")) +
    geom_line(aes(y = RATE_PER_CAPITA_NL, colour = "Lower limit")) +
    geom_line(aes(y = RATE_PER_CAPITA_NU, colour = "Upper limit"))
```

<figure>
<img
src="simple_graphs_files/figure-gfm/Upper%20and%20lower%20limits-1.png"
alt="Alcohol consumption per capita + error" />
<figcaption aria-hidden="true">Alcohol consumption per capita +
error</figcaption>
</figure>

Alternatively with error bars:

``` r
alcohol_country %>% 
  filter(alcohol_country$GEO_NAME_SHORT == country) %>%
  ggplot(aes(x=DIM_TIME)) +
  geom_line(aes(y = RATE_PER_CAPITA_N)) +
  geom_errorbar(aes(ymin = RATE_PER_CAPITA_NL, ymax = RATE_PER_CAPITA_NU))
```

<figure>
<img src="simple_graphs_files/figure-gfm/Error%20bars-1.png"
alt="Alcohol consumption per capita + error bars" />
<figcaption aria-hidden="true">Alcohol consumption per capita + error
bars</figcaption>
</figure>

Which looks ugly. Try the `geom_ribbon()` function instead.

``` r
alcohol_country %>% 
  filter(alcohol_country$GEO_NAME_SHORT == country) %>%
  ggplot(aes(x=DIM_TIME, y = RATE_PER_CAPITA_N, ymin = RATE_PER_CAPITA_NL, ymax = RATE_PER_CAPITA_NU)) +
  geom_line() +
  geom_ribbon(alpha = 0.25)
```

<figure>
<img src="simple_graphs_files/figure-gfm/Error%20ribbon-1.png"
alt="Alcohol consumption per capita + error ribbon" />
<figcaption aria-hidden="true">Alcohol consumption per capita + error
ribbon</figcaption>
</figure>
