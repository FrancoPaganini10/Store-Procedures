create procedure S_Pais
@paisid int = null,
@nombre varchar(128) = null
as 
begin
    select 
        paisid,
        nombre
    from vPais
    where paisid = ISNULL(@paisid, paisid)
      and nombre = ISNULL(@nombre, nombre);
end;

create procedure S_Genero
@GenId int = null,
@nombre varchar(128) = null
as
begin
    select
        GeneroId,
        nombre
    from vGenero
    where GeneroId = isnull(@GenId, GeneroId)
      and nombre = isnull(@nombre, nombre);
end;

create procedure S_EstadoC
@EstC_id int = null,
@nombre varchar(128) = null
as
begin
    select
        EstC_Id,
        nombre
    from vEstadoCivil
    where EstC_Id = isnull(@EstC_id, EstC_Id)
      and nombre = isnull(@nombre, nombre);
end;

create procedure S_TipoDom
@TipoDomId int = null,
@nombre varchar(128) = null
as
begin
    select
        TipoDomId,
        nombre
    from vTipoDomicilio
    where TipoDomId = isnull(@TipoDomId, TipoDomId)
      and nombre = isnull(@nombre, nombre);
end;

create procedure S_TipoCont
@TipoContId int = null,
@nombre varchar(128) = null
as
begin
    select
        tipocontactoid,
        nombre
    from vTipoContacto
    where tipocontactoid = isnull(@TipoContId, tipocontactoid)
      and nombre = isnull(@nombre, nombre);
end;

create procedure S_TipoDocumento
@tipodocumentoid int = null,
@tipodocumento varchar(128) = null,
@paisid int = null,
@nombrepais varchar(128) = null
as
begin
    select
        tipodocumentoid,
        tipodocumento,
        paisid,
        nombrepais
    from vTipoDocumento
    where tipodocumentoid = isnull(@tipodocumentoid, tipodocumentoid)
      and tipodocumento = isnull(@tipodocumento, tipodocumento)
      and paisid = isnull(@paisid, paisid)
      and nombrepais = isnull(@nombrepais, nombrepais);
end;

create procedure S_Provincia
@provinciaid int = null,
@provincia varchar(128) = null,
@paisid int = null,
@nombrepais varchar(128) = null
as
begin
    select
        provinciaid,
        provincia,
        paisid,
        nombrepais
    from vProvincia
    where provinciaid = isnull(@provinciaid, provinciaid)
      and provincia = isnull(@provincia, provincia)
      and paisid = isnull(@paisid, paisid)
      and nombrepais = isnull(@nombrepais, nombrepais);
end;

create procedure S_Localidad
@localidadid int = null,
@localidad varchar(128) = null,
@provinciaid int = null,
@provincia varchar(128) = null,
@paisid int = null,
@nombrepais varchar(128) = null
as
begin
    select
        localidadid,
        localidad,
        provinciaid,
        provincia,
        paisid,
        nombrepais
    from vLocalidad
    where localidadid = isnull(@localidadid, localidadid)
      and localidad = isnull(@localidad, localidad)
      and provinciaid = isnull(@provinciaid, provinciaid)
      and provincia = isnull(@provincia, provincia)
      and paisid = isnull(@paisid, paisid)
      and nombrepais = isnull(@nombrepais, nombrepais);
end;

create procedure S_Domicilio
@DomId int = null,
@direccion varchar(128) = null,
@localidad_id int = null,
@localidad varchar(128) = null,
@provincia_id int = null,
@provincia varchar(128) = null,
@pais_id int = null,
@pais varchar(128) = null
as
begin
    select
        DomId,
        direccion,
        localidad_id,
        localidad,
        provincia_id,
        provincia,
        pais_id,
        pais
    from vDomicilio
    where DomId = isnull(@DomId, DomId)
      and direccion = isnull(@direccion, direccion)
      and localidad_id = isnull(@localidad_id, localidad_id)
      and localidad = isnull(@localidad, localidad)
      and provincia_id = isnull(@provincia_id, provincia_id)
      and provincia = isnull(@provincia, provincia)
      and pais_id = isnull(@pais_id, pais_id)
      and pais = isnull(@pais, pais);
end;

create procedure S_Persona
@personaid int = null,
@apellido varchar(128) = null,
@nombre varchar(128) = null,
@documento varchar(64) = null,
@fnacto date = null,
@genero varchar(128) = null,
@estadocivil varchar(128) = null,
@tipodocumento varchar(128) = null
as
begin
    select
        personaid,
        apellido,
        nombre,
        documento,
        fnacto,
        genero,
        estadocivil,
        tipodocumento
    from vPersona
    where personaid = isnull(@personaid, personaid)
      and apellido = isnull(@apellido, apellido)
      and nombre = isnull(@nombre, nombre)
      and documento = isnull(@documento, documento)
      and fnacto = isnull(@fnacto, fnacto)
      and genero = isnull(@genero, genero)
      and estadocivil = isnull(@estadocivil, estadocivil)
      and tipodocumento = isnull(@tipodocumento, tipodocumento);
end;

create procedure S_Contacto
@contactoid int = null,
@contacto varchar(256) = null,
@tipocontacto varchar(128) = null,
@apellido varchar(128) = null,
@nombre varchar(128) = null
as
begin
    select
        contactoid,
        contacto,
        tipocontacto,
        apellido,
        nombre
    from vContacto
    where contactoid = isnull(@contactoid, contactoid)
      and contacto = isnull(@contacto, contacto)
      and apellido = isnull(@apellido, apellido)
      and nombre = isnull(@nombre, nombre);
end;

create procedure S_DomicilioPersona
@domicilidopersonaid int = null,
@tipodomicilioid int = null,
@tipodomicilio varchar(128) = null,
@domicilioid int = null,
@direccion varchar(128) = null,
@codpos varchar(128) = null,
@Persona varchar(128) = null,
@Apellido varchar(128) = null,
@localidad varchar(128) = null,
@provincia varchar(128) = null,
@pais varchar(128) = null
as
begin
    select
        domicilidopersonaid,
        tipodomicilioid,
        tipodomicilio,
        domicilioid,
        direccion,
        codpos,
        Persona,
        Apellido,
        localidad,
        provincia,
        pais
    from vDomicilioPersona
    where domicilidopersonaid = isnull(@domicilidopersonaid, domicilidopersonaid)
      and tipodomicilioid = isnull(@tipodomicilioid, tipodomicilioid)
      and tipodomicilio = isnull(@tipodomicilio, tipodomicilio)
      and domicilioid = isnull(@domicilioid, domicilioid)
      and direccion = isnull(@direccion, direccion)
      and codpos = isnull(@codpos, codpos)
      and Persona = isnull(@Persona, Persona)
      and Apellido = isnull(@Apellido, Apellido)
      and localidad = isnull(@localidad, localidad)
      and provincia = isnull(@provincia, provincia)
      and pais = isnull(@pais, pais);
end;
CREATE PROCEDURE S_Persona
@id int = null,
@apellido varchar(128) = null,
@nombre varchar(128) = null,
@tipodocumento_id int = null,
@documento varchar(64) = null,
@genero_id int = null,
@estadocivil_id int = null,
@fnacto date = null
as
begin
    select
        id,
        apellido,
        nombre,
        tipodocumento_id,
        documento,
        genero_id,
        estadocivil_id,
        fnacto
    from Persona
    where id = isnull(@id, id)
      and apellido = isnull(@apellido, apellido)
      and nombre = isnull(@nombre, nombre)
      and tipodocumento_id = isnull(@tipodocumento_id, tipodocumento_id)
      and documento = isnull(@documento, documento)
      and genero_id = isnull(@genero_id, genero_id)
      and estadocivil_id = isnull(@estadocivil_id, estadocivil_id)
      and fnacto = isnull(@fnacto, fnacto);
end;

CREATE PROCEDURE S_Contacto
@id int = null,                    
@tipocontacto_id int = null,      
@personaid int = null,
@contacto varchar(256) = null      
as
begin
    select
     id,                            
     tipocontacto_id,              
     personaid,                  
     contacto
  from Contacto
  where id = isnull(@id, id)
  and tipocontacto_id = isnull(@tipocontacto_id, tipocontacto_id)
  and personaid = isnull(@personaid, personaid)
  and contacto = isnull(@contacto, contacto);
end;