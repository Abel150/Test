package solrj;

import java.util.ArrayList;
import java.util.List;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;


import entity.Items;

public class SolrSearch {
private static final String URL="http://localhost:8983/solr/core1";
 private SolrServer solrServer=new HttpSolrServer(URL);
	public List search(String parame){
		List list=new ArrayList();
		try{
			SolrQuery query=new SolrQuery();
			query.setQuery(parame);
			QueryResponse rsp=solrServer.query(query);
			query.setHighlight(true);
			SolrDocumentList docs=rsp.getResults();
		//	System.out.println("文档个数："+docs.getNumFound());
			if(docs.size()==0){
				System.out.println("查询的对象为空");
			}
			else{
				for(SolrDocument doc:docs){
					Items its=new Items();
					String id=(String) doc.getFieldValue("id");
					String name=(String) doc.getFieldValue("name");
					String city=(String) doc.getFieldValue("city");
					int number=(int) doc.getFieldValue("number");
					int price=(int) doc.getFieldValue("price");
					String picture=(String) doc.getFieldValue("picture");
					query.addHighlightField(id);
					its.setId(id);
					its.setName(name);
					its.setCity(city);
					its.setNumber(number);
					its.setPrice(price);
					its.setPicture(picture);
				//	System.out.println(id);
					System.out.println(name);
					list.add(its);
				}
			}
		}catch(SolrServerException e){
			e.printStackTrace();
		}
		return list;
	}
	public static void main(String[] args) {
		SolrSearch search=new SolrSearch();
		String parame=new String("宏基");
		  parame="name:宏基笔记本";
		  List list=search.search(parame);
	//	  System.out.println(list.size());
	   }
}
