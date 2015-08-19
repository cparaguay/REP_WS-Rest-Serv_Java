package com.mandrake.factory;

import com.mandrake.bl.RolDAO;
import com.mandrake.dao.MySqlRolDAO;

public class MySqlDaoFactory extends DAOFactory 
{

	@Override
	public RolDAO getRolDAO() 
	{
		return new MySqlRolDAO();
	}

}
