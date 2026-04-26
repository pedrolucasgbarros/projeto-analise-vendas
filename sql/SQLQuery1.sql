

USE ProjetoAnaliseVendas;
GO



SELECT COUNT(*) AS total_linhas  /*contar linhas */
FROM dbo.sales_clean;



SELECT 
    ROUND(SUM(revenue), 2) AS receita_total   /*calcular receita total */
FROM dbo.sales_clean;




SELECT 
    ROUND(SUM(revenue), 2) AS receita_total,   
    ROUND(SUM(profit), 2) AS lucro_total       /*calcular lucro total  */
FROM dbo.sales_clean;




SELECT 
    ROUND(SUM(revenue), 2) AS receita_total,
    ROUND(SUM(profit), 2) AS lucro_total,
    ROUND(SUM(profit) / SUM(revenue), 4) AS margem_geral   /*calcular margem geral  */
FROM dbo.sales_clean;




SELECT
    year,
    ROUND(SUM(revenue), 2) AS receita_total_ano   /*calcular receita por ano  */
FROM dbo.sales_clean
GROUP BY year
ORDER BY year;




SELECT
    year,
    ROUND(SUM(quantity), 2) AS total_quantity_ano   /*calcular quantidade vendida por ano*/
FROM dbo.sales_clean
GROUP BY year
ORDER BY year;




SELECT
    year,
    ROUND(AVG(unit_price), 2) AS media_unit_price  /* calcular preço médio */
FROM dbo.sales_clean
GROUP BY year
ORDER BY year;




SELECT
    MIN(unit_price) AS preco_minimo,
    MAX(unit_price) AS preco_maximo              /* calcular preço mínimo e máximo */
FROM dbo.sales_clean;




SELECT
    category,
    ROUND(SUM(revenue), 2) AS receita_total,      /* receita e lucro por categoria */
    ROUND(SUM(profit), 2) AS lucro_total
FROM dbo.sales_clean
GROUP BY category
ORDER BY receita_total DESC;




SELECT TOP 10
    product_name,
    ROUND(SUM(revenue), 2) AS receita_total,        /* top 10 produtos por receita */
    ROUND(SUM(profit), 2) AS lucro_total
FROM dbo.sales_clean
GROUP BY product_name
ORDER BY receita_total DESC;




SELECT
    region,
    ROUND(SUM(revenue), 2) AS receita_total,                 /* perfomance por região */
    ROUND(SUM(profit), 2) AS lucro_total
FROM dbo.sales_clean
GROUP BY region
ORDER BY receita_total DESC;
