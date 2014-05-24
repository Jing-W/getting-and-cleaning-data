CodeBook
========================================================

The final tidy data is contained in "data_tidy.txt" (or "data_tidy.csv").

This data contains 180 rows and 68 columns. The first two columns are "activity" and "subject". 

"activity" describes the activity that the subject is performing, including the following 6 categories: "laying", "sitting", "standing", "walking", "walkingdownstairs" and "walkingupstairs".

"subject" contains the id of the subject, ranging from 1 to 30.

The rest 66 columns are the mean and std features, the names are taken from features.txt and are processed so that it contains only lower case letters. Detailed processing can be found in README.md. The value of these 66 columns are the average values taken for each activity and each subject.

The column names are:

```r
data <- read.table("./data_tidy.txt")
colnames(data)
```

```
##  [1] "activity"                 "subject"                 
##  [3] "tbodyaccmeanx"            "tbodyaccmeany"           
##  [5] "tbodyaccmeanz"            "tbodyaccstdx"            
##  [7] "tbodyaccstdy"             "tbodyaccstdz"            
##  [9] "tgravityaccmeanx"         "tgravityaccmeany"        
## [11] "tgravityaccmeanz"         "tgravityaccstdx"         
## [13] "tgravityaccstdy"          "tgravityaccstdz"         
## [15] "tbodyaccjerkmeanx"        "tbodyaccjerkmeany"       
## [17] "tbodyaccjerkmeanz"        "tbodyaccjerkstdx"        
## [19] "tbodyaccjerkstdy"         "tbodyaccjerkstdz"        
## [21] "tbodygyromeanx"           "tbodygyromeany"          
## [23] "tbodygyromeanz"           "tbodygyrostdx"           
## [25] "tbodygyrostdy"            "tbodygyrostdz"           
## [27] "tbodygyrojerkmeanx"       "tbodygyrojerkmeany"      
## [29] "tbodygyrojerkmeanz"       "tbodygyrojerkstdx"       
## [31] "tbodygyrojerkstdy"        "tbodygyrojerkstdz"       
## [33] "tbodyaccmagmean"          "tbodyaccmagstd"          
## [35] "tgravityaccmagmean"       "tgravityaccmagstd"       
## [37] "tbodyaccjerkmagmean"      "tbodyaccjerkmagstd"      
## [39] "tbodygyromagmean"         "tbodygyromagstd"         
## [41] "tbodygyrojerkmagmean"     "tbodygyrojerkmagstd"     
## [43] "fbodyaccmeanx"            "fbodyaccmeany"           
## [45] "fbodyaccmeanz"            "fbodyaccstdx"            
## [47] "fbodyaccstdy"             "fbodyaccstdz"            
## [49] "fbodyaccjerkmeanx"        "fbodyaccjerkmeany"       
## [51] "fbodyaccjerkmeanz"        "fbodyaccjerkstdx"        
## [53] "fbodyaccjerkstdy"         "fbodyaccjerkstdz"        
## [55] "fbodygyromeanx"           "fbodygyromeany"          
## [57] "fbodygyromeanz"           "fbodygyrostdx"           
## [59] "fbodygyrostdy"            "fbodygyrostdz"           
## [61] "fbodyaccmagmean"          "fbodyaccmagstd"          
## [63] "fbodybodyaccjerkmagmean"  "fbodybodyaccjerkmagstd"  
## [65] "fbodybodygyromagmean"     "fbodybodygyromagstd"     
## [67] "fbodybodygyrojerkmagmean" "fbodybodygyrojerkmagstd"
```


The first 6 rows of the data looks like this:

```r
head(data)
```

```
##   activity subject tbodyaccmeanx tbodyaccmeany tbodyaccmeanz tbodyaccstdx
## 1  walking       1        0.2773      -0.01738       -0.1111      -0.2837
## 2  walking       2        0.2764      -0.01859       -0.1055      -0.4236
## 3  walking       3        0.2756      -0.01718       -0.1127      -0.3604
## 4  walking       4        0.2786      -0.01484       -0.1114      -0.4408
## 5  walking       5        0.2778      -0.01729       -0.1077      -0.2941
## 6  walking       6        0.2837      -0.01690       -0.1103      -0.2965
##   tbodyaccstdy tbodyaccstdz tgravityaccmeanx tgravityaccmeany
## 1      0.11446      -0.2600           0.9352         -0.28217
## 2     -0.07809      -0.4253           0.9130         -0.34661
## 3     -0.06991      -0.3874           0.9365         -0.26199
## 4     -0.07883      -0.5863           0.9640         -0.08585
## 5      0.07675      -0.4570           0.9726         -0.10044
## 6      0.16421      -0.5043           0.9581         -0.21469
##   tgravityaccmeanz tgravityaccstdx tgravityaccstdy tgravityaccstdz
## 1        -0.068103         -0.9766         -0.9713         -0.9477
## 2         0.084727         -0.9727         -0.9721         -0.9721
## 3        -0.138108         -0.9778         -0.9624         -0.9521
## 4         0.127764         -0.9838         -0.9680         -0.9630
## 5         0.002476         -0.9793         -0.9616         -0.9646
## 6         0.033189         -0.9778         -0.9642         -0.9572
##   tbodyaccjerkmeanx tbodyaccjerkmeany tbodyaccjerkmeanz tbodyaccjerkstdx
## 1           0.07404          0.028272        -4.168e-03          -0.1136
## 2           0.06181          0.018249         7.895e-03          -0.2775
## 3           0.08147          0.010059        -5.623e-03          -0.2687
## 4           0.07835          0.002956        -7.677e-04          -0.2970
## 5           0.08459         -0.016319         8.322e-05          -0.3029
## 6           0.06996         -0.016483        -7.389e-03          -0.1328
##   tbodyaccjerkstdy tbodyaccjerkstdz tbodygyromeanx tbodygyromeany
## 1         0.067003          -0.5027       -0.04183       -0.06953
## 2        -0.016602          -0.5861       -0.05303       -0.04824
## 3        -0.044962          -0.5295       -0.02564       -0.07792
## 4        -0.221165          -0.7514       -0.03180       -0.07269
## 5        -0.091040          -0.6129       -0.04889       -0.06901
## 6         0.008089          -0.5758       -0.02551       -0.07445
##   tbodygyromeanz tbodygyrostdx tbodygyrostdy tbodygyrostdz
## 1        0.08494       -0.4735      -0.05461       -0.3443
## 2        0.08283       -0.5616      -0.53845       -0.4811
## 3        0.08135       -0.5719      -0.56379       -0.4767
## 4        0.08057       -0.5009      -0.66539       -0.6626
## 5        0.08154       -0.4909      -0.50462       -0.3187
## 6        0.08388       -0.4460      -0.33170       -0.3831
##   tbodygyrojerkmeanx tbodygyrojerkmeany tbodygyrojerkmeanz
## 1           -0.09000           -0.03984           -0.04613
## 2           -0.08188           -0.05383           -0.05149
## 3           -0.09524           -0.03879           -0.05036
## 4           -0.11532           -0.03935           -0.05512
## 5           -0.08884           -0.04496           -0.04827
## 6           -0.08789           -0.03623           -0.05396
##   tbodygyrojerkstdx tbodygyrojerkstdy tbodygyrojerkstdz tbodyaccmagmean
## 1           -0.2074           -0.3045           -0.4043         -0.1370
## 2           -0.3895           -0.6341           -0.4355         -0.2904
## 3           -0.3859           -0.6391           -0.5367         -0.2547
## 4           -0.4923           -0.8074           -0.6405         -0.3121
## 5           -0.3577           -0.5714           -0.1577         -0.1583
## 6           -0.1826           -0.4164           -0.1667         -0.1668
##   tbodyaccmagstd tgravityaccmagmean tgravityaccmagstd tbodyaccjerkmagmean
## 1        -0.2197            -0.1370           -0.2197             -0.1414
## 2        -0.4225            -0.2904           -0.4225             -0.2814
## 3        -0.3284            -0.2547           -0.3284             -0.2800
## 4        -0.5277            -0.3121           -0.5277             -0.3667
## 5        -0.3772            -0.1583           -0.3772             -0.2883
## 6        -0.2667            -0.1668           -0.2667             -0.1951
##   tbodyaccjerkmagstd tbodygyromagmean tbodygyromagstd tbodygyrojerkmagmean
## 1           -0.07447          -0.1610         -0.1870              -0.2987
## 2           -0.16415          -0.4465         -0.5530              -0.5479
## 3           -0.13992          -0.4664         -0.5615              -0.5661
## 4           -0.31692          -0.4978         -0.5531              -0.6813
## 5           -0.28224          -0.3559         -0.4922              -0.4445
## 6           -0.07060          -0.2812         -0.3656              -0.3213
##   tbodygyrojerkmagstd fbodyaccmeanx fbodyaccmeany fbodyaccmeanz
## 1             -0.3253       -0.2028       0.08971       -0.3316
## 2             -0.5578       -0.3460      -0.02190       -0.4538
## 3             -0.5674       -0.3166      -0.08130       -0.4124
## 4             -0.7301       -0.4267      -0.14940       -0.6310
## 5             -0.4892       -0.2878       0.00946       -0.4903
## 6             -0.3647       -0.1879       0.14078       -0.4985
##   fbodyaccstdx fbodyaccstdy fbodyaccstdz fbodyaccjerkmeanx
## 1      -0.3191      0.05604      -0.2797           -0.1705
## 2      -0.4577     -0.16922      -0.4552           -0.3046
## 3      -0.3793     -0.12403      -0.4230           -0.3047
## 4      -0.4472     -0.10180      -0.5942           -0.3589
## 5      -0.2975      0.04260      -0.4831           -0.3450
## 6      -0.3452      0.10170      -0.5505           -0.1509
##   fbodyaccjerkmeany fbodyaccjerkmeanz fbodyaccjerkstdx fbodyaccjerkstdy
## 1          -0.03523           -0.4690          -0.1336         0.106740
## 2          -0.07876           -0.5550          -0.3143        -0.015333
## 3          -0.14051           -0.5141          -0.2966        -0.005615
## 4          -0.27955           -0.7290          -0.2973        -0.209900
## 5          -0.18106           -0.5905          -0.3214        -0.054521
## 6          -0.07537           -0.5414          -0.1927         0.031445
##   fbodyaccjerkstdz fbodygyromeanx fbodygyromeany fbodygyromeanz
## 1          -0.5347        -0.3390        -0.1031        -0.2559
## 2          -0.6159        -0.4297        -0.5548        -0.3967
## 3          -0.5435        -0.4378        -0.5615        -0.4181
## 4          -0.7724        -0.3734        -0.6885        -0.6014
## 5          -0.6334        -0.3727        -0.5140        -0.2131
## 6          -0.6086        -0.2397        -0.3414        -0.2036
##   fbodygyrostdx fbodygyrostdy fbodygyrostdz fbodyaccmagmean fbodyaccmagstd
## 1       -0.5167      -0.03351       -0.4366         -0.1286        -0.3980
## 2       -0.6041      -0.53305       -0.5599         -0.3243        -0.5771
## 3       -0.6151      -0.56889       -0.5459         -0.2900        -0.4564
## 4       -0.5426      -0.65466       -0.7165         -0.4508        -0.6512
## 5       -0.5294      -0.50268       -0.4204         -0.3050        -0.5196
## 6       -0.5153      -0.33201       -0.5122         -0.2014        -0.4217
##   fbodybodyaccjerkmagmean fbodybodyaccjerkmagstd fbodybodygyromagmean
## 1                -0.05712               -0.10349              -0.1993
## 2                -0.16906               -0.16409              -0.5307
## 3                -0.18676               -0.08985              -0.5698
## 4                -0.31859               -0.32046              -0.6093
## 5                -0.26948               -0.30569              -0.4843
## 6                -0.05540               -0.09650              -0.3297
##   fbodybodygyromagstd fbodybodygyrojerkmagmean fbodybodygyrojerkmagstd
## 1             -0.3210                  -0.3193                 -0.3816
## 2             -0.6518                  -0.5832                 -0.5581
## 3             -0.6326                  -0.6078                 -0.5491
## 4             -0.5939                  -0.7243                 -0.7578
## 5             -0.5897                  -0.5481                 -0.4557
## 6             -0.5106                  -0.3665                 -0.4081
```



