package com.qfw.api;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

import com.qfw.common.exception.BizException;
import com.qfw.common.log.LogFactory;

import javax.net.ssl.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.text.SimpleDateFormat;
import java.util.*;

public class SuanhuaUtil {

	private static Logger log = LogFactory.getInstance().getBusinessLogger();
	
//    final static private String apiURL = "http://localhost:8080/cpcs/api/v1/";
    final static private String apiURL = "https://test.suanhua.org/cpcs/api/v1/";//接口地址
//    final static private String apiURL2 = "http://localhost:8080/cpcs/api/v2/";//接口地址
//    final static private String apiURL2 = "http://188.188.42.165:8080/cpcs/api/v2/";

//    final static private String apiURL2 = "https://uat.suanhua.org/cpcs/api/v2/";//接口地址
    final static private String apiURL2 = "https://test.suanhua.org/cpcs/api/v2/";//接口地址


    final static private String fileDir = "D:/project/suanhua/suanhua_doc/B端系统/机构外部接口/";
    private static String charset = "utf-8";

    final static private String orgSecretKey = "PeE8OzS0EgIMYqz";//机构API私钥
    final static private String orgcode = "30440301201606001";//机构号

    final static private String certtype = "0";

    final static private String name = "XXX";
    final static private String certno = "XXXXX";
    final static private String sreason = "01";
    final static private String query = "1";

    private static String saccount = "T1234567890";

    public static void main(String[] args)throws Throwable {
//        for(String api:"2000,9001,6003".split(",")) {
//            testAPI(api);
//        }

//        testSHShare();
//        testSpecTradeQ();
//        testPersonCreditQ();
//        testQueryRecordQ();


//        testCreditReport();
//        testCreditBatch();
//        testCreditBatchQeruy();
//        testMsgUpload();
//        testMsgUploadQuery();
//        testWarning();
//        download("https://test.suanhua.org/cpcs/api/datasubmit/message/feedback/99370801201509001/993708012015090012015110351.zip/be09db11026211c6ee7c2f5c4ecab14c", null, "d://test.xls");
//        testPush();
        //testPbccrcQ();
    }

    static public String testPbccrcQ(String name,String idCard) {
    	try {
    		String url = apiURL2 + "pbccrc/report";
    		Map<String, String> param = new TreeMap<String, String>();
    		param.put("orgcode", orgcode);
    		param.put("name", name);
    		param.put("idCard", idCard);
    		hash(param);
    		String result = sendPost(url, param, "utf-8");
    		return result;
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.error(e.getMessage());
			}
			return null;
		}
    }


    //异常交易查询
    static void testSpecTradeQ() throws IOException {
        String url = apiURL2 + "spectrade/query/";
        Map<String, String> param = new TreeMap<String, String>();
        param.put("sorgcode", orgcode);
        param.put("name", name);
        param.put("certtype", certtype);
        param.put("certno", certno);
        param.put("sreason", sreason);
        param.put("query", query);
        hash(param);
        String result = sendPost(url, param, "utf-8");

        return;
    }

    //信贷信息查询
    static void testPersonCreditQ() throws IOException {
        String url = apiURL2 + "credit/query";
        Map<String, String> param = new TreeMap<String, String>();
        param.put("sorgcode", orgcode);
        param.put("saccount", saccount);
        param.put("name", name);
        param.put("certtype", certtype);
        param.put("certno", certno);
        param.put("sreason", sreason);
        hash(param);
        String result = sendPost(url, param, "utf-8");
        return;
    }

    //查询记录查询
    static void testSHShare() throws IOException {
        String url = apiURL2 + "shshare/query";
        Map<String, String> param = new TreeMap<String, String>();
        param.put("sorgcode", orgcode);
        param.put("name", name);
        param.put("certtype", certtype);
        param.put("certno", certno);
        hash(param);
        String result = sendPost(url, param, "utf-8");
        return;
    }

    //查询记录查询
    static void testQueryRecordQ() throws IOException {
        String url = apiURL2 + "qrecord";
        Map<String, String> param = new TreeMap<String, String>();
        param.put("sorgcode", orgcode);
        param.put("name", name);
        param.put("certtype", certtype);
        param.put("certno", certno);
        hash(param);
        String result = sendPost(url, param, "utf-8");
        return;
    }

    static void testPush() throws IOException {
        String url = "http://localhost:8080/cpcs/api/data/push/pbccrc";
        Map<String, String> param = new TreeMap<String, String>();
        param.put("orgcode", orgcode);
        param.put("data", "周立");
        param.put("hash", md5("eebf8a561e7c69dddd0acca0695320a8" + new Date().getYear() +
                param.get("data") + param.get("orgcode"), "UTF-8"));
        String result = sendPost(url, param, "UTF-8");
        return;
    }

    static void testAPI(String apicode) throws IOException {
        String url = apiURL2 + "channel/" + apicode;
        Map<String, String> param = new TreeMap<String, String>();
        param.put("sorgcode", orgcode);
        param.put("name", name);
        param.put("cardNum", "6770986465748335");
        param.put("idCard", certno);
        //param.put("compName", "融通汇信（北京）信息咨询有限公司");
        if("6003".equals(apicode)) {
            param.put("caseType", "ktgg");
            param.put("caseId", "AVBubHkZAzwuYsHSFCQ8");
        }
        if("9001".equals(apicode)) {
            param.put("address", "上海市宝山区行知路638弄");
        }
        hash(param);
        String result = sendPost(url, param, "UTF-8");
        return;
    }


    //单笔信用报告查询
    static void testCreditReport() {

        String url = apiURL + "creditreport/person";

        Map<String, String> param = new TreeMap<String, String>();

//        param.put("sorgcode", orgcode);
        param.put("iplateid", "110");
        param.put("scerttype", "0");
        param.put("scertno", "");
        param.put("sname", "");
        param.put("sreason", "01");
        hash(param);
        String result = sendPost(url, param, "UTF-8");
        return;
    }

    //批量信用报告查询
    static void testCreditBatch() throws IOException {

        String url = apiURL + "creditreport/person/batch";

        Map<String, String> param = new TreeMap<String, String>();
        param.put("sorgcode", orgcode);
        param.put("filename", "993708012015090012015091600200.txt");
        param.put("filebuff", byts2hexstr(FileUtils.readFileToByteArray(new File(fileDir + "993708012015090012015091600200.txt"))));
        hash(param);
        String result = sendPost(url, param, "UTF-8");
        return;
    }

    //批量信用报告查询状态查询
    static void testCreditBatchQeruy() throws IOException {

        String url = apiURL + "creditreport/person/batch/feedback";
        Map<String, String> param = new TreeMap<String, String>();
        param.put("sorgcode", orgcode);
        param.put("filename", "993708012015090012015091600200.txt");
        hash(param);
        String result = sendPost(url, param, "UTF-8");
        return;
    }

    //标准报文上送
    static void testMsgUpload() throws IOException {

        String url = apiURL + "datasubmit/message";
        Map<String, String> param = new TreeMap<String, String>();
        param.put("sorgcode", orgcode);
        param.put("filename", "993708012015090012015110321.zip");
        param.put("filebuff", byts2hexstr(FileUtils.readFileToByteArray(new File(fileDir + "993708012015090012015110321.zip"))));
        hash(param);
        String result = sendPost(url, param, "UTF-8");
        return;
    }

    //标准报文上送状态查询
    static void testMsgUploadQuery() throws IOException {

        String url = apiURL + "datasubmit/message/feedback";
        Map<String, String> param = new TreeMap<String, String>();
        param.put("sorgcode", orgcode);
        param.put("filename", "993708012015090012015090321.zip");
        hash(param);

        String result = sendPost(url, param, "UTF-8");
        return;
    }

    //报警想信息查询
    static void testWarning() throws IOException {
        String url = apiURL + "warning/has";
        Map<String, String> param = new TreeMap<String, String>();
        param.put("sorgcode", orgcode);
        hash(param);
        String result = sendPost(url, param, "UTF-8");
        return;
    }


    static private String getSeq() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Date today = new Date();
        return sdf.format(today) + today.getTime();
    }

    static private void hash(Map<String, String> param) {
        //param.put("sorgseq", getSeq());
        StringBuilder sb = new StringBuilder();
        Iterator iterator = param.keySet().iterator();
        while (iterator.hasNext()) {
            sb.append(param.get(iterator.next()));
        }
        param.put("hash", md5(sb.toString() + orgSecretKey, "UTF-8").toUpperCase());
    }

    static private String md5(String msg, String charset) {
        try {
            MessageDigest digest = MessageDigest.getInstance("md5");
            byte[] hashedBytes = digest.digest(msg.getBytes(charset));
            String rst = byts2hexstr(hashedBytes);
            return rst;
        } catch (Exception ex) {
        }
        return "";
    }

    private static String byts2hexstr(byte[] arrayBytes) {
        StringBuilder sb = new StringBuilder();
        String tmp = null;
        for (int i = 0; i < arrayBytes.length; i++) {
            tmp = Integer.toHexString(arrayBytes[i] & 0xff);
            sb.append(tmp.length() == 1 ? "0" + tmp : tmp);
        }
        return sb.toString();
    }

    public static String buildParams(Map<String, String> param, String charset) {
        if (param != null && !param.isEmpty()) {
            StringBuffer buffer = new StringBuffer();
            for (Map.Entry<String, String> entry : param.entrySet()) {
                try {
                    buffer.append(entry.getKey()).append("=")
                            .append(URLEncoder.encode(entry.getValue(), charset))
                            .append("&");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }
            return buffer.deleteCharAt(buffer.length() - 1).toString();
        } else {
            return null;
        }
    }

    public static String sendPost(String url, Map<String, String> param, String charset) {
        OutputStream out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            URLConnection conn = getConnection(realUrl);
            
            Map<String, String> defaultHeaders = new LinkedHashMap<String, String>();
            defaultHeaders.put("accept", "*/*");
            defaultHeaders.put("connection", "Keep-Alive");
            defaultHeaders.put("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = conn.getOutputStream();
            String p = buildParams(param, charset);
            if(p != null) {
                // 发送请求参数
                out.write(p.getBytes());
                // flush输出流的缓冲
                out.flush();
            }
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    conn.getInputStream(), charset));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    static public byte[] download(String url, Map<String, String> param, String savePath) {
        OutputStream out = null;
        InputStream in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            URLConnection conn = getConnection(realUrl);

            Map<String, String> defaultHeaders = new LinkedHashMap<String, String>();
            defaultHeaders.put("accept", "*/*");
            defaultHeaders.put("connection", "Keep-Alive");
            defaultHeaders.put("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");

            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = conn.getOutputStream();

            String p = buildParams(param, charset);
            if (p != null) {
                // 发送请求参数
                out.write(p.getBytes());
                // flush输出流的缓冲
                out.flush();
            }
            //读取响应数据
            in = conn.getInputStream();
            byte[] buff = new byte[1024];
            ByteArrayOutputStream baot = new ByteArrayOutputStream();
            int len;
            while ((len = in.read(buff)) != -1) {
                baot.write(buff, 0, len);
            }
            if (savePath != null) {//保存文件
                FileOutputStream fo = new FileOutputStream(savePath);
                fo.write(baot.toByteArray());
                fo.close();
            }
            return baot.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    static public HttpURLConnection getConnection(URL url) {
        HttpURLConnection connection = null;
        try{
            if(url.getProtocol().toUpperCase().startsWith("HTTPS")) {
                SSLContext ctx = SSLContext.getInstance("SSL");
                ctx.init(new KeyManager[0], new TrustManager[] {new X509TrustManager() {

                    @Override
                    public void checkClientTrusted(X509Certificate[] arg0,
                                                   String arg1) throws CertificateException {
                    }

                    @Override
                    public void checkServerTrusted(X509Certificate[] arg0,
                                                   String arg1) throws CertificateException {
                    }

                    @Override
                    public X509Certificate[] getAcceptedIssuers() {
                        return null;
                    }

                }}, new SecureRandom());


                HttpsURLConnection conn = (HttpsURLConnection)url.openConnection();
                conn.setSSLSocketFactory(ctx.getSocketFactory());
                conn.setConnectTimeout(10000);
                conn.setReadTimeout(10000);

                conn.setHostnameVerifier(new HostnameVerifier() {
                    @Override
                    public boolean verify(String hostname, SSLSession session) {
                        return true;
                    }
                });

                connection = conn;
            } else {
                connection = (HttpURLConnection) url.openConnection();
            }


        } catch(Exception e){
            e.printStackTrace();
        }

        return connection;
    }

}
