.import --csv mtcars.csv mtcars
.output coefs.csv
.mode csv
.headers ON

with x_tbl as (
  select
    rowid, 
    wt as x 
  from 
    mtcars 
),

avg_x_tbl as (
  select
    avg(x) as avg_x
  from 
    x_tbl
),

y_tbl as (
  select 
    rowid,
    mpg as y
  from 
    mtcars
),

avg_y_tbl as (
  select
    avg(mpg) as avg_y
  from
    mtcars
),

full_data as (
  select 
    x,
    avg_x,
    y,
    avg_y 
  from 
    y_tbl, x_tbl, 
    avg_y_tbl, avg_x_tbl 
  where 
    y_tbl.rowid = x_tbl.rowid
),

beta_tbl as (
  select
    sum(
      (x - avg_x) * (y - avg_y)
    ) / 
    sum(
      (x - avg_x) * (x - avg_x)
    ) as beta
  from 
    full_data
),

alpha_tbl as (
  select
    avg_y - beta * avg_x as alpha
  from 
    beta_tbl,
    avg_y_tbl, 
    avg_x_tbl
)

select 
  alpha, 
  beta 
from 
  alpha_tbl, 
  beta_tbl
;
