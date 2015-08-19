package mapper.impl;

import java.sql.ResultSet;

import com.mandrake.model.RolDTO;

import mapper.RolMapper;

public class RolMapperImpl implements RolMapper 
{
	
	public RolDTO mp_RolDTO(ResultSet rs)
	{
		RolDTO rolDTO=new RolDTO();
		try
		{
			rolDTO.setIdRol(rs.getInt("idrol"));
			rolDTO.setRol(rs.getString("rol"));
			
		}
		catch(Exception e)
		{
		 System.out.println("Error --> mp_RolDTO : "+e);
		}
	return rolDTO;
	}

	@Override
	public String sql_selectAll() 
	{
		String sql="SELECT * FROM tb_rol";
		
		return sql;
	}

	@Override
	public String sql_selectOne(RolDTO _rolDTO) 
	{
		String sql="SELECT * FROM tb_rol WHERE idrol="+_rolDTO.getIdRol();
		return sql;
	}

	@Override
	public String sql_deleteOne(RolDTO _rolDTO) 
	{
		String sql="DELETE FROM tb_rol WHERE idrol="+_rolDTO.getIdRol();
		return sql;
	}

	@Override
	public String sql_insert(RolDTO _rolDTO) 
	{
		String sql="INSERT INTO tb_rol VALUES (?, ?)";
		return sql;
	}

}
