CREATE TABLE step3
SELECT Author_ID, sum_sales_royalties FROM
(SELECT Title_ID, Author_ID, sum(Sales_Royalties) AS sum_sales_royalties FROM
(SELECT titles.title_id AS Title_ID, authors.au_id AS Author_ID, ROUND((titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100), 2) AS Sales_Royalties FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
LEFT JOIN sales
ON titleauthor.title_id = sales.title_id) AS step1
GROUP BY Title_ID, Author_ID
ORDER BY SUM(Sales_Royalties) DESC) as step2
GROUP BY Author_ID, sum_sales_royalties
ORDER BY sum_sales_royalties DESC
LIMIT 3;