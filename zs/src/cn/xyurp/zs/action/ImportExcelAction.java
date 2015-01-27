package cn.xyurp.zs.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import cn.xyurp.system.util.ExcelUtils;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.Score;
import cn.xyurp.zs.service.ScoreService;

public class ImportExcelAction {

    private File excel; // 导入Excel文件
    private List<String> success; // 导入成功的信息
    private List<String> fail; // 导入失败的信息
    private List<String> reasons; // 导入失败的原因
    private ScoreService scoreService;

    public void setScoreService(ScoreService scoreService) {
	this.scoreService = scoreService;
    }

    public String imp() throws ProjectException {
	return "success";
    }

    // 导入Excel文件
    public String importExcel() throws ProjectException {
	success = new ArrayList<String>();
	fail = new ArrayList<String>();
	reasons = new ArrayList<String>();
	int i = 1;
	if (excel != null) {
	    try {
		HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(excel));
		HSSFSheet sheet = wb.getSheetAt(0);
		for (i = 1; i < sheet.getLastRowNum() + 1; i++) {
		    HSSFRow row = sheet.getRow(i);
		    Score score = scoreService.findByKH(ExcelUtils.getStringValue(row, 1));
		    if (score == null) {
			fail.add(ExcelUtils.getStringValue(row, 0));
			reasons
				.add(ExcelUtils.getStringValue(row, 0)
					+ "考生号不存在");
			continue;
		    } else {
			score.setYuwen(analysis(ExcelUtils.getStringValue(row,
				2)));
			score.setShuxu(analysis(ExcelUtils.getStringValue(row,
				3)));
			score.setYingyu(analysis(ExcelUtils.getStringValue(row,
				4)));
			score.setLishi(analysis(ExcelUtils.getStringValue(row,
				5)));
			score.setZhengzhi(analysis(ExcelUtils.getStringValue(
				row, 6)));
			score.setDili(analysis(ExcelUtils
				.getStringValue(row, 7)));
			score.setWuli(analysis(ExcelUtils
				.getStringValue(row, 8)));
			score.setHuaxue(analysis(ExcelUtils.getStringValue(row,
				9)));
			score.setShengwu(analysis(ExcelUtils.getStringValue(
				row, 10)));
			score.setXinxijishu(analysis(ExcelUtils.getStringValue(
				row, 11)));
			score.setTongyongjishu(analysis(ExcelUtils
				.getStringValue(row, 12)));
			score.setHkzongfen(Double.parseDouble(ExcelUtils
				.getStringValue(row, 13)));
			try {
			    scoreService.updateHK(score);
			    success.add(ExcelUtils.getStringValue(row, 0));
			} catch (Exception e) {
			    e.printStackTrace();
			    fail.add(ExcelUtils.getStringValue(row, 0));
			    reasons.add(ExcelUtils.getStringValue(row, 0)
				    + "无法导入成绩 - " + e.getMessage());
			}
		    }

		}

	    } catch (FileNotFoundException e) {
		e.printStackTrace();
	    } catch (IOException e) {
		e.printStackTrace();
	    } finally {
		ServletActionContext.getRequest().setAttribute("ff", fail);
		ServletActionContext.getRequest().setAttribute("r", reasons);
		ServletActionContext.getRequest().setAttribute("ss", success);
	    }
	}

	return "finsh";
    }
    // 导入Excel文件
    public String importExcelbs() throws ProjectException {
	success = new ArrayList<String>();
	fail = new ArrayList<String>();
	reasons = new ArrayList<String>();
	int i = 1;
	if (excel != null) {
	    try {
		HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(excel));
		HSSFSheet sheet = wb.getSheetAt(0);
		for (i = 1; i < sheet.getLastRowNum() + 1; i++) {
		    HSSFRow row = sheet.getRow(i);
		    Score score = scoreService.findByKH(ExcelUtils.getStringValue(row, 1));
		    if (score == null) {
			fail.add(ExcelUtils.getStringValue(row, 0));
			reasons
			.add(ExcelUtils.getStringValue(row, 0)
				+ "考生号不存在");
			continue;
		    } else {
			score.setBjyw(ExcelUtils.getIntCellValue(row, 2));
			score.setBjsx(ExcelUtils.getIntCellValue(row, 3));
			score.setBjyy(ExcelUtils.getIntCellValue(row, 4));
			try {
			    scoreService.updateBJ(score);
			    success.add(ExcelUtils.getStringValue(row, 0));
			} catch (Exception e) {
			    e.printStackTrace();
			    fail.add(ExcelUtils.getStringValue(row, 0));
			    reasons.add(ExcelUtils.getStringValue(row, 0)
				    + "无法导入成绩 - " + e.getMessage());
			}
		    }
		    
		}
		
	    } catch (FileNotFoundException e) {
		e.printStackTrace();
	    } catch (IOException e) {
		e.printStackTrace();
	    } finally {
		ServletActionContext.getRequest().setAttribute("ff", fail);
		ServletActionContext.getRequest().setAttribute("r", reasons);
		ServletActionContext.getRequest().setAttribute("ss", success);
	    }
	}
	
	return "finsh";
    }

    private int analysis(String str) {
	int m = 0;
	if ("B".equals(str)) {
	    m = 10;
	} else if ("A".equals(str)) {
	    m = 8;
	} else if ("C".equals(str)) {
	    m = 6;
	} else if ("D".equals(str)) {
	    m = 4;
	}
	return m;
    }

    public File getExcel() {
	return excel;
    }

    public void setExcel(File excel) {
	this.excel = excel;
    }

    public List<String> getSuccess() {
	return success;
    }

    public void setSuccess(List<String> success) {
	this.success = success;
    }

    public List<String> getFail() {
	return fail;
    }

    public void setFail(List<String> fail) {
	this.fail = fail;
    }

    public List<String> getReasons() {
	return reasons;
    }

    public void setReasons(List<String> reasons) {
	this.reasons = reasons;
    }

}
