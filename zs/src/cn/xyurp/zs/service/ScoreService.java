package cn.xyurp.zs.service;

import java.util.List;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.Score;

public interface ScoreService {
    	
	public void updateBJ(Score score) throws ProjectException;
	public void updateHK(Score score) throws ProjectException;
	public void updateZH(Score score) throws ProjectException;
	public void updateTC(Score score) throws ProjectException;
	public void updateCS(Score score) throws ProjectException;
	public void updateFS(Score score) throws ProjectException;
	public Score findById(int id) throws ProjectException;
	public Score findByKH(String kh) throws ProjectException;
	
	public void updateHKForImport(Score score) throws ProjectException;
	public void save(Score score) throws ProjectException;
	public void lq(Score score)throws ProjectException;
	public void qx(Score score)throws ProjectException;
	
	public Score findByIDCard(String IDCardNum) throws ProjectException;
	
	public Score findByExamNum(String examineeNum) throws ProjectException;
	public void retrial(int id) throws ProjectException;
	public void pllq(String[] ids) throws ProjectException;
	public void plfs(String[] ids) throws ProjectException;
	public List<Score> pldy(String[] ids) throws ProjectException;
	
	public void updateRegisterInfo(Score score) throws ProjectException;
	public void updatePwd(Integer id, String newpwd) throws ProjectException;
	public List<Score> findByFW(String hql) throws ProjectException;
	public void del(Integer id) throws ProjectException;
	
	public void upPwd(String idcard) throws ProjectException;
	
}
