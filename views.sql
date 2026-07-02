create view vPais as 
select id as paisid, nombre 
from Paris;

create view vGenero as 
select id as generoid, nombre 
from Genero;

create view vEstadoCivil as 
select id as estadocivilid, nombre 
from EstadoCivil;

create view vTipoDomicilio as 
select id as tipodomicilioid, nombre 
from TipoDomicilio;

create view vTipoContacto as 
select id as tipocontactoid, nombre 
from TipoContacto;

    create view vTipoDocumento as
select
    td.id as tipodocumentoid,
    td.nombre as tipodocumento,
    p.id as paisid,
    p.nombre as nombrepais
from TipoDocumento td
inner join Pais p
    on td.pais_id = p.id;

create view vProvincia as 
select 
    pr.id as provinciaid,
    pr.nombre as provincia,
    p. id as pais_id,
    p. nombre as nombrepais
from Provincia pr 
inner join Pais p
 on pr.pais_id = p.id; 

create view vLocalidad as 
select 
    l.id as localidadid,
    l.nombre as localidad,
    pr.id as provinciaid,
    pr.nombre as provincia,
    p.id as paisid,
    p.nombre as nombrepais
from localidad l
inner join Provincia pr 
   on l.provincia_id = pr.id
inner join Pais p 
   on pr.pais_id = p.id;

create view vDomicilio as
select
    d.id as domicilioid,
    d.direccion as domicilio,
    d.codpos,
    l.id as localidadid,
    l.nombre as localidad,
    pr.id as provinciaid,
    pr.nombre as provincia,
    p.id as paisid,
    p.nombre as nombrepais
from Domicilio d
inner join Localidad l
    on d.localidad_id = l.id
inner join Provincia pr
    on l.provincia_id = pr.id
inner join Pais p
    on pr.pais_id = p.id;

create view vPersona as 
select 
    pe.id as personaid,
    pe.apellido,
    pe.nombre,
    pe.documento,
    pe.fnacto,
    g.nombre as genero,
    ec.nombre as estadocivil,
    td.nombre as tipodocumento
from Persona pe
inner join Genero g
        on pe.genero_id = g.id
inner join EstadoCivil ec
        on pe.estadocivil_id = ec.id
 inner join TipoDocumento td
        on pe.tipodocumento_id = td.id;

create view vContacto as
select
    c.id as contactoid,
    c.contacto,
    tc.nombre as tipocontacto,
    pe.apellido,
    pe.nombre
from Contacto c
inner join TipoContacto tc
    on c.tipocontacto_id = tc.id
inner join Persona pe
    on c.persona_id = pe.id;