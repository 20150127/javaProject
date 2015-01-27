package cn.xyurp.zs.bean;

/**
 * @author wangjian 系统变量
 */
public class SysVariable {

	/**
	 * 主键
	 */
	private Integer id;
	/**
	 * 准考证头号
	 */
	private String admissionHead;
	/**
	 * 当前考场号
	 */
	private Integer roomNum;
	/**
	 * 当前考场序号
	 */
	private Integer roomId;
	/**
	 * 每个考场人数
	 */
	private Integer pcount;
	/**
	 * 到校报到时间
	 */
	private String registerDate;
	/**
	 * 录取通知书发证时间
	 */
	private String issueDate;
	/**
	 * 笔试时间
	 */
	private String examDate;
	/**
	 * 复试时间设置
	 */
	private String retestsDate;
	/**
	 * 笔试、复试地点
	 */
	private String retestsAddress;
	/**
	 * 登记表表头
	 */
	private String registerTitle;
	/**
	 * 准考证表头
	 */
	private String admissionTitle;
	/**
	 * 是否可以登录
	 */
	private Integer ifLogin;
	/**
	 * 是否可以复试
	 */
	private Integer ifReg;
	/**
	 * 是否可以初试
	 */
	private Integer ifPreliminary;
	/**
	 * 是否可以复试
	 */
	private Integer ifRetrial;
	
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAdmissionHead() {
		return admissionHead;
	}

	public void setAdmissionHead(String admissionHead) {
		this.admissionHead = admissionHead;
	}

	public Integer getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(Integer roomNum) {
		this.roomNum = roomNum;
	}

	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public Integer getPcount() {
		return pcount;
	}

	public void setPcount(Integer pcount) {
		this.pcount = pcount;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	public String getExamDate() {
		return examDate;
	}

	public void setExamDate(String examDate) {
		this.examDate = examDate;
	}

	public String getRetestsDate() {
		return retestsDate;
	}

	public void setRetestsDate(String retestsDate) {
		this.retestsDate = retestsDate;
	}

	public String getRetestsAddress() {
		return retestsAddress;
	}

	public void setRetestsAddress(String retestsAddress) {
		this.retestsAddress = retestsAddress;
	}

	public String getRegisterTitle() {
		return registerTitle;
	}

	public void setRegisterTitle(String registerTitle) {
		this.registerTitle = registerTitle;
	}

	public String getAdmissionTitle() {
		return admissionTitle;
	}

	public void setAdmissionTitle(String admissionTitle) {
		this.admissionTitle = admissionTitle;
	}

	public Integer getIfLogin() {
		return ifLogin;
	}

	public void setIfLogin(Integer ifLogin) {
		this.ifLogin = ifLogin;
	}

	public Integer getIfReg() {
		return ifReg;
	}

	public void setIfReg(Integer ifReg) {
		this.ifReg = ifReg;
	}

	public Integer getIfPreliminary() {
		return ifPreliminary;
	}

	public void setIfPreliminary(Integer ifPreliminary) {
		this.ifPreliminary = ifPreliminary;
	}

	public Integer getIfRetrial() {
		return ifRetrial;
	}

	public void setIfRetrial(Integer ifRetrial) {
		this.ifRetrial = ifRetrial;
	}


}
