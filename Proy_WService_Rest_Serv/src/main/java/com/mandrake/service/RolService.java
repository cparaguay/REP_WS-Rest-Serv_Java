package com.mandrake.service;

import java.util.List;

import com.mandrake.model.RolDTO;

public interface RolService 
{
	List<RolDTO> listar();
	RolDTO buscar(RolDTO _rolDTO);
	Integer delete(RolDTO _rolDTO);
	Integer insert(RolDTO _rolDTO);
}
