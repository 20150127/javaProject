package cn.xyurp.zs.service;

import java.util.List;

import cn.xyurp.zs.bean.Specialty;
import cn.xyurp.system.util.ProjectException;

public interface SpecialtyService {
	public void add(Specialty specialty) throws ProjectException;
	
	public void update(Specialty specialty) throws ProjectException;
	
	public void del(String[] ids) throws ProjectException;
	
	public Specialty find(int id) throws ProjectException;
	
	public Specialty findBycodeAndId(String code,int id);
	
	public List<Specialty> findAll() throws ProjectException;
	
}
