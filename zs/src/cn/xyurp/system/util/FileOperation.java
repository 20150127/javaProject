package cn.xyurp.system.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileOperation {

	/**
	 * ɾ���ļ�
	 * 
	 * @param filePathAndName
	 *            String �ļ�·�������� ��c:/fqf.txt
	 * @param fileContent
	 *            String
	 * @return boolean
	 */
	public static boolean delFile(String filePathAndName) {
		File myDelFile = new java.io.File(filePathAndName);
		if (!myDelFile.exists()) {
			return true;
		}
		return myDelFile.delete();
	}
	
	/**
	 * ɾ��ָ���ļ�·������������ļ����ļ���
	 * 
	 * @param file
	 */
	public static boolean delFiles(File file) {
		boolean flag = false;
		try {
			if (file.exists()) {
				if (file.isDirectory()) {
					String[] contents = file.list();
					for (int i = 0; i < contents.length; i++) {
						File file2X = new File(file.getAbsolutePath() + "/" + contents[i]);
						if (file2X.exists()) {
							if (file2X.isFile()) {
								flag = file2X.delete();
							} else if (file2X.isDirectory()) {
								delFiles(file2X);
							}
						} else {
							throw new RuntimeException("File not exist!");
						}
					}
				}
				flag = file.delete();
			} else {
				throw new RuntimeException("File not exist!");
			}
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * �ж��ļ����Ƿ��Ѿ����ڣ�����������ں����(n)����ʽ�����µ��ļ��������򷵻�ԭʼ�ļ��� ���磺�Ѿ������ļ��� log4j.htm
	 * �򷵻�log4j(1).htm
	 * 
	 * @param fileName
	 *            �ļ���
	 * @param dir
	 *            �жϵ��ļ�·��
	 * @return �жϺ���ļ���
	 */
	public static String checkFileName(String fileName, String dir) {
		boolean isDirectory = new File(dir + fileName).isDirectory();
		if (FileOperation.isFileExist(fileName, dir)) {
			int index = fileName.lastIndexOf(".");
			StringBuffer newFileName = new StringBuffer();
			String name = isDirectory ? fileName : fileName.substring(0, index);
			String extendName = isDirectory ? "" : fileName.substring(index);
			int nameNum = 1;
			while (true) {
				newFileName.append(name).append("(").append(nameNum).append(")");
				if (!isDirectory) {
					newFileName.append(extendName);
				}
				if (FileOperation.isFileExist(newFileName.toString(), dir)) {
					nameNum++;
					newFileName = new StringBuffer();
					continue;
				}
				return newFileName.toString();
			}
		}
		return fileName;
	}
	
	/**
	 * �ϴ��ļ��������ϴ�����ļ���
	 * 
	 * @param uploadFileName
	 *            ���ϴ����ļ�����
	 * @param savePath
	 *            �ļ��ı���·��
	 * @param uploadFile
	 *            ���ϴ����ļ�
	 * @return �ɹ����
	 * @throws IOException
	 */
	public static String uploadForName(String uploadFileName, String savePath, File uploadFile) throws IOException {
		String newFileName = checkFileName(uploadFileName, savePath);
		FileOutputStream fos = null;
		FileInputStream fis = null;
		try {
			fos = new FileOutputStream(savePath + newFileName);
			fis = new FileInputStream(uploadFile);
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = fis.read(buffer)) > 0) {
				fos.write(buffer, 0, len);
			}
		} catch (FileNotFoundException e) {
			throw e;
		} catch (IOException e) {
			throw e;
		} finally {
			try {
				if (fos != null) {
					fos.close();
				}
				if (fis != null) {
					fis.close();
				}
			} catch (IOException e) {
				throw e;
			}
		}
		return newFileName;
	}
	
	/**
	 * �ж��ļ��Ƿ����
	 * 
	 * @param fileName
	 * @param dir
	 * @return
	 */
	public static boolean isFileExist(String fileName, String dir) {
		File files = new File(dir + fileName);
		return (files.exists()) ? true : false;
	}
}
