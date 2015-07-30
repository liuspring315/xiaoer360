package com.xiaoer360.bean;

import org.nutz.dao.entity.annotation.*;

import java.util.Date;
import java.util.List;


/**
 * 用户基本信息表
 */
@Table("user_general_info")
public class UserGeneralInfo  extends BasePojo {

	/**
	 * 会员标识
	 */
	@Id
	@Column("id")
	private Integer id;
	/**
     * 0 管理员
	 * 1会员
	 */
	@Column("user_type")
	private Integer userType;
	/**
	 * 用户名
	 */
	@Column("user_name")
	private String userName;
	/**
	 * 电子邮箱
	 */
	@Column("email")
	private String email;
	/**
	 * 密码
	 */
	@Column("password")
    @ColDefine(width=128)
	private String password;
	/**
	 * 姓
	 */
	@Column("family_name")
	private String familyName;
	/**
	 * 真实姓名
	 */
	@Column("last_name")
	private String lastName;
	/**
	 * 移动电话
	 */
	@Column("mobile")
	private String mobile;
	/**
	 * 固定电话
	 */
	@Column("telephone")
	private String telephone;
	/**
	 * location
	 */
	@Column("location")
	private Integer location;
	/**
	 * 出生日期
	 */
	@Column("birthday")
	private java.util.Date birthday;
	/**
	 * 头像
	 */
	@Column("head_thumb")
	private byte[] headThumb;

	/**
	 * 启用时间：控制用户帐户状态，当前时间大于启用时间时账户为活动状态，当前时间小于启用时间时用户为锁定状态
            begin_time
	 */
	@Column("begin_time")
	private java.util.Date beginTime;
	/**
	 * 性别 0男 1女
	 */
	@Column("gender")
	private Integer gender;

    @Column
    protected String salt;

    /**
     * 1=未审核，2=批准入驻，3=否决入驻
     */
    @Column("register_check_state")
    private Integer registerCheckState;
    /**
     * 0未申请
     1待审核
     2审核通过
     3不通过
     */
    @Column("authentication_stat")
    private Integer authenticationStat;


    private String userTypeName;




    @ManyMany(from="u_id", relation="t_user_role", target=Role.class, to="role_id")
    protected List<Role> roles;
    @ManyMany(from="u_id", relation="t_user_permission", target=Permission.class, to="permission_id")
    protected List<Permission> permissions;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFamilyName() {
		return familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Integer getLocation() {
		return location;
	}

	public void setLocation(Integer location) {
		this.location = location;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}


	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getSalt() {
        return salt;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }

    public Integer getRegisterCheckState() {
        return registerCheckState;
    }

    public void setRegisterCheckState(Integer registerCheckState) {
        this.registerCheckState = registerCheckState;
    }

    public Integer getAuthenticationStat() {
        return authenticationStat;
    }

    public void setAuthenticationStat(Integer authenticationStat) {
        this.authenticationStat = authenticationStat;
    }

    public String getUserTypeName() {
        return userTypeName;
    }

    public void setUserTypeName(String userTypeName) {
        this.userTypeName = userTypeName;
    }

    public byte[] getHeadThumb() {
        return headThumb;
    }

    public void setHeadThumb(byte[] headThumb) {
        this.headThumb = headThumb;
    }


}