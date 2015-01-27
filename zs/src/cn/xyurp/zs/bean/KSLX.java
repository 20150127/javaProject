package cn.xyurp.zs.bean;

public class KSLX {
    private int id;
    private String kslxdm;
    private String kslxmc;

    public KSLX() {
    }
    public KSLX(String kslxdm, String kslxmc) {
	super();
	this.kslxdm = kslxdm;
	this.kslxmc = kslxmc;
    }

    public int getId() {
	return id;
    }
    
    public void setId(int id) {
	this.id = id;
    }
    public String getKslxdm() {
	return kslxdm;
    }

    public void setKslxdm(String kslxdm) {
	this.kslxdm = kslxdm;
    }

    public String getKslxmc() {
	return kslxmc;
    }

    public void setKslxmc(String kslxmc) {
	this.kslxmc = kslxmc;
    }
}
