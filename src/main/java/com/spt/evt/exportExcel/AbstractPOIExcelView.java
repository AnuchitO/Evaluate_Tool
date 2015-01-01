package com.spt.evt.exportExcel;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.context.ApplicationContextException;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.AbstractView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Locale;
import java.util.Map;

public abstract class AbstractPOIExcelView extends AbstractView {

    /** The content type for an Excel response */
    private static final String CONTENT_TYPE_XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
    private static final String CONTENT_TYPE_XLS = "application/vnd.ms-excel";

    private String url;
    /**
     * Default Constructor. Sets the content type of the view for excel files.
     */
    public AbstractPOIExcelView() {

    }


    protected boolean generatesDownloadContent() {
        return true;
    }

    /**
     * Renders the Excel view, given the specified model.
     */



    /**
     * Subclasses must implement this method to create an Excel Workbook.
     * HSSFWorkbook and XSSFWorkbook are both possible formats.
     */
    //protected abstract Workbook createWorkbook();


    protected void renderMergedOutputModel(Map model, HttpServletRequest request,HttpServletResponse response) throws Exception {
        // TODO Auto-generated method stub
        Workbook workbook = null;
        if (null != url ) {
            workbook = getTemplateSource(url, request,response);
        }
        else {
            workbook = new HSSFWorkbook();
        }

        if (workbook instanceof XSSFWorkbook) {
            setContentType(CONTENT_TYPE_XLSX);
        } else {
            setContentType(CONTENT_TYPE_XLS);
        }

        buildExcelDocument(model, workbook, request, response);
        // Set the content type.
        response.setContentType(getContentType());

        // Flush byte array to servlet output stream.
        ServletOutputStream out = response.getOutputStream();
        out.flush();
        workbook.write(out);
        out.flush();

        // Don't close the stream - we didn't open it, so let the container
        // handle it.
        // http://stackoverflow.com/questions/1829784/should-i-close-the-servlet-outputstream
    }


    /**
     * Subclasses must implement this method to create an Excel HSSFWorkbook
     * document, given the model.
     *
     * @param model
     *            the model Map
     * @param workbook
     *            the Excel workbook to complete
     * @param request
     *            in case we need locale etc. Shouldn't look at attributes.
     * @param response
     *            in case we need to set cookies. Shouldn't write to it.
     */
    protected abstract void buildExcelDocument(Map<String, Object> model, Workbook workbook,
                                               HttpServletRequest request, HttpServletResponse response) throws Exception;

    /**
     * Sets the url.
     * @param url The Excel workBook source without localization part nor extension
     */
    public void setUrl(String url) {
        this.url = url;
    }

    protected Workbook getTemplateSource(String url, HttpServletRequest request,HttpServletResponse response) {
        String source = null;
        String realPath = null;
        FileInputStream inputFile = null;
        Locale userLocale = RequestContextUtils.getLocale(request);
        String lang = userLocale.getLanguage();
        String country = userLocale.getCountry();

        // Check for document without localisation
        if (url.toUpperCase().indexOf(".XLS") < 0) {
            url += ".xls";
        }

        realPath = ((WebApplicationContext) getApplicationContext()).getServletContext().getRealPath(url);
        try {
            File file = new File(realPath);
            response.addHeader("Content-Disposition","attachment; filename="+file.getName());
            inputFile = new FileInputStream(realPath);
        }
        catch (FileNotFoundException e) {
            throw new ApplicationContextException(
                    "Can't resolve real path for EXCEL template at '"
                            + source
                            + "'; probably results from container restriction: override ExcelView.getTemplateSource() to use an alternative approach to getRealPath()");
        }

        // Create the Excel document from source
        try {
            Workbook workBook = null;
            if(url.toUpperCase().endsWith(".XLS")){
                workBook = new HSSFWorkbook(inputFile);
            }else{
                workBook = new XSSFWorkbook(inputFile);
            }
            logger.info("Loaded Excel workBook " + source);
            return workBook;
        }catch (IOException e) {
            throw new ApplicationContextException("IOException with '" + source + "': " + e.getMessage());
        }
    }

}