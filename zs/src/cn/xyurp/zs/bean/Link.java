package cn.xyurp.zs.bean;

/**
 * @author mazhe
 * @time 2010-2-4 上午10:57:00
 * @description 友情链接实体Bean
 */
public class Link {
	private int id;//主键
	private int pxh;//排序号
	private String title;//链接名称
	private String path;//链接路径
	private String remark;//备注
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPxh() {
		return pxh;
	}
	public void setPxh(int pxh) {
		this.pxh = pxh;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
