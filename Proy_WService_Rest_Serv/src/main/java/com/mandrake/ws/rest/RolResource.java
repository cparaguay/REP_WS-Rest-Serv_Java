package com.mandrake.ws.rest;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.mandrake.model.RolDTO;
import com.mandrake.service.RolService;
import com.mandrake.service.impl.RolServiceImpl;

@Path(value="/Rol")
public class RolResource
{
	/* 
	  Instanciamos el servicio 
	*/
	RolService servRol=new RolServiceImpl();
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<RolDTO> listarRolesJSON()
	{
		return servRol.listar();
	}
	
	@GET
	@Path("/{_idRol}")
	@Produces(MediaType.APPLICATION_JSON)
	public RolDTO buscarRol(@PathParam("_idRol")Integer _idRol)
	{
		RolDTO rolDTO=new RolDTO();
		rolDTO.setIdRol(_idRol);
		return servRol.buscar(rolDTO);
	}
	
	/*
	  Usaremos GET, ya que necesitamos un mensajito de confirmacion
	 */
	@GET
	@Path("/Delete/{_idRol}")
	@Produces(MediaType.APPLICATION_JSON)
	public String delete(@PathParam("_idRol")Integer _idRol)
	{
		RolDTO rolDTO=new  RolDTO();
		rolDTO.setIdRol(_idRol);
		
		return ""+servRol.delete(rolDTO);
    }
	

	
	
	@POST
	@Path("/Insert")
	@Consumes(MediaType.APPLICATION_JSON)
	public void insert(RolDTO _newRol)
	{
		servRol.insert(_newRol);
	}
	
	
	
}
