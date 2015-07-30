package com.xiaoer360.bean;

/**
 * @功能说明：
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-06-08
 */
import org.nutz.dao.entity.annotation.*;

@Table("t_permission")
public class Permission extends BasePojo {

    @Id
    protected long id;
    @Name
    protected String name;
    @Column("ismenu")
    protected boolean ismenu;
    @Column("al")
    protected String alias;
    @Column("dt")
    @ColDefine(type = ColType.VARCHAR, width = 500)
    private String description;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean getIsmenu() {
        return ismenu;
    }

    public void setIsmenu(boolean ismenu) {
        this.ismenu = ismenu;
    }
}