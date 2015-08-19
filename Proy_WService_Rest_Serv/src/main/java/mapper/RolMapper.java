package mapper;

import com.mandrake.model.RolDTO;

public interface RolMapper 
{
	String sql_selectAll();
	String sql_selectOne(RolDTO _rolDTO);
	String sql_deleteOne(RolDTO _rolDTO);
	String sql_insert(RolDTO _rolDTO);
}