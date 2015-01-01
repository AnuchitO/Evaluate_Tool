package com.spt.evt.exportExcel;

import com.spt.evt.service.ReportService;
import com.spt.evt.service.impl.ReportServiceImpl;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;


public class GenerateExcelServiceImpl extends AbstractPOIExcelView {
    private static final Logger LOGGER = LoggerFactory.getLogger(ReportServiceImpl.class);

    @Autowired
    private ReportService reportService;

    @Override
    protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        LOGGER.debug("Export Excel 55555555555555555555555555555555555");
        try {
            /*create Sheet*/
            XSSFSheet sheet = (XSSFSheet) workbook.getSheetAt(0);

            XSSFWorkbook xssfWorkbook = (XSSFWorkbook) workbook;

            /*create Row*/
    //        XSSFRow header = sheet.createRow(0);


            CellStyle style = xssfWorkbook.createCellStyle();
            Font font = xssfWorkbook.createFont();
            font.setFontHeightInPoints((short)14);
            font.setFontName("Arial");
            font.setColor(HSSFColor.BLACK.index);
            font.setBold(true);
            style.setFillForegroundColor(HSSFColor.LIGHT_ORANGE.index);
            style.setFillPattern(CellStyle.SOLID_FOREGROUND);
            style.setAlignment(CellStyle.ALIGN_LEFT);
            style.setFont(font);

            CellStyle style2 = xssfWorkbook.createCellStyle();
            Font font2 = xssfWorkbook.createFont();
            font2.setFontHeightInPoints((short)14);
            font2.setFontName("Arial");
            font2.setColor(HSSFColor.BLACK.index);
            font2.setBold(true);
            style2.setFillForegroundColor(HSSFColor.LIGHT_ORANGE.index);
            style2.setFillPattern(CellStyle.SOLID_FOREGROUND);
            style2.setAlignment(CellStyle.ALIGN_RIGHT);
            style2.setFont(font);

            CellStyle style3 = xssfWorkbook.createCellStyle();
            Font font3 = xssfWorkbook.createFont();
            font3.setFontHeightInPoints((short)10);
            font3.setFontName("Arial");
            font3.setColor(HSSFColor.BLACK.index);
            font3.setBold(true);
            style3.setFillForegroundColor(HSSFColor.BRIGHT_GREEN.index);
            style3.setFillPattern(CellStyle.SOLID_FOREGROUND);
            style3.setAlignment(CellStyle.ALIGN_LEFT);
            style3.setFont(font);

            CellStyle style4 = xssfWorkbook.createCellStyle();
            Font font4 = xssfWorkbook.createFont();
            font4.setFontHeightInPoints((short)10);
            font4.setFontName("Arial");
            font4.setColor(HSSFColor.BLACK.index);
            font4.setBold(true);
            style4.setFillForegroundColor(HSSFColor.BRIGHT_GREEN.index);
            style4.setFillPattern(CellStyle.SOLID_FOREGROUND);
            style4.setAlignment(CellStyle.ALIGN_RIGHT);
            style4.setFont(font);

            JSONObject json = (JSONObject) model.get("score");
            JSONArray subjectAll = new JSONArray(json.get("subject").toString());

            int rowCount = 0;
            int countSizeColume = 0;
            XSSFRow aRow = null;
            for (int j = 0; j < subjectAll.length(); j++) {
                countSizeColume++;
                aRow = sheet.createRow(rowCount++);

            /*Subject and averageScore*/
                aRow.createCell(0).setCellValue(subjectAll.getJSONObject(j).get("name").toString());
                aRow.createCell(1).setCellValue(subjectAll.getJSONObject(j).get("averageScore") + "%");
                aRow.getCell(0).setCellStyle(style);
                aRow.getCell(1).setCellStyle(style2);

            /*TopicArray*/
                JSONArray topicArray = new JSONArray(subjectAll.getJSONObject(j).get("topic").toString());

            /*Topic and score*/
                for (int k = 0; k < topicArray.length(); k++) {
                    countSizeColume++;
                    aRow = sheet.createRow(rowCount++);

                    aRow.createCell(0).setCellValue(topicArray.getJSONObject(k).get("name") + " : " + topicArray.getJSONObject(k).get("description"));
                    aRow.createCell(1).setCellValue(topicArray.getJSONObject(k).get("score").toString());

                }
            }
            aRow = sheet.createRow(rowCount + 1);
            aRow.createCell(0).setCellValue("AverageScore");
            aRow.createCell(1).setCellValue(json.get("averageScore").toString());
            aRow.getCell(0).setCellStyle(style3);
            aRow.getCell(1).setCellStyle(style4);

            sheet.setColumnWidth(1, 3000);
            for (int i = 0; i < countSizeColume; i++) {
                sheet.autoSizeColumn(0);
            }
//            try {
//                //Write the workbook in file system
//                FileOutputStream out = new FileOutputStream(new File("src/main/webapp/WEB-INF/exportExcel/Score.xlsx"));
//                workbook.write(out);
//                out.close();
//                LOGGER.debug("Written successfully on disk.");
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
            LOGGER.debug("ENDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}