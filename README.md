
# FIFA World Cup Historical Analysis 

## Project Overview

This project analyzes FIFA World Cup match data using PostgreSQL to explore historical team performance, scoring patterns, tournament participation, championship success, home-field advantage, and knockout-stage performance.

The objective was to use SQL to transform match-level data into meaningful insights and identify trends across World Cup history.

#  Key Questions

1. Which countries have won the most World Cup titles?
2. Which teams have played the most World Cup matches?
3. Which teams have scored the most goals?
4. Which World Cup tournaments had the most goals?
5. Does home-field advantage actually work?
6. Which teams perform best in knockout matches?
7. Which teams have appeared in the World Cup the most times?

#  1. Which Countries Have Won the Most World Cup Titles?

### Result

| Rank | Team      | Titles |
| ---: | --------- | -----: |
|    1 | Brazil    |      5 |
|    2 | Germany   |      4 |
|    3 | Italy     |      4 |
|    4 | Argentina |      3 |
|    5 | Spain     |      2 |
|    6 | France    |      2 |
|    7 | Uruguay   |      1 |
|    8 | England   |      1 |

### Insight

Brazil leads the World Cup title count with **5 championships**, followed by Germany and Italy with **4 titles each**. Argentina has won 3, while Spain and France have won 2 each.


#  2. Which Teams Have Played the Most World Cup Matches?

### Result

| Rank | Team        | Matches Played |
| ---: | ----------- | -------------: |
|    1 | Brazil      |            119 |
|    2 | Germany     |            116 |
|    3 | Argentina   |             96 |
|    4 | Italy       |             83 |
|    5 | England     |             82 |
|    6 | France      |             81 |
|    7 | Spain       |             75 |
|    8 | Mexico      |             65 |
|    9 | Uruguay     |             62 |
|   10 | Netherlands |             59 |

### Insight

Brazil has played the most World Cup matches with **119**, followed by Germany with 116 and Argentina with 96. These high totals reflect a combination of sustained participation and progression through tournaments.


#  3. Which Teams Have Scored the Most Goals?

### Result

| Rank | Team        | Total Goals |
| ---: | ----------- | ----------: |
|    1 | Brazil      |          78 |
|    2 | France      |          68 |
|    3 | Argentina   |          68 |
|    4 | Germany     |          54 |
|    5 | England     |          51 |
|    6 | Spain       |          47 |
|    7 | Uruguay     |          45 |
|    8 | Switzerland |          41 |
|    9 | Belgium     |          39 |
|   10 | Netherlands |          38 |

### Insight

Brazil recorded the highest total goals in the dataset with **78**, followed by France and Argentina with 68 each.


# 4. Which World Cup Tournaments Had the Most Goals?

### Result

| Rank | World Cup Year | Total Goals | Matches Played | Goals Per Match |
| ---: | -------------: | ----------: | -------------: | --------------: |
|    1 |           2026 |         308 |            104 |            2.96 |
|    2 |           2022 |         170 |             64 |            2.66 |
|    3 |           2014 |         166 |             64 |            2.59 |
|    4 |           2018 |         157 |             64 |            2.45 |
|    5 |           1950 |          87 |             22 |            3.95 |
|    6 |           1938 |          82 |             19 |            4.32 |
|    7 |           1934 |          70 |             17 |            4.12 |
|    8 |           1930 |          69 |             18 |            3.83 |


### Insight

The 2026 World Cup recorded the highest total goals (308), largely reflecting its larger number of matches. However, 1938 had the highest scoring rate at 4.32 goals per match, showing that early World Cups generally had much higher scoring intensity than recent tournaments.

#  5. Does Home-Field Advantage Actually Work?

### Result

| Rank | Team         | Host Win Rate | Non-Host Win Rate | Difference |
| ---: | ------------ | ------------: | ----------------: | ---------: |
|    1 | Uruguay      |         1.000 |             0.379 |     +0.621 |
|    2 | Chile        |         0.667 |             0.259 |     +0.407 |
|    3 | England      |         0.833 |             0.447 |     +0.386 |
|    4 | Russia       |         0.600 |             0.222 |     +0.378 |
|    5 | France       |         0.889 |             0.542 |     +0.347 |
|    6 | Italy        |         0.833 |             0.507 |     +0.326 |
|    7 | Sweden       |         0.667 |             0.360 |     +0.307 |
|    8 | Mexico       |         0.556 |             0.286 |     +0.270 |
|    9 | Germany      |         0.857 |             0.624 |     +0.233 |
|   10 | South Africa |         0.333 |             0.200 |     +0.133 |
|   11 | Switzerland  |         0.500 |             0.372 |     +0.128 |
|   12 | Argentina    |         0.714 |             0.618 |     +0.096 |
|   13 | Qatar        |         0.000 |             0.000 |      0.000 |
|   14 | Brazil       |         0.615 |             0.698 |     -0.083 |
|   15 | Spain        |         0.200 |             0.543 |     -0.343 |

### Insight

The results suggest that **home-field advantage exists for many host nations**. Uruguay had the largest positive difference at **+0.621**, followed by Chile at +0.407 and England at +0.386.

However, the effect is not universal. Brazil and Spain actually recorded **lower win rates when hosting** than when playing elsewhere.

This suggests that hosting may provide an advantage, but it does **not guarantee better performance**.


#  6. Which Teams Perform Best in Knockout Matches?

### Result

| Rank | Team           | Knockout Matches | Knockout Wins | Win Rate |
| ---: | -------------- | ---------------: | ------------: | -------: |
|    1 | Italy          |               29 |            21 |    72.4% |
|    2 | Germany        |               48 |            34 |    70.8% |
|    3 | Argentina      |               33 |            23 |    69.7% |
|    4 | France         |               33 |            23 |    69.7% |
|    5 | Croatia        |               13 |             9 |    69.2% |
|    6 | Brazil         |               48 |            33 |    68.8% |
|    7 | England        |               29 |            15 |    51.7% |
|    8 | Czechoslovakia |               10 |             5 |    50.0% |
|    9 | Belgium        |               16 |             8 |    50.0% |
|   10 | Spain          |               24 |            12 |    50.0% |
|   11 | Netherlands    |               21 |            10 |    47.6% |
|   12 | Portugal       |               13 |             6 |    46.2% |
|   13 | Uruguay        |               21 |             9 |    42.9% |
|   14 | Sweden         |               19 |             8 |    42.1% |
|   15 | Switzerland    |               11 |             2 |    18.2% |

### Insight

Italy has the highest knockout-stage win rate among teams with at least 10 knockout matches, winning **72.4%** of its knockout games.

Germany and Argentina follow closely at **70.8% and 69.7%**, respectively.



#  7. Which Teams Have Appeared in the World Cup the Most Times?

### Result

| Rank | Team        | Tournaments Appeared |
| ---: | ----------- | -------------------: |
|    1 | Brazil      |                   23 |
|    2 | Germany     |                   21 |
|    3 | Argentina   |                   19 |
|    4 | Mexico      |                   18 |
|    5 | Italy       |                   18 |
|    6 | England     |                   17 |
|    7 | Spain       |                   17 |
|    8 | France      |                   17 |
|    9 | Uruguay     |                   15 |
|   10 | Belgium     |                   15 |
|   11 | Sweden      |                   13 |
|   12 | Switzerland |                   13 |
|   13 | South Korea |                   12 |
|   14 | Netherlands |                   12 |
|   15 | Chile       |                    9 |

### Insight

Brazil has appeared in the most World Cup tournaments, with **23 appearances**, followed by Germany with 21 and Argentina with 19.

Brazil's consistency is particularly notable because it has also topped the rankings for **World Cup titles, matches played, and goals scored** in this analysis.


# Data Cleaning & Validation

The dataset was reviewed for:

* Duplicate records
* Missing values
* Inconsistent stage labels
* Inconsistent team names
* Historical naming differences
* Potential anomalies in goal records

Naming inconsistencies such as variations of **"Third-place match"** were standardized.

Historical names were reviewed carefully rather than automatically merged, since some represent different historical teams or tournament eras.

The analysis also revealed unusually low goal totals for certain tournaments, highlighting the importance of validating SQL results against the underlying data.

---

#  SQL Skills Demonstrated

* `SELECT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `LIMIT`
* `COUNT()`
* `COUNT(DISTINCT)`
* `SUM()`
* `AVG()`
* `CASE`
* `UNION`
* `UNION ALL`
* Common Table Expressions (CTEs)

---

# Key Takeaways

The analysis highlights several interesting patterns:

* **Brazil** leads in World Cup titles, matches played, goals scored, and tournament appearances.
* **Italy** has the highest knockout-stage win rate among teams with at least 10 knockout matches.
* **Uruguay** shows the largest positive difference between hosting and non-hosting win rates.
* Home advantage appears beneficial for many host nations, but the effect is **not universal**.
* Early World Cups show particularly high goals-per-match averages.
* Data validation identified potential issues with goal records for some tournaments.

---

#  Tools

**Database:** PostgreSQL
**Environment:** pgAdmin 4
**Language:** SQL
**Dataset:** FIFA World Cup historical match data

---

##  Project Outcome

This project demonstrates the ability to move from:

**Raw match data → Data cleaning → Analytical questions → SQL queries → Results → Business insights**

The focus was not simply on writing SQL queries, but on using SQL to investigate meaningful questions and critically evaluate the resulting data.
