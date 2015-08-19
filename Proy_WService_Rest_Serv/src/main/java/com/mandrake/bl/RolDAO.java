package com.mandrake.bl;

import java.util.List;

import com.mandrake.model.RolDTO;

public interface RolDAO 
{
	
	List<RolDTO> selectAll();
	RolDTO       select(RolDTO _rolDTO);
	Integer      delete(RolDTO _rolDTO);
	Integer      insert(RolDTO _rolDTO);
  
}
