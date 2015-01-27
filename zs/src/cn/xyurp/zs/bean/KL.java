package cn.xyurp.zs.bean;

public class KL {
    private int id;
    private String kldm;
    private String klmc;

    public KL() {
    }
    public KL(String kldm, String klmc) {
	super();
	this.kldm = kldm;
	this.klmc = klmc;
    }

    public int getId() {
	return id;
    }
    
    public void setId(int id) {
	this.id = id;
    }
    public String getKldm() {
	return kldm;
    }

    public void setKldm(String kldm) {
	this.kldm = kldm;
    }

    public String getKlmc() {
	return klmc;
    }

    public void setKlmc(String klmc) {
	this.klmc = klmc;
    }
}
