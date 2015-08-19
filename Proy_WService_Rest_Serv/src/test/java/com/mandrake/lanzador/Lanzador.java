package com.mandrake.lanzador;

import java.util.List;

import com.mandrake.model.RolDTO;
import com.mandrake.service.impl.RolServiceImpl;

public class Lanzador 
{
	public static void main(String arg[])
	{
		List<RolDTO> listadito=new RolServiceImpl().listar();
		
		System.out.println("Tamaño: "+listadito.size());
		System.out.println("--------------------------------");
		for (RolDTO rolDTO : listadito) 
		{
		  System.out.println(rolDTO.getIdRol()+" --- "+rolDTO.getRol());	
		}
		
		RolDTO _rolDTO=new RolDTO();
		_rolDTO.setIdRol(1);
		
		System.out.println("Buscar: "+new RolServiceImpl().buscar(_rolDTO).getRol());
		
		System.out.println("Resultado: "+new RolServiceImpl().delete(_rolDTO));
	}

}
