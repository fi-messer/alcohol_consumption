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

    ##       X   GEO_NAME_SHORT ParentLocationCode  ParentLocation SpatialDimValueCode
    ## 1  2922 Papua New Guinea                WPR Western Pacific                 PNG
    ## 2  2923 Papua New Guinea                WPR Western Pacific                 PNG
    ## 3  2924 Papua New Guinea                WPR Western Pacific                 PNG
    ## 4  2925 Papua New Guinea                WPR Western Pacific                 PNG
    ## 5  2926 Papua New Guinea                WPR Western Pacific                 PNG
    ## 6  2927 Papua New Guinea                WPR Western Pacific                 PNG
    ## 7  2928 Papua New Guinea                WPR Western Pacific                 PNG
    ## 8  2929 Papua New Guinea                WPR Western Pacific                 PNG
    ## 9  2930 Papua New Guinea                WPR Western Pacific                 PNG
    ## 10 2931 Papua New Guinea                WPR Western Pacific                 PNG
    ## 11 2932 Papua New Guinea                WPR Western Pacific                 PNG
    ## 12 2933 Papua New Guinea                WPR Western Pacific                 PNG
    ## 13 2934 Papua New Guinea                WPR Western Pacific                 PNG
    ## 14 2935 Papua New Guinea                WPR Western Pacific                 PNG
    ## 15 2936 Papua New Guinea                WPR Western Pacific                 PNG
    ## 16 2937 Papua New Guinea                WPR Western Pacific                 PNG
    ## 17 2938 Papua New Guinea                WPR Western Pacific                 PNG
    ## 18 2939 Papua New Guinea                WPR Western Pacific                 PNG
    ## 19 2940 Papua New Guinea                WPR Western Pacific                 PNG
    ## 20 2941 Papua New Guinea                WPR Western Pacific                 PNG
    ## 21 2942 Papua New Guinea                WPR Western Pacific                 PNG
    ## 22 2943 Papua New Guinea                WPR Western Pacific                 PNG
    ## 23 2944 Papua New Guinea                WPR Western Pacific                 PNG
    ##    DIM_TIME DIM_GEO_CODE_M49 DIM_GEO_CODE_TYPE RATE_PER_CAPITA_N
    ## 1      2011              598           COUNTRY         1.2846370
    ## 2      2020              598           COUNTRY         1.3953690
    ## 3      2016              598           COUNTRY         1.8825171
    ## 4      2004              598           COUNTRY         1.0285521
    ## 5      2019              598           COUNTRY         1.5316355
    ## 6      2008              598           COUNTRY         1.1487931
    ## 7      2021              598           COUNTRY         1.2740612
    ## 8      2022              598           COUNTRY         1.2740612
    ## 9      2005              598           COUNTRY         1.0463364
    ## 10     2007              598           COUNTRY         1.0776421
    ## 11     2001              598           COUNTRY         0.9935686
    ## 12     2002              598           COUNTRY         0.9702103
    ## 13     2012              598           COUNTRY         1.3911395
    ## 14     2010              598           COUNTRY         1.2019542
    ## 15     2003              598           COUNTRY         0.9306624
    ## 16     2013              598           COUNTRY         1.5470708
    ## 17     2015              598           COUNTRY         1.6818393
    ## 18     2009              598           COUNTRY         1.1752060
    ## 19     2006              598           COUNTRY         1.1018029
    ## 20     2018              598           COUNTRY         1.7481841
    ## 21     2014              598           COUNTRY         1.6283188
    ## 22     2017              598           COUNTRY         1.8022852
    ## 23     2000              598           COUNTRY         0.9935686
    ##    RATE_PER_CAPITA_NL RATE_PER_CAPITA_NU
    ## 1           0.7529799           1.944229
    ## 2           0.7897561           2.121281
    ## 3           1.1438210           2.755308
    ## 4           0.5185423           1.696177
    ## 5           0.8865436           2.336093
    ## 6           0.6338770           1.851412
    ## 7           0.7012637           1.964568
    ## 8           0.7012637           1.964568
    ## 9           0.5530657           1.678160
    ## 10          0.5496443           1.734284
    ## 11          0.4911638           1.605405
    ## 12          0.4770221           1.605811
    ## 13          0.8093291           2.076482
    ## 14          0.6562401           1.887125
    ## 15          0.4680801           1.588001
    ## 16          0.8890833           2.352345
    ## 17          1.0143627           2.523521
    ## 18          0.6716486           1.809830
    ## 19          0.5891176           1.775979
    ## 20          1.0467629           2.595724
    ## 21          0.9915432           2.387945
    ## 22          1.0616024           2.649724
    ## 23          0.4911638           1.605405

``` r
print(country)
```

    ## [1] "Papua New Guinea"

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
alt="Alcohol consuption rate (L/year) per capita, Papua New Guinea" />
<figcaption aria-hidden="true">Alcohol consuption rate (L/year) per
capita, Papua New Guinea</figcaption>
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
alt="Alcohol consuption rate (L/year) per capita, Papua New Guinea, with errors" />
<figcaption aria-hidden="true">Alcohol consuption rate (L/year) per
capita, Papua New Guinea, with errors</figcaption>
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
alt="Alcohol consuption rate (L/year) per capita, Papua New Guinea, with error bars" />
<figcaption aria-hidden="true">Alcohol consuption rate (L/year) per
capita, Papua New Guinea, with error bars</figcaption>
</figure>

Which looks ugly. Try the `geom_ribbon()` function instead.

``` r
source("ggplot2_theme_FM.R")

alcohol_country %>% 
  filter(alcohol_country$GEO_NAME_SHORT == country) %>%
  ggplot(aes(x=DIM_TIME, y = RATE_PER_CAPITA_N, ymin = RATE_PER_CAPITA_NL, ymax = RATE_PER_CAPITA_NU)) +
  geom_ribbon(alpha = 0.25, colour = "#BC5F04", fill = "#BC5F04") +
  geom_line(colour = "#010001") +
  theme_FM() +
  labs(title = paste0("Alcohol consumption rate of adults in ", country), 
       subtitle = "Litres per year per capita",
       x = NULL,
       y = "Rate (L/Year) per Capita") +
  xlim(2000, 2022) +
  ylim(0, max(alcohol_country$RATE_PER_CAPITA_NU))
```

<figure>
<img src="simple_graphs_files/figure-gfm/Error%20ribbon-1.png"
alt="Alcohol consuption rate (L/year) per capita, Papua New Guinea, with error ribbon" />
<figcaption aria-hidden="true">Alcohol consuption rate (L/year) per
capita, Papua New Guinea, with error ribbon</figcaption>
</figure>

Now the plot looks pretty.
