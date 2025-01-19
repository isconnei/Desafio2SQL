CREATE TABLE INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR); INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '2021-01-01', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '2021-01-01', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 39, '2021-01-02', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 81, '2021-01-02', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '2021-01-03', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 91, '2021-01-03', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 48, '2021-01-04', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 45, '2021-01-04', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 55, '2021-01-05', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 33, '2021-01-05', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 18, '2021-01-06', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '2021-01-06', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 34, '2021-01-07', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 24, '2021-01-07', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 83, '2021-01-08', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 99, '2021-01-08', 'Página' );

-------------------
--Requerimiento 1:-
-------------------
select count(1) from inscritos;

-------------------
--Requerimiento 2:-
-------------------
select sum(cantidad) from inscritos;

-------------------
--Requerimiento 3:-
-------------------
select *
from inscritos
where fecha = (
    select min(fecha)
    from inscritos
);
-------------------
--Requerimiento 4:-
-------------------
select  fecha 
		,sum(cantidad) 
from inscritos
group by fecha
order by 1;

-------------------
--Requerimiento 5:-
-------------------
select fuente
		, sum(cantidad)
from inscritos
group by fuente;

-------------------
--Requerimiento 6:-
-------------------
select fecha ,sum(cantidad)
from inscritos
group by fecha
order by 2 desc
limit 1;

-------------------
--Requerimiento 7:-
-------------------

select fecha
		,fuente
		,sum(cantidad)
from inscritos
where fuente = 'Blog'
group by fecha, fuente
order by 3 desc
limit 1;

-------------------
--Requerimiento 8:-
-------------------

select fecha
		, avg(cantidad)
from inscritos
group by fecha
order by 1;

-------------------
--Requerimiento 9:-
-------------------

select fecha
		, sum(cantidad)
from inscritos
group by fecha
having sum(cantidad) > 50
order by 1;

-------------------
--Requerimiento 10:-
-------------------
with tercer_dia AS (
    select min(fecha) AS fecha_tercer_dia
    from (
        select fecha
        from inscritos
        group by fecha
        order by fecha
        offset 2 limit 1
    ) subquery
)
select 
        fecha,
        AVG(cantidad) AS cantidad_diaria
    from inscritos
    where fecha >= (select fecha_tercer_dia from tercer_dia)
    group by fecha
    order by 1;
