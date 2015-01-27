package cn.xyurp.zs.bean;

public class GuestBook {
	private int id;//主键
	private String title;//标题
	private String content;//内容
	private Score asker;//提问人
	private String askTime;//提问时间
	private String answer;//回答内容
	private String answerPerson;//回答人
	private String answerTime;//回答时间
	private String ifanswer;//回答状态：0是未回答，1是已回答
	
	
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
	
	public Score getAsker() {
		return asker;
	}
	public void setAsker(Score asker) {
		this.asker = asker;
	}
	public String getAskTime() {
		return askTime;
	}
	public void setAskTime(String askTime) {
		this.askTime = askTime;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnswerPerson() {
		return answerPerson;
	}
	public void setAnswerPerson(String answerPerson) {
		this.answerPerson = answerPerson;
	}
	public String getAnswerTime() {
		return answerTime;
	}
	public void setAnswerTime(String answerTime) {
		this.answerTime = answerTime;
	}
	public String getIfanswer() {
		return ifanswer;
	}
	public void setIfanswer(String ifanswer) {
		this.ifanswer = ifanswer;
	}
	
}
