package cn.xyurp.system.bean;

import java.util.Set;

public class Domain {
	private int id;
	private String domainName;
	private Set<DomainValue> values;
	private String remark;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDomainName() {
		return domainName;
	}

	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}

	public Set<DomainValue> getValues() {
		return values;
	}

	public void setValues(Set<DomainValue> values) {
		this.values = values;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
