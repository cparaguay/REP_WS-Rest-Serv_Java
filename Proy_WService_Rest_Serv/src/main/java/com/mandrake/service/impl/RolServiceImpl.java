package com.mandrake.service.impl;

import java.util.List;

import com.mandrake.bl.RolDAO;
import com.mandrake.factory.DAOFactory;
import com.mandrake.model.RolDTO;
import com.mandrake.service.RolService;

public class RolServiceImpl implements RolService 
{
	
	DAOFactory factory=DAOFactory.getFactory(DAOFactory.MYSQL);
	RolDAO     dao=factory.getRolDAO();

	@Override
	public List<RolDTO> listar() 
	{
		return dao.selectAll();
	}

	@Override
	public RolDTO buscar(RolDTO _rolDTO) 
	{
		return dao.select(_rolDTO);
	}

	@Override
	public Integer delete(RolDTO _rolDTO) 
	{
		return dao.delete(_rolDTO);
	}

	@Override
	public Integer insert(RolDTO _rolDTO) 
	{
		return dao.insert(_rolDTO);
	}

}
