package cn.xyurp.zs.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

import cn.xyurp.system.action.BaseAction;
import cn.xyurp.system.bean.SysUser;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.util.FileOperation;
import cn.xyurp.system.util.MyConstants;
import cn.xyurp.system.util.PagerModel;
import cn.xyurp.zs.bean.BYLB;
import cn.xyurp.zs.bean.DQ;
import cn.xyurp.zs.bean.Examinee;
import cn.xyurp.zs.bean.KSLB;
import cn.xyurp.zs.bean.KSLX;
import cn.xyurp.zs.bean.MZ;
import cn.xyurp.zs.bean.Score;
import cn.xyurp.zs.bean.Specialty;
import cn.xyurp.zs.bean.SysVariable;
import cn.xyurp.zs.bean.XB;
import cn.xyurp.zs.bean.ZZMM;
import cn.xyurp.zs.service.BYLBService;
import cn.xyurp.zs.service.DQService;
import cn.xyurp.zs.service.ExamineeService;
import cn.xyurp.zs.service.KSLBService;
import cn.xyurp.zs.service.KSLXService;
import cn.xyurp.zs.service.MZService;
import cn.xyurp.zs.service.ScoreService;
import cn.xyurp.zs.service.SpecialtyService;
import cn.xyurp.zs.service.SysVariableService;
import cn.xyurp.zs.service.XBService;
import cn.xyurp.zs.service.ZZMMService;
public class ExamineeAction extends BaseAction {
	private static final long serialVersionUID = 2719499357751254596L;
	
	private AbstractDao abstractDao;
	private ExamineeService examineeService;
	private ScoreService scoreService;
	private SpecialtyService specialtyService;
	private SysVariableService svs;
 	private Score o;
	private String kch;
	private File file;
	private String fileFileName;
	private String[] properties;
	private String fileContentType;
	private final static String UPLOADDIR = "/upload";

	private XBService xbService;
	private DQService dqService;
	private ZZMMService zzmmService;
	private MZService mzService;
	private BYLBService bylbService;
	private KSLBService kslbService;
	private KSLXService kslxService;
	
	private String condition;
	private String key;
	private String key1;
	private String key2;
	private String key3;
	
	@SuppressWarnings("unused")
	private List<XB> xb;
	@SuppressWarnings("unused")
	private List<DQ> dq;
	@SuppressWarnings("unused")
	private List<ZZMM> zzmm;
	@SuppressWarnings("unused")
	private List<MZ> mz;
	@SuppressWarnings("unused")
	private List<BYLB> bylb;
	@SuppressWarnings("unused")
	private List<KSLB> kslb;
	@SuppressWarnings("unused")
	private List<Specialty> specialty;
	@SuppressWarnings("unused")
	private List<KSLX> kslx;

	public String getKch() {
	    return kch;
	}

	public void setKch(String kch) {
	    this.kch = kch;
	}

	public void setAbstractDao(AbstractDao abstractDao) {
		this.abstractDao = abstractDao;
	}

	public void setExamineeService(ExamineeService examineeService) {
		this.examineeService = examineeService;
	}
	

	public void setSvs(SysVariableService svs) {
		this.svs = svs;
	}

	public Score getO() {
	    return o;
	}

	public void setO(Score o) {
	    this.o = o;
	}

	/**
	 * 集合列表
	 */
	public String list() throws Exception{
		 StringBuffer hql = new StringBuffer();
		    SysUser user=(SysUser)getRequest().getSession().getAttribute("user");
		    hql.append("from Score s where 1=1");
		    
		    if(user!=null && user.getSpecialty()!=null){
			hql.append(" and s.specialtyId.id="+user.getSpecialty().getId());
		    }else if(key2!=null && !"0".equals(key2)){
			hql.append(" and s.specialtyId.code='"+key2+"'");
		    }else if(key3!=null && !"0".equals(key3)){
			hql.append(" and s.specialtyId2.code='"+key3+"'");
		    }
		    
		    if(key!=null && !"".equals(key.trim()) || !"0".equals(key1) ){
			if(condition!=null && !"".equals(condition.trim())){
			    if("0".equals(key1)){
				key=MyConstants.vd(key.trim());
			    }
			    if("name".equals(condition)){
				hql.append(" and s.name like '%"+key+"%'");
			    }else if("IDCardNum".equals(condition)){
				hql.append(" and s.IDCardNum like '%"+key+"%'");
			    }else if("examineeNum".equals(condition)){
				hql.append(" and s.examineeNum like '%"+key+"%'");
			    }else if("admissionId".equals(condition)){
				hql.append(" and s.admissionId like '%"+key+"%'");
			    }else{
				hql.append(" and s.kl='" + key1 + "'");
			    }
			}
		    }
		    hql.append(" order by s.specialtyId.id asc");
		    String hqlStatement = hql.toString();
		    PagerModel page = abstractDao.searchPaginated(hqlStatement);
		    getRequest().setAttribute("page", page);
		    getRequest().setAttribute("key", key);
		    if(key1!=null){
			getRequest().setAttribute("key1", key1);
		    }else{
			getRequest().setAttribute("key1", 0);
		    }
		    if(key2!=null){
			getRequest().setAttribute("key2", key2);
		    }else{
			getRequest().setAttribute("key2", 0);
		    }
		    if(key3!=null){
			getRequest().setAttribute("key3", key3);
		    }else{
			getRequest().setAttribute("key3", 0);
		    }
		    getRequest().setAttribute("condition", condition);
		    getRequest().setAttribute("specialtys",specialtyService.findAll());
		    getRequest().setAttribute("specialtys2",specialtyService.findAll());
		    
		return SUCCESS;
	}
	public String sjtj() throws Exception{
	    long bkrs=0;
	    long lqrs=0;
	    long fzrs=0;
	    StringBuffer hql = new StringBuffer();
	    hql.append("from Specialty s ");
	    String hqlStatement = hql.toString();
	    PagerModel page = abstractDao.searchPaginated(hqlStatement);
	    PagerModel pp=new PagerModel();
	    List<Object> list=page.getDatas();
	    List<Object> ss=new ArrayList<Object>();
	    for (Object object : list) {
		Specialty specialty=(Specialty)object;
		bkrs=examineeService.bkrs(specialty.getId());
		lqrs=examineeService.lqrs(specialty.getId());
		fzrs=examineeService.fzrs(specialty.getId());
		Specialty obj=new Specialty(specialty.getName(),bkrs,fzrs,lqrs);
		ss.add(obj);
	    }
	    pp.setDatas(ss);
	    pp.setOffset(page.getOffset());
	    pp.setPagesize(page.getPagesize());
	    pp.setTotal(page.getTotal());
	    getRequest().setAttribute("page", pp);
	    getRequest().setAttribute("bkrs", examineeService.bkrs(0));
	    getRequest().setAttribute("lqrs", examineeService.lqrs(0));
	    getRequest().setAttribute("fzrs", examineeService.fzrs(0));
	    return SUCCESS;
	}
	
	public String save() throws Exception{
	    	scoreService.save(o);
		return SUCCESS;
	}
	
	public String showToAdmin() throws Exception{
		Examinee obj = examineeService.find(o.getId());
		SysVariable sysv = svs.find(1);
		getRequest().setAttribute("sysv", sysv);
		getRequest().setAttribute("o", obj);
		
		
		return SUCCESS;
	}
	public  String  sc() throws Exception{
	    examineeService.sc(o.getId());
	    return SUCCESS;
	}
	public String zkzPrint() throws Exception{
	    Examinee obj = examineeService.find(o.getId());
	    getRequest().setAttribute("obj", obj);
	    
	    return SUCCESS;
	}
	public String zt() throws Exception{
	    List<Examinee> list=new ArrayList<Examinee>();
	    if(kch!=null &&  !"".equals(kch.trim())){
		list=examineeService.zt(Integer.parseInt(kch.trim()));
	    }else{
		list=examineeService.zt(0);
	    }
	    getRequest().setAttribute("list",list);
	    List<Integer> kc=examineeService.kc();
	    getRequest().setAttribute("kc", kc);
	    getRequest().setAttribute("kch", kch);
	    return SUCCESS;
	}
	public String ks() throws Exception{
	    List<Examinee> list=new ArrayList<Examinee>();
	    if(kch!=null &&  !"".equals(kch.trim())){
		list=examineeService.zt(Integer.parseInt(kch.trim()));
	    }else{
		list=examineeService.zt(0);
	    }
	    getRequest().setAttribute("list",list);
	    List<Integer> kc=examineeService.kc();
	    getRequest().setAttribute("kc", kc);
	    getRequest().setAttribute("kch", kch);
	    return SUCCESS;
	}
	
	
	public String toUpdate() throws Exception{
		Score obj = scoreService.findById(o.getId());
		getRequest().setAttribute("o", obj);
		return SUCCESS;
	}
	
	public String update() throws Exception{
		Score s = null;
		s = scoreService.findById(o.getId());
		String rootPath = "";
		String fileName = "";
		if (file != null) {
			FileOperation.delFile(getServletContext().getRealPath(s.getExamineePhoto()));
			rootPath = getRequest().getSession().getServletContext()
			.getRealPath(UPLOADDIR);
			rootPath += "/";
			fileName = FileOperation.uploadForName(s.getExamineeNum()+".jpg", rootPath,
					file);
			o.setExamineePhoto(UPLOADDIR+"/"+fileName);
		}else{
			o.setExamineePhoto(s.getExamineePhoto());
		}
		o.setKl(o.getExamineeNum().substring(9, 10));
		scoreService.updateRegisterInfo(o);
		return SUCCESS;
	}
	
	public String del() throws Exception{
		scoreService.del(o.getId());
		return SUCCESS;
	}
	
	public String toZhmm() throws Exception{
		return SUCCESS;
	}
	
	public String zhmm() throws Exception{
		String idcard = getRequest().getParameter("idcard");
		scoreService.upPwd(idcard);
		return SUCCESS;
	}
	
	public InputStream getInputStream() throws Exception {
		//SysUser user=(SysUser)getRequest().getSession().getAttribute("user");
		long bkrs=0;
	    long lqrs=0;
	    long fzrs=0;
		
	    List<Specialty> list = specialtyService.findAll();
	    //List<Object> list=page.getDatas();
	    List<Object> ss=new ArrayList<Object>();
	    for (Specialty specialty : list) {
			//Specialty specialty=(Specialty)object;
			bkrs=examineeService.bkrs(specialty.getId());
			lqrs=examineeService.lqrs(specialty.getId());
			fzrs=examineeService.fzrs(specialty.getId());
			Specialty obj=new Specialty(specialty.getName(),bkrs,fzrs,lqrs);
			ss.add(obj);
	    }
	    long sumbkrs = examineeService.bkrs(0);
	    System.out.println("sumbkrs is:"+sumbkrs);
	    long sumlqrs = examineeService.lqrs(0);
	    System.out.println("sumlqrs is:"+sumlqrs);
	    long sumfzrs = examineeService.fzrs(0);
	    System.out.println("sumfzrs is:"+sumfzrs);
	    List<Object> tjlist = ss;
	    String[] properties = {"专业名称","报考人数","准考证发放人数","录取人数"};
	    HSSFWorkbook wb = exportExcel(tjlist, properties,sumbkrs,sumlqrs,sumfzrs);
	    fileFileName = "sjtj.xls";
	    File file = new File(fileFileName);
	    OutputStream out = new FileOutputStream(file);
	    wb.write(out);
	    out.close();
	    InputStream in = null;
	    in = new FileInputStream(file);
	    return in;
	}
	
	public String export(){
		return SUCCESS;
	}
	
	
	@SuppressWarnings("unchecked")
	public HSSFWorkbook exportExcel(List dataList, String[] headers,long sumbkrs,long sumlqrs,long sumfzrs)
			throws Exception {
		HSSFWorkbook workbook = null;
		try {
			workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet("SJTJ");
			this.setSheetColumnWidth(sheet, headers);
			HSSFCellStyle style = this.createTitleStyle(workbook);
			style.setFillForegroundColor(HSSFColor.LIGHT_GREEN.index);
			style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			style.setBorderRight(HSSFCellStyle.BORDER_THIN);
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			HSSFFont font = workbook.createFont();
			font.setColor(HSSFColor.VIOLET.index);
			font.setFontHeightInPoints((short) 12);
			font.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
			style.setFont(font);
			HSSFCellStyle style2 = workbook.createCellStyle();
			style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

			HSSFRow row0 = sheet.createRow((short) 0);// 建立表头
			this.createCell(row0, 1, style, HSSFCell.CELL_TYPE_STRING, "首钢工学院自主招生数据统计");
			HSSFRow row = sheet.createRow((short) 1);// 建立新行
			for (int i = 0; i < headers.length; i++) {
				this.createCell(row, i, style, HSSFCell.CELL_TYPE_STRING,
						headers[i]);
			}
			if (dataList != null && dataList.size() > 0) {
				for (int i = 0; i < dataList.size(); i++) {
					Specialty o = (Specialty) dataList.get(i);
					HSSFRow row1 = sheet.createRow((short) (i + 2));// 建立新行
					for (int j = 0; j < headers.length; j++) {
						if ("专业名称".equals(headers[j])) {
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getName());
						}else if("报考人数".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getBkrs());
						}else if("准考证发放人数".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getFzrs());
						}else if("录取人数".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getLqrs());
						}else{}
					}
				}
				int foot = dataList.size()+2;//建立表底
				HSSFRow row2 = sheet.createRow((short)(foot));
				for(int k=0; k < headers.length; k++){
					if ("专业名称".equals(headers[k])) {
						this.createCell(row2, k, style, HSSFCell.CELL_TYPE_STRING, "总计：");
					}else if("报考人数".equals(headers[k])){
						this.createCell(row2, k, style2, HSSFCell.CELL_TYPE_STRING, sumbkrs);
					}else if("准考证发放人数".equals(headers[k])){
						this.createCell(row2, k, style2, HSSFCell.CELL_TYPE_STRING, sumfzrs);
					}else if("录取人数".equals(headers[k])){
						this.createCell(row2, k, style2, HSSFCell.CELL_TYPE_STRING, sumlqrs);
					}else{}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workbook;
	}

	private void setSheetColumnWidth(HSSFSheet sheet, String[] fileds) {
		// 根据你数据里面的记录有多少列，就设置多少列

		for (int i = 0; i < fileds.length; i++) {
			sheet.setColumnWidth((short) i, (short) 3000);
		}
	}

	// 设置excel的title样式
	private HSSFCellStyle createTitleStyle(HSSFWorkbook wb) {
		HSSFFont boldFont = wb.createFont();
		boldFont.setFontHeight((short) 200);
		HSSFCellStyle style = wb.createCellStyle();
		style.setFont(boldFont);
		style.setDataFormat(HSSFDataFormat.getBuiltinFormat("###,##0.00"));
		return style;
	}

	// 创建Excel单元格


	@SuppressWarnings("deprecation")
	private void createCell(HSSFRow row, int column, HSSFCellStyle style,
			int cellType, Object value) {
		HSSFCell cell = row.createCell((short) column);
		cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		if (style != null) {
			cell.setCellStyle(style);
		}
		cell.setCellType(cellType);
		switch (cellType) {
		case HSSFCell.CELL_TYPE_BLANK: {
		}
			break;
		case HSSFCell.CELL_TYPE_STRING: {
			cell.setCellValue(value.toString());
		}
			break;
		case HSSFCell.CELL_TYPE_NUMERIC: {
			cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
			cell.setCellValue(Double.parseDouble(value.toString()));
		}
			break;
		default:
			break;
		}
	}

	
	
	
	
	
	public void setScoreService(ScoreService scoreService) {
	    this.scoreService = scoreService;
	}

	public void setSpecialtyService(SpecialtyService specialtyService) {
	    this.specialtyService = specialtyService;
	}
	public List<XB> getXb() {
		return xbService.getAll();
	}

	public void setXb(List<XB> xb) {
		this.xb = xb;
	}

	public List<DQ> getDq() {
		return dqService.getAll();
	}

	public void setDq(List<DQ> dq) {
		this.dq = dq;
	}

	public List<ZZMM> getZzmm() {
		return zzmmService.getAll();
	}

	public void setZzmm(List<ZZMM> zzmm) {
		this.zzmm = zzmm;
	}

	public List<MZ> getMz() {
		return mzService.getAll();
	}

	public void setMz(List<MZ> mz) {
		this.mz = mz;
	}

	public List<BYLB> getBylb() {
		return bylbService.getAll();
	}

	public void setBylb(List<BYLB> bylb) {
		this.bylb = bylb;
	}

	public List<KSLB> getKslb() {
		return kslbService.getAll();
	}

	public void setKslb(List<KSLB> kslb) {
		this.kslb = kslb;
	}

	public List<Specialty> getSpecialty() {
		return specialtyService.findAll();
	}

	public void setSpecialty(List<Specialty> specialty) {
		this.specialty = specialty;
	}

	public void setKslxService(KSLXService kslxService) {
		this.kslxService = kslxService;
	}

	public List<KSLX> getKslx() {
		return kslxService.getAll();
	}

	public void setKslx(List<KSLX> kslx) {
		this.kslx = kslx;
	}

	public void setXbService(XBService xbService) {
		this.xbService = xbService;
	}

	public void setDqService(DQService dqService) {
		this.dqService = dqService;
	}

	public void setZzmmService(ZZMMService zzmmService) {
		this.zzmmService = zzmmService;
	}

	public void setMzService(MZService mzService) {
		this.mzService = mzService;
	}

	public void setBylbService(BYLBService bylbService) {
		this.bylbService = bylbService;
	}

	public void setKslbService(KSLBService kslbService) {
		this.kslbService = kslbService;
	}

	public String getCondition() {
	    return condition;
	}

	public void setCondition(String condition) {
	    this.condition = condition;
	}

	public String getKey() {
	    return key;
	}

	public void setKey(String key) {
	    this.key = key;
	}

	public String getKey1() {
	    return key1;
	}

	public void setKey1(String key1) {
	    this.key1 = key1;
	}
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getKey2() {
	    return key2;
	}

	public void setKey2(String key2) {
	    this.key2 = key2;
	}
	
	public String getKey3() {
		return key3;
	}

	public void setKey3(String key3) {
		this.key3 = key3;
	}

	public String[] getProperties() {
		return properties;
	}

	public void setProperties(String[] properties) {
		this.properties = properties;
	}
	
	
}
