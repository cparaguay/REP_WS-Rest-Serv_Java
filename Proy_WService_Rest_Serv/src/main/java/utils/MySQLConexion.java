package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import constante.CMySQL;

public class MySQLConexion 
{
	/**
	 * Carga en Memoria el Driver de MySQL
	 */
	static 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) 
		{
			System.out.println("No se encuentra drive!!: "+e);
		}
	}
	
	/**
	 * Retorna una conexión de la Base de Datos MySQL
	 */
	public static Connection getConnection()
	{

		Connection connection=null;
		try 
		{
			connection = DriverManager.getConnection(CMySQL.URL_BD_MYSQL);
			connection.setAutoCommit(false);
		} 
		catch (SQLException e) 
		{
			System.out.println("Error con la BD!!: "+e);

		}
		
		return connection;
	}

}
