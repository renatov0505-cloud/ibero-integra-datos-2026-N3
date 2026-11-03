CREATE VIEW vw_Gold_Cliente_360 AS
SELECT
    c.cliente_id,
    LTRIM(RTRIM(c.nombre))        AS nombre,
    LOWER(LTRIM(RTRIM(c.email))) AS email,
    ISNULL(c.ciudad, 'Sin ciudad') AS ciudad,
    (SELECT COUNT(*) FROM Tabla_Ventas v WHERE v.cliente_id = c.cliente_id) AS total_ventas,
    (SELECT ISNULL(SUM(monto_venta), 0) FROM Tabla_Ventas v WHERE v.cliente_id = c.cliente_id) AS monto_total,
    (SELECT COUNT(*) FROM Tabla_Tickets t WHERE t.cliente_id = c.cliente_id) AS total_tickets,
    (SELECT COUNT(*) FROM Tabla_Interacciones i
     WHERE LOWER(LTRIM(RTRIM(i.email_usuario))) = LOWER(LTRIM(RTRIM(c.email)))) AS total_interacciones
FROM Tabla_Clientes c;
GO

select * from vw_Gold_Cliente_360