-- Step 1
SELECT titles.title_id AS Title_ID, authors.au_id AS Author_ID, ROUND((titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100), 2) AS Sales_Royalties FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
LEFT JOIN sales
ON titleauthor.title_id = sales.title_id

-- Step 2
SELECT authors.au_id AS 'Author ID', ROUND(COALESCE(SUM(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100), 0), 2) AS Sales_Royalties FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
LEFT JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY Sales_Royalties DESC
LIMIT 3;

-- Step 3
SELECT authors.au_id AS 'Author ID', ROUND(COALESCE(SUM(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100), 0), 2) AS Sales_Royalties FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
LEFT JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY Sales_Royalties DESC
LIMIT 3;