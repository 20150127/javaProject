package cn.xyurp.system.util;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;

/**
 * @author lichao
 * @time Oct 28, 2009 5:34:26 PM
 * @description Excel帮助类	
 */
public class ExcelUtils {
   
	public static int getIntCellValue(HSSFRow row,int index){
		int rtn = 0;
		try {
		    HSSFCell cell = row.getCell((short)index);
		    rtn = (int)cell.getNumericCellValue();
		} catch (RuntimeException e) {
		}
		return rtn;
	}
	
	public static String getStringValue(HSSFRow row,int index){
		String rtn = "";
		try {
			HSSFCell cell = row.getCell((short)index);
			rtn = cell.getRichStringCellValue().getString();
			
		} catch (RuntimeException e) {
		}
		return rtn;
	}
}
