package com.mandrake.dao;

import java.util.ArrayList;
import java.util.List;

import com.mandrake.bl.RolDAO;
import com.mandrake.model.RolDTO;

import mapper.impl.RolMapperImpl;
import utils.MessageSystem;
import utils.ServMySQL;

public class MySqlRolDAO extends ServMySQL implements RolDAO
{
	
	RolMapperImpl mpRol=new RolMapperImpl();

	@Override
	public List<RolDTO> selectAll() 
	{
		List<RolDTO> listadoRol=new ArrayList<RolDTO>();
		try 
		{
			openConexion();
			
			pst=getConexion().prepareStatement(mpRol.sql_selectAll());
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				RolDTO rolDTO=mpRol.mp_RolDTO(rs);
				listadoRol.add(rolDTO);
			}
			

		} 
		catch (Exception e) 
		{
			MessageSystem.messageError(new Object(){}.getClass(), e, null);
		}
		finally
		{
			closeConexion();
		}
		return listadoRol;
	}

	@Override
	public RolDTO select(RolDTO _rolDTO) 
	{
		RolDTO rolDTO=null;
		try 
		{
			openConexion();
			pst=getConexion().prepareStatement("SELECT * FROM tb_rol WHERE idrol="+_rolDTO.getIdRol());
			rs=pst.executeQuery();
			if(rs.next())
			{
				rolDTO=mpRol.mp_RolDTO(rs);
			}
		} 
		catch (Exception e) 
		{
			MessageSystem.messageError(new Object() {}.getClass(), e, "");
		} 
		finally 
		{
			closeConexion();
		}
		
		return rolDTO;
	}

	@Override
	public Integer delete(RolDTO _rolDTO) 
	{
		Integer rs=0;
		try 
		{
			openConexion();
			pst=getConexion().prepareStatement(mpRol.sql_deleteOne(_rolDTO));
			rs=pst.executeUpdate();
			commit();
		} 
		catch (Exception e) 
		{
			MessageSystem.messageError(new Object(){}.getClass(), e, "");
		} 
		finally 
		{
			closeConexion();
		}
		return rs;
	}

	@Override
	public Integer insert(RolDTO _rolDTO) 
	{
		Integer r=0;
		try 
		{
			openConexion();
			pst=getConexion().prepareStatement("INSERT INTO tb_rol VALUES (?, ?)");
			pst.setInt(1, _rolDTO.getIdRol());
			pst.setString(2, _rolDTO.getRol());
			r=pst.executeUpdate();
			commit();
		} 
		catch (Exception e) 
		{
			MessageSystem.messageError(new Object(){}.getClass(), e, "");
		} 
		finally 
		{
			closeConexion();
		}
		return r;
	}

}
