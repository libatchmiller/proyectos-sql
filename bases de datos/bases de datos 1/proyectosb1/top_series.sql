/*Objetivo: 

- Correr una subconsulta en sql
- Utiliza una subconsulta para identificar los 3 géneros más populares en función de la cantidad de series.
- Para cada género identifica el titulo de la serie, año de lanzamiento y rating de imdb promedio*/

select 
	  s.titulo,
      genero,
      año_lanzamiento,
      avg(rating_imdb) 
from series as s
join 
episodios as e on s.serie_id=e.serie_id
Where
	 s.genero in (select genero from (select genero,count(serie_id) from series
                  group by genero order by count(serie_id) desc limit 3) 
                  as top_series )
	 
group by s.serie_id 
order by avg(rating_imdb) desc;
