package cn.xyurp.zs.bean;

public class ZZMM {
    private int id;
    private String zzmmdm;
    private String zzmmmc;

    public ZZMM() {
    }
    public ZZMM(String zzmmdm, String zzmmmc) {
	super();
	this.zzmmdm = zzmmdm;
	this.zzmmmc = zzmmmc;
    }

    public int getId() {
	return id;
    }
    
    public void setId(int id) {
	this.id = id;
    }
    public String getZzmmdm() {
	return zzmmdm;
    }

    public void setZzmmdm(String zzmmdm) {
	this.zzmmdm = zzmmdm;
    }

    public String getZzmmmc() {
	return zzmmmc;
    }

    public void setZzmmmc(String zzmmmc) {
	this.zzmmmc = zzmmmc;
    }
}
