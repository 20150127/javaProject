package cn.xyurp.zs.service;

import java.util.List;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.Examinee;

/**
 * @author lichao
 * @time Jan 25, 2010 3:45:57 PM
 * @description 	
 */
public interface ExamineeService {

	public abstract void save(Examinee o) throws ProjectException;

	public abstract void del(Integer id) throws ProjectException;

	public abstract Examinee find(Integer id) throws ProjectException;

	public abstract void update(Examinee o) throws ProjectException;
	public void sc(int id)throws ProjectException;
	public List<Examinee> zt(int kch) throws ProjectException;
	public List<Integer> kc() throws ProjectException;

	/**
	 * 总报考人数
	 * @return
	 * @throws ProjectException
	 */
	public long bkrs(int id) throws ProjectException;
	/**
	 * 总发证人数
	 * @return
	 * @throws ProjectException
	 */
	public long fzrs(int id) throws ProjectException;
	/**
	 * 总录取人数
	 * @return
	 * @throws ProjectException
	 */
	public long lqrs(int id) throws ProjectException;
}