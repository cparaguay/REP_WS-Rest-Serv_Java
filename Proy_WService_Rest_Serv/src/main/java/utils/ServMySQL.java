package utils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ServMySQL 
{
	private   Connection        conexion;
	protected CallableStatement cst=null;
	protected PreparedStatement pst=null;
	protected ResultSet         rs=null;
	
	protected Connection getConexion()
	{
		return conexion;
	}
	
	protected void openConexion()
	{
		conexion=MySQLConexion.getConnection();
	}
	
	protected void commit() throws Exception
	{
		conexion.commit();
	}
	
	protected void rollback() throws Exception
	{
		conexion.rollback();
	}
	protected void closeConexion()
	{
		try 
		{
			if(conexion!=null)
			{
				conexion.close();
			}
			if(cst!=null)
			{
				cst.close();
			}
			
			if(pst!=null)
			{
				pst.close();
			}
			if(rs!=null)
			{
				rs.close();
			}
			
		} 
		catch (Exception e) 
		{
			MessageSystem.messageError(this.getClass(), e, null);
		}
		finally
		{
		}
	}

	protected CallableStatement getCst() 
	{
		return cst;
	}

	protected PreparedStatement getPst() 
	{
		return pst;
	}

	protected ResultSet getRs() 
	{
		return rs;
	}
}
