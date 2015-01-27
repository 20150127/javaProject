package cn.xyurp.zs.bean;

public class Notice {
	private int id;//主键
	private String title;//标题
	private String content;//内容
	private String issueTime;//发布时间
	private String issuePerson;//发布人
	private String ifissue;//是否发布
	private String uploadResource;//附件上传路径
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIssueTime() {
		return issueTime;
	}
	public void setIssueTime(String issueTime) {
		this.issueTime = issueTime;
	}
	public String getIssuePerson() {
		return issuePerson;
	}
	public void setIssuePerson(String issuePerson) {
		this.issuePerson = issuePerson;
	}
	
	public String getIfissue() {
		return ifissue;
	}
	public void setIfissue(String ifissue) {
		this.ifissue = ifissue;
	}
	public String getUploadResource() {
		return uploadResource;
	}
	public void setUploadResource(String uploadResource) {
		this.uploadResource = uploadResource;
	}
	
}
