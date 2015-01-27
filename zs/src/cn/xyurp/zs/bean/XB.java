package cn.xyurp.zs.bean;

public class XB {
    private int id;
    private String xbdm;
    private String xbmc;
    public String getXbdm() {
	return xbdm;
    }

    public void setXbdm(String xbdm) {
	this.xbdm = xbdm;
    }

    
    public int getId() {
	return id;
    }
    
    public void setId(int id) {
	this.id = id;
    }
    public String getXbmc() {
	return xbmc;
    }

    public void setXbmc(String xbmc) {
	this.xbmc = xbmc;
    }

    public XB() {
    }
    public XB(String xbdm, String xbmc) {
	super();
	this.xbdm = xbdm;
	this.xbmc = xbmc;
    }
}
