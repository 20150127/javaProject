package cn.xyurp.zs.bean;

public class DQ {
    private int id;
    private String dqdm;
    private String dqmc;

    public DQ() {
    }
    public DQ(String dqdm, String dqmc) {
	super();
	this.dqdm = dqdm;
	this.dqmc = dqmc;
    }

    public int getId() {
	return id;
    }
    
    public void setId(int id) {
	this.id = id;
    }

    public String getDqdm() {
	return dqdm;
    }

    public void setDqdm(String dqdm) {
	this.dqdm = dqdm;
    }

    public String getDqmc() {
	return dqmc;
    }

    public void setDqmc(String dqmc) {
	this.dqmc = dqmc;
    }
}
