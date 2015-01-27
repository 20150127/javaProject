package cn.xyurp.zs.bean;

public class MZ {
    private int id;
    private String mzdm;
    private String mzmc;

    public MZ() {
    }
    public MZ(String mzdm, String mzmc) {
	super();
	this.mzdm = mzdm;
	this.mzmc = mzmc;
    }

    public int getId() {
	return id;
    }
    
    public void setId(int id) {
	this.id = id;
    }
    public String getMzdm() {
	return mzdm;
    }

    public void setMzdm(String mzdm) {
	this.mzdm = mzdm;
    }

    public String getMzmc() {
	return mzmc;
    }

    public void setMzmc(String mzmc) {
	this.mzmc = mzmc;
    }
}
