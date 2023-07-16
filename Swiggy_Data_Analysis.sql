select * from swiggy;
select count(*) from swiggy;
#1. Restaurants having rating greater than 4.5
select count(distinct restaurant_name) as high_rated_restaurants from swiggy where rating >4.5;

#2. No. 1 City with the highest restaurants
select city, count(distinct restaurant_name) as Restaurant_count from swiggy
group by city order by Restaurant_count desc limit 1;

#3. Count the no. of restaurants having word 'Pizza' in their name
select count(distinct restaurant_name) as Name from swiggy
where restaurant_name like '%Pizza%';
#Name of above resaurants
select distinct restaurant_name from swiggy where restaurant_name like '%Pizza%';

#4. Most common cuisine
select cuisine, count(*) as cuisine_count from swiggy 
group by cuisine order by cuisine_count desc limit 1;

#5. Average rating of restaurant in each city
select city, round(avg(rating),2) as avg_rating from swiggy
group by city;

#6. Highest Price Of Item Under The 'RECOMMENDED' menu category for each restaurant 
select distinct restaurant_name,item,max(price) as high_price from swiggy
where menu_category ='Recommended' group by restaurant_name order by high_price desc;

#7. Top 5 expensive restaurants that offer cuisine other than Indian cuisine
select distinct restaurant_name,cost_per_person as high_price from swiggy where cuisine != 'Indian'
group by restaurant_name order by cost_per_person desc limit 5;

#8. Restaurant having Avg.cost > total avg.cost of all restaurants together
select distinct restaurant_name, cost_per_person from swiggy where cost_per_person > 
(select  avg(cost_per_person) as avg_cost from swiggy);

#9. Restaurants having same name but are present in different Cities
select distinct t1.restaurant_name,t1.city,t2.city from swiggy as t1 
join swiggy as t2
on t1.restaurant_name=t2.restaurant_name and t1.city!=t2.city;

#10. Restaurants that offers most no.of items in 'Main Course'
select distinct restaurant_name, count(item) as items_count from swiggy
where menu_category='Main Course'
group by restaurant_name order by items_count desc limit 1;

#11. 100% Veg restaurants in alphabatical order by name
select distinct restaurant_name,(count(case when veg_or_nonveg ='veg' then 1 end)*100/
count(*)) as veg_pct from swiggy group by restaurant_name 
having veg_pct =100.00 order by veg_pct;

#12. Restaurant providing lowest average for all items
select distinct restaurant_name,round(avg(price),2) as avg_price from swiggy
group by restaurant_name order by avg_price limit 1;

#13. Top 5 restaurants with highest no. of categories 
select distinct restaurant_name, count(distinct menu_category) as category_count from swiggy
group by restaurant_name order by category_count desc limit 5;

#14. Restaurant with highest % of non veg food
select distinct restaurant_name,(count(case when veg_or_nonveg ='non-veg' then 1 end)*100/
count(*)) as nonveg_pct from swiggy group by restaurant_name order by nonveg_pct desc;

