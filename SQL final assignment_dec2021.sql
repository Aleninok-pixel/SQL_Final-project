Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115
v. Review = 8090 (foreign key business_id)
vi. Checkin = 493
vii. Photo = 6493 (foreign key business_id)
viii. Tip = 3979 (foreign key business_id)
ix. User = 10000
x. Friend = 11
xi. Elite_years = 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: no
	
	
	SQL code used to arrive at answer:
	
SELECT
CASE WHEN COUNT (*) = COUNT (id) THEN 'No' ELSE 'Yes' END AS id
, CASE WHEN COUNT (*) = COUNT (name) THEN 'No' ELSE 'Yes' END AS name
, CASE WHEN COUNT (*) = COUNT (review_count) THEN 'No' ELSE 'Yes' END AS review_count
, CASE WHEN COUNT (*) = COUNT (yelping_since) THEN 'No' ELSE 'Yes' END AS yelping_since
, CASE WHEN COUNT (*) = COUNT (useful) THEN 'No' ELSE 'Yes' END AS useful
, CASE WHEN COUNT (*) = COUNT (funny) THEN 'No' ELSE 'Yes' END AS funny
, CASE WHEN COUNT (*) = COUNT (cool) THEN 'No' ELSE 'Yes' END AS cool
, CASE WHEN COUNT (*) = COUNT (fans) THEN 'No' ELSE 'Yes' END AS fans
, CASE WHEN COUNT (*) = COUNT (average_stars) THEN 'No' ELSE 'Yes' END AS average_stars
, CASE WHEN COUNT (*) = COUNT (compliment_hot) THEN 'No' ELSE 'Yes' END AS compliment_hot
, CASE WHEN COUNT (*) = COUNT (compliment_more) THEN 'No' ELSE 'Yes' END AS compliment_more
, CASE WHEN COUNT (*) = COUNT (compliment_profile) THEN 'No' ELSE 'Yes' END AS compliment_profile
, CASE WHEN COUNT (*) = COUNT (compliment_cute) THEN 'No' ELSE 'Yes' END AS compliment_cute
, CASE WHEN COUNT (*) = COUNT (compliment_list) THEN 'No' ELSE 'Yes' END AS compliment_list
, CASE WHEN COUNT (*) = COUNT (compliment_note) THEN 'No' ELSE 'Yes' END AS compliment_note
, CASE WHEN COUNT (*) = COUNT (compliment_plain) THEN 'No' ELSE 'Yes' END AS compliment_plain
, CASE WHEN COUNT (*) = COUNT (compliment_cool) THEN 'No' ELSE 'Yes' END AS compliment_cool
, CASE WHEN COUNT (*) = COUNT (compliment_funny) THEN 'No' ELSE 'Yes' END AS compliment_funny
, CASE WHEN COUNT (*) = COUNT (compliment_writer) THEN 'No' ELSE 'Yes' END AS compliment_writer
, CASE WHEN COUNT (*) = COUNT (compliment_photos) THEN 'No' ELSE 'Yes' END AS compliment_photos
FROM user;	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min:	1.0	max:	5.0	avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min:	0	max:	2	avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min:	1	max:	53	avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min:	0	max:	2000	avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:

SELECT
city
, review_count
FROM business
GROUP BY city
ORDER BY review_count DESC;
	
	
	Copy and Paste the Result Below:

+------------------------+--------------+
| city                   | review_count |
+------------------------+--------------+
| Woodmere Village       |          242 |
| Mount Lebanon          |          138 |
| Charlotte              |          120 |
| McMurray               |          112 |
| North York             |          109 |
| Enterprise             |           89 |
| Matthews               |           77 |
| Munroe Falls           |           74 |
| Ahwatukee              |           69 |
| Pittsburgh             |           68 |
| Woodmere               |           68 |
| Tolleson               |           65 |
| Pineville              |           63 |
| Carnegie               |           61 |
| Macedonia              |           58 |
| Markham                |           54 |
| Whitchurch-Stouffville |           52 |
| Windsor                |           50 |
| Goodyear               |           49 |
| Gibsonia               |           45 |
| Summerlin              |           44 |
| Peninsula              |           42 |
| Richfield              |           42 |
| Dormont                |           40 |
| nboulder city          |           40 |
+------------------------+--------------+
(Output limit exceeded, 25 of 362 total rows shown)
	

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

SELECT
stars
, review_count
FROM business
WHERE city = 'Avon'
GROUP BY stars;


Copy and Paste the Resulting Table Below (2 columns Ã¢â‚¬â€œ star rating and count):

+-------+--------------+
| stars | review_count |
+-------+--------------+
|   1.5 |           10 |
|   2.5 |            3 |
|   3.5 |           50 |
|   4.0 |           17 |
|   4.5 |           31 |
|   5.0 |            3 |
+-------+--------------+


ii. Beachwood

SQL code used to arrive at answer:

SELECT
stars
, review_count
FROM business
WHERE city = 'Beachwood'
GROUP BY stars;


Copy and Paste the Resulting Table Below (2 columns Ã¢â‚¬â€œ star rating and count):

+-------+--------------+
| stars | review_count |
+-------+--------------+
|   2.0 |            8 |
|   2.5 |            3 |
|   3.0 |            3 |
|   3.5 |            3 |
|   4.0 |           69 |
|   4.5 |            3 |
|   5.0 |            4 |
+-------+--------------+		


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:

SELECT
name
, review_count
FROM user
ORDER BY review_count DESC
LIMIT 3;	
		
	Copy and Paste the Result Below:

+--------+--------------+
| name   | review_count |
+--------+--------------+
| Gerald |         2000 |
| Sara   |         1629 |
| Yuri   |         1339 |
+--------+--------------+		


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:

There is no positive correlation between reviews and fans. As we compare two query results containing # of reviews and # of fans for each user, one of which sorted by review_count column in descending order and the other â€“ by fans column in descending order, we see that users with high # of reviews have not the highest # of fans and otherwise. For example, second and third top users based on their total number of reviews have very low # of fans, around 10 and 7 times lower than highest # of fans, accordingly. While first and second top users based on their total number of fans have 3 and 2 times, accordingly, lower number of reviews than user with highest number of reviews. Below I provide two query results that were used for analysis.

Query result sorted by review_count column in descending order
+-----------+--------------+------+
| name      | review_count | fans |
+-----------+--------------+------+
| Gerald    |         2000 |  253 |
| Sara      |         1629 |   50 |
| Yuri      |         1339 |   76 |
| .Hon      |         1246 |  101 |
| William   |         1215 |  126 |
| Harald    |         1153 |  311 |
| eric      |         1116 |   16 |
| Roanna    |         1039 |  104 |
| Mimi      |          968 |  497 |
| Christine |          930 |  173 |
| Ed        |          904 |   38 |
| Nicole    |          864 |   43 |
| Fran      |          862 |  124 |
| Mark      |          861 |  115 |
| Christina |          842 |   85 |
| Dominic   |          836 |   37 |
| Lissa     |          834 |  120 |
| Lisa      |          813 |  159 |
| Alison    |          775 |   61 |
| Sui       |          754 |   78 |
| Tim       |          702 |   35 |
| L         |          696 |   10 |
| Angela    |          694 |  101 |
| Crissy    |          676 |   25 |
| Lyn       |          675 |   45 |
+-----------+--------------+------+
(Output limit exceeded, 25 of 10000 total rows shown)
	

Query result sorted by fans column in descending order
+-----------+--------------+------+
| name      | review_count | fans |
+-----------+--------------+------+
| Amy       |          609 |  503 |
| Mimi      |          968 |  497 |
| Harald    |         1153 |  311 |
| Gerald    |         2000 |  253 |
| Christine |          930 |  173 |
| Lisa      |          813 |  159 |
| Cat       |          377 |  133 |
| William   |         1215 |  126 |
| Fran      |          862 |  124 |
| Lissa     |          834 |  120 |
| Mark      |          861 |  115 |
| Tiffany   |          408 |  111 |
| bernice   |          255 |  105 |
| Roanna    |         1039 |  104 |
| Angela    |          694 |  101 |
| .Hon      |         1246 |  101 |
| Ben       |          307 |   96 |
| Linda     |          584 |   89 |
| Christina |          842 |   85 |
| Jessica   |          220 |   84 |
| Greg      |          408 |   81 |
| Nieves    |          178 |   80 |
| Sui       |          754 |   78 |
| Yuri      |         1339 |   76 |
| Nicole    |          161 |   73 |
+-----------+--------------+------+
(Output limit exceeded, 25 of 10000 total rows shown)

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: There are more reviews with the word "love" than with word "hate".

	
	SQL code used to arrive at answer:

SELECT
CASE
    WHEN 
        (SELECT
        COUNT (text)
        FROM review
        WHERE text LIKE '%love%')
        >
        (SELECT
        COUNT (text)
        FROM review
        WHERE text LIKE '%hate%')
    THEN 'There are more reviews with the word "love" than with word "hate"'
    WHEN 
        (SELECT
        COUNT (text)
        FROM review
        WHERE text LIKE '%hate%')
        >
        (SELECT
        COUNT (text)
        FROM review
        WHERE text LIKE '%love%')
    THEN 'There are more reviews with the word "hate" than with word "love"'
    ELSE 'There are the same number of reviews with word "love" and word "hate"'
END AS result;

	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:

SELECT
name
, fans
FROM user
ORDER BY fans DESC
LIMIT 10;
	
	
	Copy and Paste the Result Below:

+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. 
	I choosed city Toronto and category Restaurant. I chosed to group businesses in city. 


Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?

No. We can conclude that 2-3 star group and 4-5 star group have similar distribution af working weekly hours as: 
1) Difference in average hours per week is greater 4.5 hours, which is immaterial figure in erms of week hours. 
2) In 2-3 star group minimum value is 13 hours, while in 4-5 star group â€“ 24 hours, difference is 11 hours. Business with such low working hours is an outlier. 
2) Maximum number of hours in 2-3 star group is 84 hours that is higher on 3 hours than in 4-5 star group. That difference is insignificant in relation to week hours.
However, if we had larger population to analyse, then relusts could be significantly different as in our case total population number is only 6 businesses (3 in each group).

ii. Do the two groups you chose to analyze have a different number of reviews?

Yes. Group with lower star rating has 1.6 times lower number of reviews than the other. Total number of reviews for 2-3 star group is 35, while for 4-5 star group â€“ 56.
         
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

Yes. We can infer information about districts, where most of the low (2-3-star) and high (4-5-star) businesses are concentrated. In city Toronto district with highest number of low star restaurants is Downtown Coreand and Entertainment District, while high star businesses are concentarted in Etobicoke, High Park, Niagara and Willowdale. That could illustrate which district is prestige or not, but our analysis based on quite small dataset, which means that our findings could be biased.



SQL code used for analysis: 

Query for point i and ii:

SELECT
/*output resulting table with minimum, maximum and average week hours and number of review for two groups based on stars*/
star_rating
, MIN (total_hours) AS min_week_hours
, MAX (total_hours) AS max_week_hours
, AVG (total_hours) AS average_week_hours
, total_number_of_reviews
FROM (SELECT
    /*output names of businesses (for futher grouping based on businesses' name as each business has several lines with working hours for each day of week) and total number of reviews for each business*/
    b.name
    , sum(b.review_count) AS total_number_of_reviews

    /*transform data in column "stars" into three categories: '2-3 stars', '4-5 stars' and '0'*/
    , CASE
        WHEN b.stars >= 2 AND b.stars <= 3 THEN '2-3 stars'
        WHEN b.stars >= 4 AND b.stars <= 5 THEN '4-5 stars'
        ELSE '0'
    END AS star_rating

    /*ouput working hours per week for each business*/
    , SUM(working_hours) AS total_hours
    
    FROM business b 
    LEFT JOIN category c ON b.id = c.business_id 
    INNER JOIN 
    /*join calculated working hours for each business to table 'business' so we can use newly calculated column in futher analysis*/ 
        (SELECT 
        business_id
        , (STRFTIME('%H:%M', (CASE
                WHEN hours LIKE 'Monday%' THEN SUBSTR(hours, 14, 5)
                WHEN hours LIKE 'Tuesday%' THEN SUBSTR(hours, 15, 5)
                WHEN hours LIKE 'Wednesday%' THEN SUBSTR(hours, 17, 5)
                WHEN hours LIKE 'Thursday%' THEN SUBSTR(hours, 16, 5)
                WHEN hours LIKE 'Friday%' THEN SUBSTR(hours, 14, 5)
                WHEN hours LIKE 'Saturday%' THEN SUBSTR(hours, 16, 5)
                WHEN hours LIKE 'Sunday%' THEN SUBSTR(hours, 14, 5)
            END))
        - STRFTIME('%H:%M', (CASE
                WHEN hours LIKE 'Monday%' THEN SUBSTR(hours, 8, 5)
                WHEN hours LIKE 'Tuesday%' THEN SUBSTR(hours, 9, 5)
                WHEN hours LIKE 'Wednesday%' THEN SUBSTR(hours, 11, 5)
                WHEN hours LIKE 'Thursday%' THEN SUBSTR(hours, 10, 5)
                WHEN hours LIKE 'Friday%' THEN SUBSTR(hours, 8, 5)
                WHEN hours LIKE 'Saturday%' THEN SUBSTR(hours, 10, 5)
                WHEN hours LIKE 'Sunday%' THEN SUBSTR(hours, 8, 5)
            END))) AS working_hours 
        FROM hours) AS h ON b.id = h.business_id 

    WHERE city = 'Toronto'
    AND c.category = 'Restaurants'

    /*group by businesses' names and star_rating to output number of reviews and number of week hours for each business*/
    GROUP BY b.name, star_rating) AS grouped_business

GROUP BY star_rating;

Query for point iii:

SELECT
neighborhood
, COUNT(_2_3_star_rating) AS number_of_low_star_businesses
, COUNT(_4_5_star_rating) AS number_of_high_star_businesses        
FROM (SELECT
    id  
    , neighborhood
    , city
    /*create two columns with transformed data from column "stars": one for '2-3 stars' businesses, second for '4-5 stars' businesses. In each column there will be information are there any businesses from corresponding group*/
    , (CASE
        WHEN b.stars >= 2 AND b.stars <= 3 THEN '2-3 stars'
        END) AS _2_3_star_rating
    , (CASE
        WHEN b.stars >= 4 AND b.stars <= 5 THEN '4-5 stars'
        END) AS _4_5_star_rating
    FROM business b INNER JOIN category c ON b.id = c.business_id
    WHERE city = 'Toronto' AND c.category = 'Restaurants') AS b

/*group data by neighbourhood to output total number of 2-3 and 4-5 star businesses in each neighbourhood*/ 
GROUP BY neighborhood

/*eliminate all neighbourhoods where there are no businesses and sort output in descending order by businesses with 2-3 stars*/
HAVING number_of_high_star_businesses <> 0 OR number_of_low_star_businesses <> 0
ORDER BY number_of_low_star_businesses DESC;		
		

2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:

Number of reviews with words â€œusefulâ€ and â€œcoolâ€. Closed businesses have around 7 times less reviews with these words then open businesses.        
         
ii. Difference 2:
         
Average number of check-ins. Open businesses have higher average number of check-ins than closed businesses (1.65 and 1.25, accordingly)        
         
SQL code used for analysis:

/*output data about open(1)/closed(0) businesses, total number of reviews  with words 'useful' and 'cool' and average number of check-ins*/
SELECT 
b.is_open
, SUM(r.useful) AS number_reviews_useful
, SUM(r.cool) AS number_revies_cool
, AVG (c.count) AS average_number_checkins
FROM business b 
LEFT JOIN review r ON b.id = r.business_id
LEFT JOIN checkin c ON b.id = c.business_id

/*group by column 'is_open' to get overall results for two groups: open (1) and closed (0)*/
GROUP BY b.is_open;
	
	

3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do: 

Correlation between ambience of restaurants and their star rating.
         
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:


	To make an analysis of correlation between ambience of restaurants and their number of stars it is need following information: list of all businesses with id in category â€œRestaurantâ€, list of star rating for all businesses with id and list of ambience description for all businesses with id.
	I chose that data to conduct precise analysis between ambience and star ratings of restaurants as without this information work will be incomplete.
                           
                  
iii. Output of your finished dataset:

+-----------------------+-----------------------+--------------+---------------+--------------+
| Ambience              | COUNT (a.business_id) | MIN(b.stars) |  AVG(b.stars) | MAX(b.stars) |
+-----------------------+-----------------------+--------------+---------------+--------------+
| Intimate              |                     1 |          4.0 |           4.0 |          4.0 |
| Romantic and intimate |                     1 |          4.0 |           4.0 |          4.0 |
| Casual                |                    12 |          3.0 | 3.54166666667 |          4.5 |
| None                  |                    10 |          2.0 |          2.95 |          3.5 |
| Divey                 |                     1 |          2.5 |           2.5 |          2.5 |
+-----------------------+-----------------------+--------------+---------------+--------------+
         
         
iv. Provide the SQL code you used to create your final dataset:
SELECT
/*Transform data in more convinient and readable form. During the analysis of all data in column "value" with restrictions that category is Restaurant and  attribute name is Ambience it could be seen that in column "value" there is only 7 unique results in terms of text and only 5 unique terms in terms of context */
CASE 
    WHEN a.value = '{"romantic": false, "intimate": false, "classy": false, "hipster": false, "divey": false, "touristy": false, "trendy": false, "upscale": false, "casual": false}'
        OR a.value = '{"romantic": false, "intimate": false, "classy": false, "hipster": false, "touristy": false, "trendy": false, "upscale": false, "casual": false}'
    THEN 'None'
    
    WHEN a.value = '{"romantic": false, "intimate": false, "classy": false, "hipster": false, "divey": false, "touristy": false, "trendy": false, "upscale": false, "casual": true}'
    OR a.value = '{"romantic": false, "intimate": false, "classy": false, "hipster": false, "touristy": false, "trendy": false, "upscale": false, "casual": true}'
    THEN 'Casual'
    
    WHEN a.value = '{"romantic": false, "intimate": false, "classy": false, "hipster": false, "divey": true, "touristy": false, "trendy": false, "upscale": false, "casual": false}'
    THEN 'Divey'
    
    WHEN a.value = '{"romantic": false, "intimate": true, "classy": false, "hipster": false, "touristy": false, "trendy": false, "upscale": false, "casual": false}' 
    THEN 'Intimate'
    
    WHEN a.value = '{"romantic": true, "intimate": true, "classy": false, "hipster": false, "touristy": false, "trendy": false, "upscale": false, "casual": false}'
    THEN 'Romantic and intimate'
END AS Ambience

/*output information for analysis such as total number of restaurants that belongs to each ambience category and statistical information about star distribution in each ambience category(min, average, max)*/
, COUNT (a.business_id)
, MIN(b.stars)
, AVG(b.stars)
, MAX(b.stars)
FROM attribute a INNER JOIN business b ON a.business_id = b.id
INNER JOIN category c ON a.business_id = c.business_id 
WHERE a.name = 'Ambience' AND c.category = 'Restaurants'
GROUP BY Ambience
ORDER BY AVG(b.stars) DESC;