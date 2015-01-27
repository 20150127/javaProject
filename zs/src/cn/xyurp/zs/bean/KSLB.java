package cn.xyurp.zs.bean;

public class KSLB {
    private int id;
    private String kslbdm;
    private String kslbmc;

    public KSLB() {
    }
    public KSLB(String kslbdm, String kslbmc) {
	super();
	this.kslbdm = kslbdm;
	this.kslbmc = kslbmc;
    }

    public int getId() {
	return id;
    }
    
    public void setId(int id) {
	this.id = id;
    }
    public String getKslbdm() {
	return kslbdm;
    }

    public void setKslbdm(String kslbdm) {
	this.kslbdm = kslbdm;
    }

    public String getKslbmc() {
	return kslbmc;
    }

    public void setKslbmc(String kslbmc) {
	this.kslbmc = kslbmc;
    }

}
