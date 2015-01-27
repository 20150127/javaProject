package cn.xyurp.zs.bean;

/**
 * @author wangjian
 * 考生实体类
 */
public class Examinee {

	private Integer id;// 主键1
	
	private String name;// 姓名2
	
	private String sex; // 性别3
	
	private String birthday;// 出生日期4
	
	private String area; // 区县5
	
	private String politics; // 政治面貌6
	
	private String nationality;// 民族7
	
	private String IDCardNum; // 身份证号8
	
	private String examineeNum;// 考生号34
	
	private String examineeType;// 考生类别9
	
	private String examineePhoto; //考生照片10
	
	private String school; // 所在学校11
	
	private String graduationDate;// 毕业时间12
	
	private String graduationType; // 毕业类别13
	
	private String works;// 在校或工作期间担任社会工作14
	
	private String disposal; // 在校或工作期间受过各种处分15
	
	private String rewards; // 获奖情况16
	
	private String cerificate;// 取得各类证书17
	
	private String hobby;// 个人兴趣爱好及特长18
	
	private String address;// 家庭住址19
	
	private String street;// 户口所在街道20
	
	private String homePhone; // 家庭电话21
	
	private String mobilePhone; //手机22
	
	private String letterAddress;// 邮寄录取通知书地址23
	
	private String letterName;// 收件人姓名24
	
	private String linkPhone; // 联系电话25
	
	private String postCode; // 邮政编码26
	
	private Specialty specialtyId;// 报考专业27
	
	private Integer ifAdjust; //是否同意调剂 28
	
	private String password; // 密码29
	
	private Integer ifAdmit; //是否录取30
	
	private Integer roomId; // 考场号32
	
	private String admissionId; //准考证号33
	
	private String kl;//科类代码

	private String hkkh;
	
	private String zwjd;
	
	private int ifRetrial;// 是否复试
	
	private String kslx;
	
	private Specialty specialtyId2;// 报考专业II
	
	public String getKslx() {
		return kslx;
	}

	public void setKslx(String kslx) {
		this.kslx = kslx;
	}

	public String getKl() {
	    return kl;
	}

	public void setKl(String kl) {
	    this.kl = kl;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPolitics() {
		return politics;
	}

	public void setPolitics(String politics) {
		this.politics = politics;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getIDCardNum() {
		return IDCardNum;
	}

	public void setIDCardNum(String cardNum) {
		IDCardNum = cardNum;
	}

	public String getExamineeType() {
		return examineeType;
	}

	public void setExamineeType(String examineeType) {
		this.examineeType = examineeType;
	}



	public String getExamineePhoto() {
		return examineePhoto;
	}

	public void setExamineePhoto(String examineePhoto) {
		this.examineePhoto = examineePhoto;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getGraduationDate() {
		return graduationDate;
	}

	public void setGraduationDate(String graduationDate) {
		this.graduationDate = graduationDate;
	}

	public String getGraduationType() {
		return graduationType;
	}

	public void setGraduationType(String graduationType) {
		this.graduationType = graduationType;
	}

	public String getWorks() {
		return works;
	}

	public void setWorks(String works) {
		this.works = works;
	}

	public String getDisposal() {
		return disposal;
	}

	public void setDisposal(String disposal) {
		this.disposal = disposal;
	}

	public String getRewards() {
		return rewards;
	}

	public void setRewards(String rewards) {
		this.rewards = rewards;
	}

	public String getCerificate() {
		return cerificate;
	}

	public void setCerificate(String cerificate) {
		this.cerificate = cerificate;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getHomePhone() {
		return homePhone;
	}

	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getLetterAddress() {
		return letterAddress;
	}

	public void setLetterAddress(String letterAddress) {
		this.letterAddress = letterAddress;
	}

	public String getLetterName() {
		return letterName;
	}

	public void setLetterName(String letterName) {
		this.letterName = letterName;
	}

	public String getLinkPhone() {
		return linkPhone;
	}

	public void setLinkPhone(String linkPhone) {
		this.linkPhone = linkPhone;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public Specialty getSpecialtyId() {
		return specialtyId;
	}

	public void setSpecialtyId(Specialty specialtyId) {
		this.specialtyId = specialtyId;
	}

	public Integer getIfAdjust() {
		return ifAdjust;
	}

	public void setIfAdjust(Integer ifAdjust) {
		this.ifAdjust = ifAdjust;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public String getAdmissionId() {
		return admissionId;
	}

	public void setAdmissionId(String admissionId) {
		this.admissionId = admissionId;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public Integer getIfAdmit() {
		return ifAdmit;
	}

	public void setIfAdmit(Integer ifAdmit) {
		this.ifAdmit = ifAdmit;
	}

	public String getExamineeNum() {
		return examineeNum;
	}

	public void setExamineeNum(String examineeNum) {
		this.examineeNum = examineeNum;
	}

	public String getHkkh() {
		return hkkh;
	}

	public void setHkkh(String hkkh) {
		this.hkkh = hkkh;
	}

	public String getZwjd() {
		return zwjd;
	}

	public void setZwjd(String zwjd) {
		this.zwjd = zwjd;
	}

	public int getIfRetrial() {
	    return ifRetrial;
	}

	public void setIfRetrial(int ifRetrial) {
	    this.ifRetrial = ifRetrial;
	}

	public Specialty getSpecialtyId2() {
		return specialtyId2;
	}

	public void setSpecialtyId2(Specialty specialtyId2) {
		this.specialtyId2 = specialtyId2;
	}
	
}
