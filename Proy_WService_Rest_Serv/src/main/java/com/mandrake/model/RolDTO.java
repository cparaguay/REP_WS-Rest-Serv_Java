package com.mandrake.model;

import javax.xml.bind.annotation.XmlRootElement;

//Necesaria esta anotacion para devolver un XML
@XmlRootElement
public class RolDTO 
{
	private int idRol;
	private String rol;
	
	
	public int getIdRol() 
	{
		return idRol;
	}
	public void setIdRol(int idRol) 
	{
		this.idRol = idRol;
	}
	public String getRol() 
	{
		return rol;
	}
	public void setRol(String rol) 
	{
		this.rol = rol;
	}

}
