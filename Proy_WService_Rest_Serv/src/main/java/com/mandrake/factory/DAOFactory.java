package com.mandrake.factory;

import com.mandrake.bl.RolDAO;

public abstract class DAOFactory 
{
	public static final int MYSQL=1, SQL=2, ORACLE=3;
	
	
	public abstract RolDAO getRolDAO();
	
	public static DAOFactory getFactory(int _bd)
	{
		
		switch (_bd) 
		{
			case MYSQL:
				      return new MySqlDaoFactory();
	
			default:
				return null;
		}
	}

}
