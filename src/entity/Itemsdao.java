package entity;

import java.util.ArrayList;

public class Itemsdao {
public static Items[] idao(){
	 UseMan itemsDao = new UseMan(); 
     ArrayList<Items> list = itemsDao.getAllItems();
     int ll=list.size(),i;
     Items item[]=new Items[ll];
     for(i=0;i<ll;i++)
     {   item[i]=new Items();
    	 item[i]= list.get(i);}
     if(list!=null&&list.size()>0)
         return item;
         return null;
}
public static String idaoId(int j){
       Items item[];
       item=idao();
      return item[j].getId();
}
public static String idaoPic(int j){
	  Items item[];
      item=idao();
    return item[j].getPicture();
}
public static String idaoName(int j){
	  Items item[];
      item=idao();
  return item[j].getName();
}
}
