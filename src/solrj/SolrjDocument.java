package solrj;

import java.util.*;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;

public class SolrjDocument {

	private static final String URL="http://localhost:8080/solr/core1";
	SolrServer server=null;
	public void addDoc(){
		try{
			server=getSolrServer();
			Collection docs=new ArrayList();
			server.deleteByQuery("*:*");
			SolrInputDocument doc1=new SolrInputDocument();
			doc1.addField("id","20");
			doc1.addField("name","联想T300");
			doc1.addField("city","合肥");
			doc1.addField("number",43);
			doc1.addField("price",3424);		
			doc1.addField("picture","pc4.jpg");
			
			SolrInputDocument doc2=new SolrInputDocument();
			doc2.addField("id","2");
			doc2.addField("name","三星笔记本");
			doc2.addField("city","福州");
			doc2.addField("number",800);
			doc2.addField("price",3500);			
			doc2.addField("picture","11.jpg");
			
			docs.add(doc1);
			docs.add(doc2);
			server.add(docs);
			server.commit();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//查询服务器
	public void getQuery(){
		try{
			SolrServer server=getSolrServer();
			SolrQuery query=new SolrQuery();
			query.setQuery("*:*");
			QueryResponse results=server.query(query);
			SolrDocumentList docs= results.getResults();
			System.out.println("docs的大小是："+docs.size());
			for(int i=0;i<docs.size();i++){
				SolrDocument doc=docs.get(i);
				System.out.println(doc.getFieldValue("id"));
				System.out.println(doc.getFieldValue("name"));
				System.out.println(doc.getFieldValue("city"));
				System.out.println(doc.getFieldValue("price"));
				System.out.println(doc.getFieldValue("number"));
				System.out.println(doc.getFieldValue("picture"));
				
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	public SolrServer getSolrServer(){
		try{
			return new HttpSolrServer(URL);
		}catch(Exception ex){
			return null;
		}
	}	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
    SolrjDocument docsolr=new SolrjDocument();
    docsolr.addDoc();
    docsolr.getQuery();
	}

}
