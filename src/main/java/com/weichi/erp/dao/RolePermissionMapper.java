package com.weichi.erp.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.weichi.erp.domain.RolePermission;

public interface RolePermissionMapper extends BaseMapper<RolePermission> {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_permission
     *
     * @mbggenerated Thu Jun 07 15:18:20 CST 2018
     */
    RolePermission selectByPrimaryKey(Long id);
}