package cn.xyurp.system.bean;


public class SysLog {
	
	private long id;
	
	private String sysUser;
	
	private String ip;
	
	private String sysTime;
	
	private String sysModule;
	
	private String sysMethod;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}


	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getSysTime() {
		return sysTime;
	}

	public void setSysTime(String sysTime) {
		this.sysTime = sysTime;
	}


	public String getSysUser() {
		return sysUser;
	}

	public void setSysUser(String sysUser) {
		this.sysUser = sysUser;
	}

	public String getSysModule() {
		return sysModule;
	}

	public void setSysModule(String sysModule) {
		this.sysModule = sysModule;
	}

	public String getSysMethod() {
		return sysMethod;
	}

	public void setSysMethod(String sysMethod) {
		this.sysMethod = sysMethod;
	}
}
