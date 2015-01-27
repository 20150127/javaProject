package cn.xyurp.zs.bean;

public class BYLB {
    private int id;
    private String bylbdm;
    private String bylbmc;

    public BYLB() {

    }

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public BYLB(String bylbdm, String bylbmc) {
	this.bylbdm = bylbdm;
	this.bylbmc = bylbmc;
    }

    public String getBylbdm() {
	return bylbdm;
    }

    public void setBylbdm(String bylbdm) {
	this.bylbdm = bylbdm;
    }

    public String getBylbmc() {
	return bylbmc;
    }

    public void setBylbmc(String bylbmc) {
	this.bylbmc = bylbmc;
    }

}
