Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
The ID sequence always starts from 1 and increments continuously.
 

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, 
there is no need to change the last one's seat.


Solution:

select if(id < (select max(id) from Seat), 
    if(id % 2 = 0, id-1, id+1), 
    if(id % 2 = 0, id-1, id)) as id, student
from Seat
order by id

Query-2:

select(
    case
    when mod(id,2) != 0 and counts != id then id+1
    when mod(id,2) != 0 and counts = id then id
    else id-1
end
)as id,student from seat,(
    select count(*) as counts from seat
) as alias
order by id asc

Query-3:

select 
    a.id,
    case when a.id % 2 = 1 and b.id is not null then b.student 
        when a.id % 2 = 0 then c.student 
        else a.student end as student
from Seat a
left join Seat b
on a.id=b.id - 1
left join Seat c
on a.id=c.id + 1