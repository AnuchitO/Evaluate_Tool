package com.spt.evt.service.impl;

import com.spt.evt.service.GenerateExcelService;

import org.apache.poi.ss.usermodel.Cell;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.util.*;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

@Service
public class GenerateExcelServiceImpl implements GenerateExcelService{
    private static final Logger LOGGER = LoggerFactory.getLogger(ReportServiceImpl.class);

    @Override
    public JSONObject generateExcel(JSONObject subject){
        JSONObject xx = new JSONObject();

        /*creat workbook*/
        HSSFWorkbook workbook = new HSSFWorkbook();
        /*create Sheet*/
        HSSFSheet sheet = workbook.createSheet("ScoreSubject Data");
        /*create Data*/
        Map<Integer, Object[]> data = new TreeMap<Integer, Object[]>();

        JSONArray subjectAll = new JSONArray(subject.get("subject").toString());

            int genKey=0;
            for (int j=0;j<subjectAll.length();j++){
                /*Subject*/
//                LOGGER.debug("SubJect ::: "+subjectAll.getJSONObject(j).get("name"));
//                LOGGER.debug("AverageScore ::: "+subjectAll.getJSONObject(j).get("averageScore"));
//                List<JSONObject> listSubject = (List<JSONObject>) subjectAll.getJSONObject(j).get("name");

                data.put(genKey, new Object[]{subjectAll.getJSONObject(j).get("name"), subjectAll.getJSONObject(j).get("averageScore") + "%"});

                /*TopicArray*/
                JSONArray topicArray = new JSONArray(subjectAll.getJSONObject(j).get("topic").toString());


                /*Topic*/
                for (int k=0;k<topicArray.length();k++){
                    genKey++;
//                    LOGGER.debug("Topic ::: "+topicArray.getJSONObject(k).get("name")+" : "+
//                            topicArray.getJSONObject(k).get("description"));
//                    LOGGER.debug("Score ::: "+topicArray.getJSONObject(k).get("score"));

                    data.put(genKey,new Object[]{topicArray.getJSONObject(k).get("name")+" : "+topicArray.getJSONObject(k).get("description"),topicArray.getJSONObject(k).get("score")});

                }
            }
        Set<Integer> keyset = data.keySet();
        int rownum = 0;
        for (Integer key : keyset)
        {
            HSSFRow row = sheet.createRow(rownum++);
            Object [] objArr = data.get(key);
            int cellnum = 0;
            for (Object obj : objArr)
            {
                Cell cell = row.createCell(cellnum++);
                if(obj instanceof String)
                    cell.setCellValue((String)obj);
                else if(obj instanceof Integer)
                    cell.setCellValue((Integer)obj);
            }
        }
        try
        {
            //Write the workbook in file system
            FileOutputStream out = new FileOutputStream(new File("ScoreAll.xlsx"));
            workbook.write(out);
            out.close();
            System.out.println("Written successfully on disk.");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }


        return xx ;
    }

}