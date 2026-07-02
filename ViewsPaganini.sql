create view vPais as
select id as paisid, nombre
from Pais;

create view vGenero as
select id as GeneroId, nombre
from Genero;
create view vEstadoCivil as
select id as EstC_Id, nombre
from EstadoCivil;

create view vTipoDomicilio as
select id as TipoDomId, nombre
from TipoDomicilio;

create view vTipoContacto as
select id as tipocontactoid, nombre
from TipoContacto;

create view vTipoDocumento as
select 
    td.id as tipodocumentoid, 
    td.nombre  as tipodocumento,
    p.id as paisid,
    p.nombre as nombrepais
from TipoDocumento td
inner join Pais p
    on td.pais_id = p.id;

create view vProvincia as
select 
    pr.id as provinciaid,
    pr.nombre as provincia,
    p.id as paisid,
    p.nombre as nombrepais
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
from Localidad l
inner join Provincia pr
    on l.provincia_id = pr.id
inner join Pais p
    on pr.pais_id = p.id;


create view vDomicilio as
select 
    d.id as DomId,
    d.direccion as direccion,
    l.id as localidad_id,
    l.nombre as localidad,
    pr.id as provincia_id,
    pr.nombre as provincia, 
    pa.id as pais_id,
    pa.nombre as pais
from Domicilio d
inner join Localidad l
  on l.id = d.localidad_id
inner join Provincia pr
  on pr.id = l.provincia_id
inner join Pais pa
  on pa.id = pr.pais_id; 
 drop view vDomicilio

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
    on c.personaid = pe.id;
  

create table Persona (
    id INTEGER primary key identity(1,1),
    apellido varchar(128) not null,
    nombre varchar(128) not null,
    tipodocumento_id INTEGER not null,
    documento varchar(64) not null,
    genero_id INTEGER not null,
    estadocivil_id INTEGER not null,
    fnacto date not null,
    constraint fk_per_tdoc foreign key (tipodocumento_id) 
        references TipoDocumento(id),
    constraint fk_per_gen foreign key (genero_id)
        references Genero(id),
    constraint fk_per_eciv foreign key (estadocivil_id)
        references EstadoCivil(id),
    constraint unq_persona unique(tipodocumento_id, documento));

create table Contacto (
    id INTEGER primary key identity(1,1),
    tipocontacto_id INTEGER not null,
    personaid INTEGER not null,
    contacto varchar(256) not null,
    constraint fk_cont_tipo foreign key (tipocontacto_id)
        references TipoContacto(id),
    constraint fk_cont_pers foreign key (personaid)
        references Persona(id));
        drop table contacto

create table DomicilioPersona (
    id INTEGER primary key identity(1,1),
    tipodomicilio_id INTEGER not null,
    domicilio_id INTEGER not null,
    persona_id INTEGER not null,
    constraint fk_domper_tipo foreign key (tipodomicilio_id)
        references TipoDomicilio(id),
    constraint fk_domper_dom foreign key (domicilio_id)
        references Domicilio(id),
    constraint fk_domper_per foreign key (persona_id)
        references Persona(id));


