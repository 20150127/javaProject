package cn.xyurp.zs.service.impl;

import java.util.Iterator;
import java.util.List;


import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Repository;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.BYLB;
import cn.xyurp.zs.bean.DQ;
import cn.xyurp.zs.bean.KL;
import cn.xyurp.zs.bean.KSLB;
import cn.xyurp.zs.bean.KSLX;
import cn.xyurp.zs.bean.MZ;
import cn.xyurp.zs.bean.SysVariable;
import cn.xyurp.zs.bean.XB;
import cn.xyurp.zs.bean.ZZMM;
@Repository
public class InitSystemDatasImpl implements ApplicationListener {
    private CommonDao commonDao;
    private String file;

    public void setFile(String file) {
        this.file = file;
    }

    public void setCommonDao(CommonDao commonDao) {
	this.commonDao = commonDao;
    }
    @SuppressWarnings ("unchecked")
    public int getCount(String Obj){
	List list=commonDao.findList("from "+Obj);
	return list.size();
    }
    
    private void importBYLB(List<BYLB> bylbs) {
	if(getCount("BYLB")==0){
	    for (Iterator<BYLB> iter = bylbs.iterator(); iter.hasNext();) {
		Element element = (Element) iter.next();
		BYLB bylb = new BYLB(element.attributeValue("dm"), element
			.attributeValue("mc"));
		
		commonDao.add(bylb);
	    }
	}
    }

    private void importDQ(List<DQ> dqs) {
	if(getCount("DQ")==0){
	for (Iterator<DQ> iter = dqs.iterator(); iter.hasNext();) {
	    Element element = (Element) iter.next();
	    DQ dq = new DQ(element.attributeValue("dm"), element
		    .attributeValue("mc"));
	    commonDao.add(dq);
	}
	}
    }

    private void importKL(List<KL> kls) {
	if(getCount("KL")==0){
	for (Iterator<KL> iter = kls.iterator(); iter.hasNext();) {
	    Element element = (Element) iter.next();
	    KL kl = new KL(element.attributeValue("dm"), element
		    .attributeValue("mc"));
	    commonDao.add(kl);
	}
	}
    }

    private void importKSLB(List<KSLB> kslbs) {
	if(getCount("KSLB")==0){
	for (Iterator<KSLB> iter = kslbs.iterator(); iter.hasNext();) {
	    Element element = (Element) iter.next();
	    KSLB kslb = new KSLB(element.attributeValue("dm"), element
		    .attributeValue("mc"));
	    commonDao.add(kslb);
	}
	}
    }

    private void importKSLX(List<KSLX> kslxs) {
	if(getCount("KSLX")==0){
	for (Iterator<KSLX> iter = kslxs.iterator(); iter.hasNext();) {
	    Element element = (Element) iter.next();
	    KSLX kslx = new KSLX(element.attributeValue("dm"), element
		    .attributeValue("mc"));
	    commonDao.add(kslx);
	}
	}
    }

    private void importMZ(List<MZ> mzs) {
	if(getCount("MZ")==0){
	for (Iterator<MZ> iter = mzs.iterator(); iter.hasNext();) {
	    Element element = (Element) iter.next();
	    MZ mz = new MZ(element.attributeValue("dm"), element
		    .attributeValue("mc"));
	    commonDao.add(mz);
	}
	}
    }

    private void importXB(List<XB> xbs) {
	if(getCount("XB")==0){
	for (Iterator<XB> iter = xbs.iterator(); iter.hasNext();) {
	    Element element = (Element) iter.next();
	    XB xb = new XB(element.attributeValue("dm"), element
		    .attributeValue("mc"));
	    commonDao.add(xb);
	}
	}
    }

    private void importZZMM(List<ZZMM> zzmms) {
	if(getCount("ZZMM")==0){
	for (Iterator<ZZMM> iter = zzmms.iterator(); iter.hasNext();) {
	    Element element = (Element) iter.next();
	    ZZMM zzmm = new ZZMM(element.attributeValue("dm"), element
		    .attributeValue("mc"));
	    commonDao.add(zzmm);
	}
	}
    }

    @SuppressWarnings ("unchecked")
    public void onApplicationEvent(ApplicationEvent event) {
	String xmlFilePath = "init_datas.xml";
	try {
	    String filePath = null;
	    if (xmlFilePath == null || xmlFilePath.trim().equals("")) {
		filePath = file;
	    } else {
		filePath = xmlFilePath;
	    }
	    Document document = new SAXReader().read(Thread.currentThread()
		    .getContextClassLoader().getResourceAsStream(filePath));

	    importBYLB(document.selectNodes("//InitDatas/bylbs/bylb"));
	    importDQ(document.selectNodes("//InitDatas/dqs/dq"));
	    importKL(document.selectNodes("//InitDatas/kls/kl"));
	    importKSLB(document.selectNodes("//InitDatas/kslbs/kslb"));
	    importKSLX(document.selectNodes("//InitDatas/kslxs/kslx"));
	    importMZ(document.selectNodes("//InitDatas/mzs/mz"));
	    importXB(document.selectNodes("//InitDatas/xbs/xb"));
	    importZZMM(document.selectNodes("//InitDatas/zzmms/zzmm"));
	    importSys();
	} catch (Exception e) {
	    e.printStackTrace();
	    throw new ProjectException("初始化数据生成有误！");
	}
    }

	private void importSys() {
		if(getCount("SysVariable") == 0){
			SysVariable sv = new SysVariable();
			sv.setAdmissionHead("1109");
			sv.setAdmissionTitle("首钢工学院2010年自主招生考试");
			sv.setExamDate("2010年3月28日 上午 9:00-11:30");
			sv.setIfLogin(1);
			sv.setIfPreliminary(1);
			sv.setIfReg(1);
			sv.setIfRetrial(1);
			sv.setIssueDate("2010年4月18日到学校网站查询");
			sv.setPcount(30);
			sv.setRegisterDate("2010年4月3日到学校网站查询");
			sv.setRegisterTitle("2010");
			sv.setRetestsAddress("首钢工学院(详见考场分布表)");
			sv.setRetestsDate("2010年4月6日(4月3日前到学校网站查询)");
			sv.setRoomId(1);
			sv.setRoomNum(1);
			commonDao.add(sv);
		}
	}
}
